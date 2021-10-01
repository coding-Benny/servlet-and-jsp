package com.edu.test;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/*
 * 모든 서블릿 클래스의 상위 클래스는 HttpServlet으로, 서블릿이 웹상에서 HTTP 프로토콜을 이용해 서비스를 처리하기 위해 반드시 상속받아야 함.
 */
public class FirstServlet extends HttpServlet {
    /*
     * 서블릿이 최초로 호출되었을 때 서블릿 컨테이너가 자동으로 실행하는 메소드.
     * 서블릿 객체 생성 후 한 번만 실행되므로 서블릿 초기화 작업 담당.
     */
    @Override
    public void init() throws ServletException {
        System.out.println("init() 실행됨!");
    }

    /*
     * 클라이언트의 요청이 있을 때마다 서블릿 컨테이너가 자동으로 실행.
     * 이 메소드가 끝나면 서버에서의 실행은 끝나고 서블릿 컨테이너가 실행 결과를 웹서버에 전달해 클라이언트에 응답.
     */
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        System.out.println("service() 실행됨!");
    }
}
