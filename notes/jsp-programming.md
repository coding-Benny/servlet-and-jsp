# JSP(JavaServer Pages)란?
- 동적인 웹 콘텐츠를 생성하기 위한 웹 애플리케이션 개발 기술
- 서블릿도 동적 웹 콘텐츠를 생성할 수 있지만 HTML 문서 자체를 생성하는 부분이 섞여 있어 사소한 수정 작업만으로도 재컴파일이 필요하고 디자이너와의 작업 분담이 어려운 단점이 존재
- JSP는 이러한 단점을 보완하는 기술로 고안된 자바 기반 스크립트 언어
### 템플릿 데이터
- 텍스트나 XML 조각, HTML 태그들 같이 고정된 데이터
- JSP에서는 이러한 부분을 해석하지 않고 그대로 출력 
### 동적인 데이터의 추가
- 내장객체, 표현식(expression)과 EL(Expression Language)를 제공하여 동적인 콘텐츠를 쉽게 작업 가능 
    ```java
    <HTML lang="en">
    <BODY>
        <H1>Hello World</H1>
        <%= request.getParameter("name") %>
    </BODY>
    </HTML>
    ```
  
### 기능의 추상화
- 추상화
  - 객체지향 프로그램에서 사용하는 언어
  - 세부 구현은 숨기고 기능을 사용할 수 있도록 구현해 재사용성을 높이는 기술
  - 메커니즘
    - 자바빈즈(JavaBeans) 컴포넌트 아키텍처
    - 태그 라이브러리
    
## JSP 장점
### Write Once, Run Anywhere properties
플랫폼에 무관하고 JSP 스펙을 지원하는 어떠한 웹 애플리케이션 서버에서도 동작할 뿐만 아니라 어떠한 웹 브라우저로도 접근할 수 있다.
### 역할 분리
프레젠테이션 기능과 비즈니스 로직을 분리하여 개발자와 디자이너의 역할 분리 가능
### 컴포넌트와 태그 라이브러리의 재사용
생산성 향상을 위한 방법 중 하나는 재사용성인데 JSP는 자바빈즈 컴포넌트, EJB, 태그 라이브러리 등을 제공함에 따라 재사용이 용이함.
### 정적 콘텐츠와 동적 콘텐츠의 분리
JSP 태그로 처리된 부분 이외에는 정적 콘텐츠로 처리되어 콘텐츠 생성 작업을 간단하게 해 줌.
### 액션, 표현식, 스크립팅 제공
#### 액션(Action)
내장 객체, 혹은 서버 측 객체와 상호 동작할 수 있도록 유용한 기능을 추상화한 표준 태그
#### 표현식(Expression)
데이터에 접근하기 위해 제공
#### 스크립팅 요소(Scripting Elements)
기능들을 엮어 새로운 콘텐츠를 생성해 낼 수 있도록 페이지 내에 자바 코드를 삽입할 수 있는 영역 제공 
### N-tier 엔터프라이즈 애플리케이션을 위한 웹 접근 레이어
대규모 웹 애플리케이션은 대부분 아키텍처를 여러 레이어로 분리하는데 JSP 기술은 데이터를 프레젠테이션 하기 위한 웹 접근 레이어의 역할을 담당할 수 있음.
## JSP 동작 원리
![JSP 동작 원리](https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcuaI7I%2FbtqEwRYslXe%2FtinrWC90VkGF9p2gH7Lc0K%2Fimg.png)
1. 개발자가 HTML 태그와 JSP 태그를 사용하여 작성한 `*.jsp`는 서블릿으로서 동작
2. 클라이언트로부터 JSP 요청이 들어오면, JSP 컨테이너는 태그로 만들어진 JSP 파일을 완벽한 자바 소스(`*.java`)로 변환
3. JSP 컨테이너는 `*.jsp` 파일을 변환한 `*.java` 파일을 컴파일하여 `*.class` 파일을 생성
4. 컴파일된 자바 실행 파일은 서블릿 컨테이너에 의해 서블릿으로서 동작
5. 변환과 컴파일 작업은 최초 요청이나 JSP가 변경되었을 때만 수행
## 자바 서블릿 소스
### `_jspService()` 메소드
- JSP가 실행될 때마다 자동으로 호출되는 메소드
- 어떤 JSP든지 자바 소스로 변환하면 반드시 `_jspService()` 메소드가 삽입된다.
# 스크립트 기반 태그
- `<% %>`로 둘러싸여져 있는 것이 특징
- JSP 태그의 자바 소스 변환
  ![JSP 태그의 자바 소스 변환](https://blog.kakaocdn.net/dn/bvfwN6/btqEwgj8PCW/hf5iAOnaZKLDhH754KtI61/img.png)
- JSP 스크립트 태그
  - `<%@ ... %>`: 페이지에 대한 정보 설정
  - `<%! ... %>`: 멤버변수 또는 메소드 선언
  - `<% ... %>`: `_jspService()` 내에 그대로 옮겨짐
  - `<%= ... %>`: `_jspService()` 내에 그대로 옮겨짐. 단, `out.print();`로 변경됨.
## 지시자
- JSP 컨테이너가 JSP 페이지를 파싱하여 자바 소스로 변환하는데 필요한 정보를 알려주기 위해 사용
- 구문: `<%@ 지시자 속성 = 값 %>` 
### page 지시자
- 컨테이너가 참조하는 다양한 정보 중에서 JSP 페이지에 종속적인 설정 정보들을 알려주기 위한 수단
- `contentType` 속성: 웹 브라우저에 전송되는 문서의 타입과 문자코드를 지정
  - 디폴트는 ISO-8859-1로 한글 미지원하므로 `charset` 값을 UTF-8로 설정
- `import` 속성
  - `import = "패키지명.파일명"`
  - 콤마를 구분자로 여러 패키지명 나열하여 포함시킬 수 있음
  - 다음 패키지들은 JSP 페이지에서 서블릿 소스로 변환 시 자동으로 포함되므로 별도 지정 필요 없음
    - `import javax.servlet.*;`
    - `import javax.servlet.http.*;`
    - `import javax.servlet.jsp.*;`
  
- `errorPage`와 `isErrorPage` 속성
  - `errorPage = "파일명"`
  - `isErrorPage = "true/false"`
    - `true`이면 현재 페이지는 오류 처리 페이지로 설
  - JSP 페이지에서 오류가 발생했을 때 오류를 처리하기 위한 속성
- `trimDirectiveWhitespaces` 속성
  - `trimDirectiveWhitespaces = "true/false"`
  - 소스 파일에 빈 줄이 생성되는 것을 조절하기 위한 속성
  - 디폴트는 `false`
- `pageEncoding` 속성
  - `pageEncoding = "문자코드"`
  - JSP 소스 저장 시 사용할 문자코드 지정
  - 생략하면 `contentType` 속성의 `charset`에 지정된 값으로 설정
- `session` 속성
  - `session = "true/false`
  - JSP 페이지의 세션 관리 처리 여부 지정
  - 디폴트는 `true`