# Web application
## 0. Servlet
- 주로 웹서버에서 동작하는 애플리케이션을 구현할 때 사용
- 과거에는 CGI(Common Gateway Interface)라는 웹서버에서 외부 프로그램을 호출하면 수행 결과를 브라우저로 전송하는 기술을 사용
    - 동시 접속자가 많아질수록 처리 효율 저하(응답 시간 증가)
- 이에 따라 등장하게 된 서블릿은 클라이언트에 서비스하기 위한 목적으로 만들어짐
## 1. 웹 애플리케이션 접근
`http://12.34.567.89:8080/edu/index.jsp` 라는 URL이 있다고 가정하자.
- `12.34.567.89`: 웹 애플리케이션을 서비스하는 웹서버가 설치된 컴퓨터 주소. IP 주소나 도메인 이름으로 지정한다.
- `:8080`: 서버를 찾아가기 위한 포트 번호. 컴퓨터 주소로 찾은 컴퓨터에서 웹서버를 찾는데 사용한다.
- `/edu`: 애플리케이션명. 웹서버는 애플리케이션 단위로 서비스한다.
- `/index.jsp`: 클라이언트가 요청한 최종 문서정보. 파일시스템의 디렉터리 구조 형태로 지정된다.
## 2. 웹 애플리케이션 구조
![Web application structure](https://user-images.githubusercontent.com/51183274/135567950-3fb0aa90-c45a-41bf-b774-0d70d53d60a0.png)
- 웹 애플리케이션은 하나의 디렉터리로 이 안에 서비스하려는 문서들을 만들어 놓으면 웹에서 서비스 됨.
- 반드시 모든 웹 애플리케이션이 공통적으로 가져야 하는 디렉터리와 파일
    - `/WEB-INF/web.xml`: 환경설정
    - `/WEB-INF/classes/*`: 웹 애플리케이션에서 서비스하려는 클래스 파일
    - `/WEB-INF/lib/*`: jar로 압축된 클래스 파일들
- web.xml과 클래스 파일을 제외한 다른 파일들은 어디에 있으나 무관
## 3. 환경설정 파일: web.xml
- web.xml은 웹 애플리케이션의 서비스 처리에 관련된 내용이 정의된 파일
- 웹서버가 서비스를 구동할 때 web.xml 파일을 읽어 클라이언트에 서비스하기 위한 웹 애플리케이션을 준비하는 작업을 수행
- 직접 만들지 않은 웹 애플리케이션을 유지보수해야 한다면 제일먼저 web.xml을 비롯한 환경설정 파일들을 분석해야 함.
    - 순수 웹 애플리케이션으로 개발된 경우 web.xml 분석만으로도 전체 흐름 파악 용이
- 잘못 정의한 web.xml은 서비스에 필요한 준비 설정을 올바르게 할 수 없어 애플리케이션 내 모든 파일들이 서비스되지 않음.
# 서블릿 구현
## 1. 서블릿 클래스 간의 관계
- 서블릿을 구현할 때 반드시 상속받아야 하는 클래스: **HttpServlet**
    - 웹상에서 클라이언트 요청이 있을 때 해당 서블릿을 실행하는 모든 조건이 포함되어 있음
- 서블릿 프로그램의 클래스 계층 구조

  ![image](https://user-images.githubusercontent.com/51183274/135569555-abbfdb53-9111-4fdd-9d8f-f7b0b5499d00.png)
### Servlet 인터페이스
- 서블릿 프로그램을 개발할 때 반드시 구현해야 하는 메소드를 선언하고 있는 인터페이스
- 서블릿 프로그램의 실행주기와 연간된 메소드들을 선언
    - `init()`
    - `service()`
    - `destroy()`
    - `getServletConfig()`
    - `getServletInfo()`
### GenericServlet 클래스
- Servlet 인터페이스를 상속하여 클라이언트-서버 환경에서 서버단의 애플리케이션으로써 필요한 기능을 구현한 추상 클래스
- `service()` 메소드를 제외한 모든 메소드를 재정의하여 적절한 기능으로 구현
- 이 클래스를 상속하면 애플리케이션의 프로토콜에 따라 메소드 재정의 구문을 적용해야 함.
### HttpServlet 클래스
- GenericServlet 클래스를 상속하여 `service()` 메소드를 재정의함으로써 HTTP 프로토콜에 알맞은 동작을 수행하도록 구현한 클래스
- HTTP 프로토콜 기반으로 브라우저로부터 요청을 전달받아 처리하는 클래스
- `service()` 메소드에는 요청방식에 따라 정해진 사양의 메소드가 호출되도록 구현되어 있음.
- 반드시 재정의해야 하는 메소드는 없고 요청 방식에 따라 필요한 메소드를 재정의하여 구현
## 2. 서블릿 실행 순서
Java EE 기반 프로그램은 실행의 흐름을 컨테이너가 제어하는 제어의 역전(IOC; Inversion of Control)이 발생한다.
따라서 애플리케이션 컨테이너들이 프로그램을 어떤 순서로 동작시키는지 이해하고 해당 순서에 맞게 개발해야 한다.
![Servlet life cycle](https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile27.uf.tistory.com%2Fimage%2F99F550385B03D4BA320613)
## 3. 콜백 메소드와 서블릿 객체의 생명주기
- 콜백 메소드(callback method): 어떤 객체에서 어떤 상황이 발생하면 컨테이너가 자동으로 호출하여 실행되는 메소드
  - HttpServlet을 상속받아 재정의한 `init()`, `service()`
  - GenericServlet에 선언된 `destroy()`
### 서블릿 객체의 생성
- **서버 입장**에서 클라이언트로부터 최초로 서블릿 실행 요청이 있을 때 `init()` → `service()`
- 요청이 최초인지 판단하는 기준: 객체 생성 여부
- 최초 아니면 한 번 생성한 객체를 재사용하고 `service()`만 실행하여 처리속도, 메모리 부분에서 효율적 
### 서블릿 객체의 삭제
- 서버를 중지시켜 웹 애플리케이션 서비스를 중지할 때 `destroy()` 호출하여 자원 해제
## 4. 서블릿 실행
- `/WEB-INF`는 웹서버가 사용하는 파일이 들어있는 중요한 디렉터리이므로 외부에서 클라이언트가 곧바로 접근하는 것을 막아둠
- 접근 방법
  1. `web.xml` 설정: 여러 개의 서블릿을 태그로 등록해 전체적인 관리가 용이하고 URL 변경도 소스 수정 없이 쉽게 변경 가능 
      ```xml  
      <!-- 실행할 서블릿을 웹서버에 등록 -->
      <servlet>
        <servlet-name></servlet-name>
        <servlet-class></servlet-class>
      </servlet>
     <!-- <servlet>으로 등록한 서블릿을 실행할 URI 지정 -->
     <servlet-mapping>
       <servlet-name></servlet-name>
       <url-pattern></url-pattern>
     </servlet-mapping>
      ```
  2. @WebServlet: 자바 소스에서 설정파일 없이 쉽게 URL 패턴을 지정할 수 있지만 하나의 자바 소스에 하나의 서블릿 매핑만 가능해 유지보수성 저하 및 URL 값 변경 시 재컴파일 필요
      ```java
      import javax.servlet.annotation.WebServlet;
      import javax.servlet.http.*;
      
      @WebServlet("/hello")
      public class FirstServlet extends ttpServlet {
            ~ 생략 ~
      }
      ```
     
- 요청방식에 따른 실행: HttpServlet에서 구현된 `service()` 메소드를 그대로 실행하고 싶을 때
  ```java
  protected void service(HttpServletRequest req, HttpServletResponse res)  // 클라이언트의 실행 요청에 따라 서로 다른 메소드를 호출 
  public void service(ServletRequest req, ServletResponse res)  // 요청 때마다 실행
  ```