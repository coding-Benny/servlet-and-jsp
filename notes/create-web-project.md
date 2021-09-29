# 웹 프로젝트 생성하기 with IntelliJ
학교에서도 지금 참고하고 있는 책도 이클립스를 사용하지만,, 인텔리제이로 하고 싶어서 찾아본 웹 프로젝트(Dynamic Web Project) 생성 방법

<ol>
  <li>File > New > Project → <i>Maven</i> 선택 → <i>Create from archetype</i> 체크 → <code>org.apache.maven.archetypes:maven-archetype-webapp</code> 선택</li>
  <ul>
    <li><i>Create from archetype</i>을 체크해야 하단의 archetype을 선택할 수 있게 활성화 된다.</li>
    <li>일부 단어를 입력하면 해당 부분을 highlighting 해서 원하는 archetype을 빠르게 찾을 수 있다.</li>
    <li>원하는 archetype이 리스트에 없어서 다음과 같은 에러 메세지가 뜨면 <code>mvn install archetype:update-local-catalog</code>를 터미널에 입력해보자.</li>
    <ul>
      <li><i>The desired archetype does not exist.</i></li>
      <li><i>Archetype not found in any catalog. Falling back to central repository.</i></li>
    </ul>
    <li>원하는 archetype을 잘 선택했는지 확인하고 NEXT로 넘어가자.</li>
  </ul>
  <img src="https://user-images.githubusercontent.com/51183274/135286454-8e8cc9ba-d2e4-4fdd-b24a-152830d00bde.png" width=700>

  <li>프로젝트명 입력</li>
  <img src="https://user-images.githubusercontent.com/51183274/135291025-1cb84f4c-8845-47f7-ae91-f04064673301.png" width=400>
  
  <li>원하는 archetype이 잘 선택되었는지 확인하고 FINISH</li>
  <img src="https://user-images.githubusercontent.com/51183274/135291776-6c2929b2-5557-4aec-aa48-9e0958de3016.png" width=400>
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
</ol>
