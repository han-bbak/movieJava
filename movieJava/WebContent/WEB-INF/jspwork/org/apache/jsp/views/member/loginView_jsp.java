/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.61
 * Generated at: 2021-02-03 05:47:22 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class loginView_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.5.1.min.js\"\r\n");
      out.write("        integrity=\"sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <title>무비자바(MovieJava) - 로그인</title>\r\n");
      out.write("    <style>\r\n");
      out.write("        html {\r\n");
      out.write("            height: 100%;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        body {\r\n");
      out.write("            height: 100%;\r\n");
      out.write("            padding: 0px;\r\n");
      out.write("            margin: 0 auto;\r\n");
      out.write("            line-height: 1;\r\n");
      out.write("            background: rgba(64, 64, 64, 1);\r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .bg {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            height: 100%;\r\n");
      out.write("            padding: 0;\r\n");
      out.write("            margin: 0;\r\n");
      out.write("            position: absolute;\r\n");
      out.write("\r\n");
      out.write("            transition: all 0.5s;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #bg1 {\r\n");
      out.write("            background: url(\"");
      out.print( request.getContextPath() );
      out.write("/images/bg1-1.jpg\");\r\n");
      out.write("            background-size: cover;\r\n");
      out.write("            background-repeat: no-repeat;\r\n");
      out.write("            background-attachment: fixed;\r\n");
      out.write("            z-index: -2;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #bg2 {\r\n");
      out.write("            background: url(\"");
      out.print( request.getContextPath() );
      out.write("/images/bg1-2.jpg\");\r\n");
      out.write("            background-size: cover;\r\n");
      out.write("            background-repeat: no-repeat;\r\n");
      out.write("            background-attachment: fixed;\r\n");
      out.write("            z-index: -2;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #bg3 {\r\n");
      out.write("            background: url(\"");
      out.print( request.getContextPath() );
      out.write("/images/bg1-3.jpg\");\r\n");
      out.write("            background-size: cover;\r\n");
      out.write("            background-repeat: no-repeat;\r\n");
      out.write("            background-attachment: fixed;\r\n");
      out.write("            z-index: -2;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #bg4 {\r\n");
      out.write("            background: url(\"");
      out.print( request.getContextPath() );
      out.write("/images/bg1-4.jpg\");\r\n");
      out.write("            background-size: cover;\r\n");
      out.write("            background-repeat: no-repeat;\r\n");
      out.write("            background-attachment: fixed;\r\n");
      out.write("            z-index: -2;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #bg5 {\r\n");
      out.write("            background: url(\"");
      out.print( request.getContextPath() );
      out.write("/images/bg1-5.jpg\");\r\n");
      out.write("            background-size: cover;\r\n");
      out.write("            background-repeat: no-repeat;\r\n");
      out.write("            background-attachment: fixed;\r\n");
      out.write("            z-index: -2;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #cover {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            height: 100%;\r\n");
      out.write("            background: rgba(64, 64, 64, 0.9);\r\n");
      out.write("            position: absolute;\r\n");
      out.write("            z-index: -1;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #cover_1 {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            height: 100%;\r\n");
      out.write("            background: rgba(64, 64, 64, 1);\r\n");
      out.write("            position: absolute;\r\n");
      out.write("            z-index: -3;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .wrapper {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            height: 100%;\r\n");
      out.write("            margin: auto;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login_wrapper {\r\n");
      out.write("            padding: 196px 0;\r\n");
      out.write("            margin: auto;\r\n");
      out.write("            min-width: 1200px;\r\n");
      out.write("            min-height: 516px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login_area {\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            margin: 0 auto;\r\n");
      out.write("            width: 390px;\r\n");
      out.write("            min-height: 516px;\r\n");
      out.write("            background: #fff;\r\n");
      out.write("            border: 1px solid rgba(64, 64, 64, 1);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        p {\r\n");
      out.write("            color: white;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .footer {\r\n");
      out.write("            padding-bottom: 52px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #userId,\r\n");
      out.write("        #userPwd {\r\n");
      out.write("            display: block;\r\n");
      out.write("            margin: 0 auto 10px;\r\n");
      out.write("            padding: 20px 18px;\r\n");
      out.write("            width: 280px;\r\n");
      out.write("            height: 14px;\r\n");
      out.write("            border: 1px solid #e7e7e7;\r\n");
      out.write("\r\n");
      out.write("            transition: border 0.3s;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #userId:focus,\r\n");
      out.write("        #userPwd:focus {\r\n");
      out.write("            border: 1px solid #1c81ff;\r\n");
      out.write("            outline: none;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login_logo {\r\n");
      out.write("            width: 390px;\r\n");
      out.write("            height: 150px;\r\n");
      out.write("            margin: auto;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login_logo img {\r\n");
      out.write("            padding: 20px;\r\n");
      out.write("            width: 310px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login_header span {\r\n");
      out.write("            display: inline-block;\r\n");
      out.write("            position: relative;\r\n");
      out.write("            padding-top: 4px;\r\n");
      out.write("            height: 56px;\r\n");
      out.write("            line-height: 56px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login_area span {\r\n");
      out.write("            display: inline-block;\r\n");
      out.write("            padding-top: 4px;\r\n");
      out.write("            position: relative;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login_header span::before,\r\n");
      out.write("        .login_area span::before {\r\n");
      out.write("            position: absolute;\r\n");
      out.write("            left: 50%;\r\n");
      out.write("            top: 0;\r\n");
      out.write("            margin-left: -20px;\r\n");
      out.write("            width: 40px;\r\n");
      out.write("            height: 1px;\r\n");
      out.write("            background: #dadada;\r\n");
      out.write("            content: \"\";\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login_header span b {\r\n");
      out.write("            color: #0065e3;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login_ok {\r\n");
      out.write("            display: block;\r\n");
      out.write("            margin: 0 auto 24px;\r\n");
      out.write("            width: 318px;\r\n");
      out.write("            height: 66px;\r\n");
      out.write("            background: #1c81ff;\r\n");
      out.write("            border: 1px solid #1b7df8;\r\n");
      out.write("            font-size: 16px;\r\n");
      out.write("            color: #fff;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("            transition: background-color 0.3s, border-color 0.3s;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .login_ok:hover {\r\n");
      out.write("            background-color: #0065e3;\r\n");
      out.write("            border-color: #0061db;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        ul.list {\r\n");
      out.write("            list-style: none;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            font-size: 12px;\r\n");
      out.write("            margin: 0;\r\n");
      out.write("            padding: 0;\r\n");
      out.write("            margin-bottom: 30px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        ul.list li {\r\n");
      out.write("            display: inline-block;\r\n");
      out.write("            padding: 0 14px;\r\n");
      out.write("            height: 14px;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            line-height: 14px;\r\n");
      out.write("            border-left: 1px solid #a1a1a1;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        ul.list li:first-child {\r\n");
      out.write("            border-left: none;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        ul.list li a {\r\n");
      out.write("            text-decoration: none;\r\n");
      out.write("            color: #6f6f6f;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        ul.list li a:hover {\r\n");
      out.write("            color: #343434;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #goMain {\r\n");
      out.write("            display: block;\r\n");
      out.write("            margin: 12px auto 12px;\r\n");
      out.write("            width: 68px;\r\n");
      out.write("            height: 22px;\r\n");
      out.write("            background: rgb(64, 64, 64);\r\n");
      out.write("            border: 1px solid #fff;\r\n");
      out.write("            font-size: 12px;\r\n");
      out.write("            color: #fff;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("            transition: background-color 0.3s, border-color 0.3s;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        @keyframes main_shake {\r\n");
      out.write("\r\n");
      out.write("            10%,\r\n");
      out.write("            90% {\r\n");
      out.write("                transform: translate3d(0, -1px, 0);\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            30%,\r\n");
      out.write("            70% {\r\n");
      out.write("                transform: translate3d(0, 2px, 0);\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            50% {\r\n");
      out.write("                transform: translate3d(0, -3px, 0);\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #goMain:hover {\r\n");
      out.write("            background-color: #0065e3;\r\n");
      out.write("            border-color: #0061db;\r\n");
      out.write("            animation: main_shake 0.5s;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("    ");
 if(request.getAttribute("msg") != null) { 
      out.write("\r\n");
      out.write("    \t<script>\r\n");
      out.write("    \t\talert(\"");
      out.print( request.getAttribute("msg") );
      out.write("\");\r\n");
      out.write("    \t</script>\r\n");
      out.write("    ");
 request.removeAttribute("msg"); 
      out.write("\r\n");
      out.write("    ");
 } 
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("    <div id=\"cover_1\"></div>\r\n");
      out.write("    <div class=\"bg\" id=\"bg1\"></div>\r\n");
      out.write("    <div class=\"bg\" id=\"bg2\"></div>\r\n");
      out.write("    <div class=\"bg\" id=\"bg3\"></div>\r\n");
      out.write("    <div class=\"bg\" id=\"bg4\"></div>\r\n");
      out.write("    <div class=\"bg\" id=\"bg5\"></div>\r\n");
      out.write("    <div id=\"cover\"></div>\r\n");
      out.write("    <div class=\"wrapper\">\r\n");
      out.write("        <div class=\"login_wrapper\">\r\n");
      out.write("            <div class=\"login_area\">\r\n");
      out.write("                <div class=\"login_header\">\r\n");
      out.write("                    <div class=\"login_logo\">\r\n");
      out.write("                        <img src=\"");
      out.print( request.getContextPath() );
      out.write("/images/logo.png\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <span>\r\n");
      out.write("                        <b>무비자바</b> 로그인\r\n");
      out.write("                    </span>\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("                <form method=\"POST\" id=\"login_form\" action=\"");
      out.print( request.getContextPath() );
      out.write("/member/login\">\r\n");
      out.write("\r\n");
      out.write("                    <input type=\"text\" id=\"userId\" name=\"userId\" placeholder=\"아이디\" onkeydown=\"onKeyDown();\">\r\n");
      out.write("                    <input type=\"password\" id=\"userPwd\" name=\"userPwd\" placeholder=\"비밀번호\" onkeydown=\"onKeyDown();\">\r\n");
      out.write("                    <button type=\"button\" class=\"login_ok\" onclick=\"onSubmit();\">로그인</button>\r\n");
      out.write("\r\n");
      out.write("                </form>\r\n");
      out.write("\r\n");
      out.write("                <ul class=\"list\">\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a href=\"");
      out.print( request.getContextPath() );
      out.write("/views/member/joinMember.jsp\">회원가입</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a href=\"");
      out.print( request.getContextPath() );
      out.write("/views/member/idSearch.jsp\">아이디 찾기</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a href=\"");
      out.print( request.getContextPath() );
      out.write("/views/member/pwdSearch.jsp\">비밀번호 찾기</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("                <span></span>\r\n");
      out.write("                <div class=\"returnMain\">\r\n");
      out.write("                    <button type=\"button\" id=\"goMain\" onclick=\"location.href='");
      out.print( request.getContextPath() );
      out.write("'\">메인으로</button>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"footer\">\r\n");
      out.write("        <p>\r\n");
      out.write("\t\t\t© 2021 MOVIEJAVA | 요금제 및 소개 : NETFLIX(넷플릭스) | 왓챠플레이<br> Data\r\n");
      out.write("\t\t\t&amp; Content Image Based On Netflix.inc , Watcha.inc, TVNNG<br>\r\n");
      out.write("\t\t\t<br> <br> Copyright© 2021, MOVIEJAVA , All Rights Reserved.\r\n");
      out.write("\t\t</p>\r\n");
      out.write("    </div>\r\n");
      out.write("    <script>\r\n");
      out.write("        var slides = document.getElementsByClassName(\"bg\");\r\n");
      out.write("        var totalSlides = slides.length;\r\n");
      out.write("        var slideWidth = slides[0].clientWidth;\r\n");
      out.write("        var bgIndex = 0;\r\n");
      out.write("\r\n");
      out.write("        function changeBg() {\r\n");
      out.write("            for (var i = 0; i < slides.length; i++) {\r\n");
      out.write("                // slides[i].style.visibility = 'hidden';\r\n");
      out.write("                slides[i].style.width = '0';\r\n");
      out.write("            }\r\n");
      out.write("            // slides[bgIndex].style.visibility = \"visible\";\r\n");
      out.write("            slides[bgIndex].style.width = '100%';\r\n");
      out.write("            bgIndex++;\r\n");
      out.write("            if (bgIndex >= totalSlides) {\r\n");
      out.write("                bgIndex = 0;\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        setInterval(changeBg, 2500);\r\n");
      out.write("\r\n");
      out.write("        function onKeyDown() {\r\n");
      out.write("            if (event.keyCode == 13) {\r\n");
      out.write("                event.preventDefault();\r\n");
      out.write("                onSubmit();\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        function onSubmit() {\r\n");
      out.write("            var userId = document.getElementById(\"userId\");\r\n");
      out.write("            var userPwd = document.getElementById(\"userPwd\");\r\n");
      out.write("\r\n");
      out.write("            if (userId.value == \"\") {\r\n");
      out.write("                alert('아이디를 입력해주세요.');\r\n");
      out.write("                userId.focus();\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            if (userPwd.value == \"\") {\r\n");
      out.write("                alert('비밀번호를 입력해주세요');\r\n");
      out.write("                userPwd.focus();\r\n");
      out.write("                return;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            $(\"#login_form\").submit();\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        // 정규 표현식, 검사할 함수\r\n");
      out.write("        function chk(reg, e, msg) {\r\n");
      out.write("\r\n");
      out.write("            if (reg.test(e.value)) {\r\n");
      out.write("                return true;\r\n");
      out.write("            }\r\n");
      out.write("            alert(msg);\r\n");
      out.write("            e.value = \"\";\r\n");
      out.write("            e.focus();\r\n");
      out.write("            return false;\r\n");
      out.write("        }\r\n");
      out.write("    </script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
