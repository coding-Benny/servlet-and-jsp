# 웹 프로젝트 생성하기 with IntelliJ
학교에서도 지금 참고하고 있는 책도 이클립스를 사용하지만,, 인텔리제이로 하고 싶어서 찾아본 웹 프로젝트(Dynamic Web Project) 생성 방법

<ol>
  <li>File > New > Project → Java → 아무것도 선택하지 않고 NEXT
  <img src="https://user-images.githubusercontent.com/51183274/135700301-3a4bfaed-8a3b-4b6a-a766-9cb991c889b1.png" width=600>

  <li>역시 아무것도 선택하지 않고 NEXT</li>
  <img src="https://user-images.githubusercontent.com/51183274/135700330-cb445f80-c2f5-4972-aa06-94454c8b3bfb.png" width=600>

  <li>프로젝트명 입력하고 FINISH</li>
  <img src="https://user-images.githubusercontent.com/51183274/135700213-23e02eba-7783-4c95-8d9b-2922c7effa57.png" width=600>
  
  <li>프로젝트명 우클릭 후 Add Framework Support...</li>
  <img src="https://user-images.githubusercontent.com/51183274/135700359-865876e7-767e-4b05-aaae-bf6842220e0e.png" width=600>
  
  <li>Web Application과 WebServices를 체크</li>
  <ul>
    <li>WebServices에서는 Generate sample server code 체크 해제, Version은 Apache Axis, Library는 Set up library later를 선택하고 OK</li>
  </ul>
  <img src="https://user-images.githubusercontent.com/51183274/135700404-2f3cb76f-33b2-47b9-85b0-758a07628125.png" width=600>
</ol>


## 실행할 서버 설정
Apache Tomcat으로 프로젝트를 실행하기 위해서는 설정이 필요하다.
<ol>
  <li>우측 상단의 ADD CONFIGURATION을 선택</li>
  <img src="https://user-images.githubusercontent.com/51183274/135293251-df6e91dd-dd54-49fc-b86f-c5f2ab17ca02.png" width=700>
  <li>추가(+) 버튼 → Tomcat Server/Local(검색 추천)</li>
  <ul>
    <li>CONFIGURE 버튼을 눌러 Tomcat 디렉토리 설정</li>
    <li>VM options에 인코딩 설정: <code>-Dfile.encoding=UTF-8</code></li>
    <li>No artifacts marked for development라는 warning이 발생하면 Fix 버튼 → <code>플젝명:war exploded</code> 선택 → OK</li>
  </ul>
  <img src="https://user-images.githubusercontent.com/51183274/135294433-d0749615-ea51-47f8-9d10-f0e4bba9280d.png" width=700>
  
  <li>Tomcat을 실행하면 <code>http://localhost:8080/프로젝트명_war_exploded</code>로 뜨는데 Application Context를 변경하면 <code>http://localhost:8080/프로젝트명</code>와 같이 원하는대로 변경할 수 있다.</li>
  <img src="https://user-images.githubusercontent.com/51183274/135700668-ccaead6d-96d4-48f8-af80-98afb4d561b0.png" width=700>
</ol>
