<%--
  Created by IntelliJ IDEA.
  User: benny
  Date: 2021/10/03
  Time: 11:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.edu.biz.MemberService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- post 방식으로 전달될 파라미터의 값들을 인코딩 --%>
<%
    request.setCharacterEncoding("UTF-8");
%>

<%-- Member 객체를 생성해서 모든 setter 메소드 호출 --%>
<jsp:useBean id="member" class="com.edu.beans.Member" />
<jsp:setProperty property="*" name="member" />

<%
    // 실제 회원에 대한 서비스 처리: 회원가입
    MemberService service = new MemberService();
    service.memberInsert(member);

    // 서비스 처리가 끝나고 처리 결과 페이지로 이동
    RequestDispatcher rd = request.getRequestDispatcher("memberOutput.jsp");
    rd.forward(request, response);
%>
