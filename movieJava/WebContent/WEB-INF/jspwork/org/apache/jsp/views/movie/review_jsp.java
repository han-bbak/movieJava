/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.61
 * Generated at: 2021-02-03 04:57:21 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.movie;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class review_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>리뷰페이지</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.5.1.min.js\"\r\n");
      out.write("\tintegrity=\"sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=\"\r\n");
      out.write("\tcrossorigin=\"anonymous\"></script>\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\"\r\n");
      out.write("\trel=\"stylesheet\">\r\n");
      out.write("<style>\r\n");
      out.write("#menu-icon {\r\n");
      out.write("\tcolor: #ffffff;\r\n");
      out.write("\tpadding: 30px 0;\r\n");
      out.write("\tfont-size: 4em;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<style>\r\n");
      out.write(".logo {\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("\tmargin: 20px 50px;\r\n");
      out.write("\tmax-width: 130%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("body {\r\n");
      out.write("\tbackground: #363636;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/*\r\n");
      out.write(" \t\tdiv {\r\n");
      out.write("\t\t\tborder: 1px solid white;\r\n");
      out.write("\t\t\tbox-sizing: border-box;\r\n");
      out.write("\t\t} \r\n");
      out.write("*/\r\n");
      out.write("p {\r\n");
      out.write("\tcolor: white;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#wrapper {\r\n");
      out.write("\twidth: 1190px;\r\n");
      out.write("\theight: 1400px;\r\n");
      out.write("\tmargin: auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#header {\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 10%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#content2 {\r\n");
      out.write("\tpadding-top: 20px;\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 80%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#footer {\r\n");
      out.write("\tbackground-color: rgb(24, 24, 24);\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 10%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header {\r\n");
      out.write("\tfloat: left;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#header-menu {\r\n");
      out.write("\twidth: 5%;\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#header1 {\r\n");
      out.write("\twidth: 15%;\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#header2 {\r\n");
      out.write("\twidth: 55%;\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#header2>#search-form {\r\n");
      out.write("\twidth: 70%;\r\n");
      out.write("\theight: 40%;\r\n");
      out.write("\ttop: 0;\r\n");
      out.write("\tbottom: 0;\r\n");
      out.write("\tleft: 140px;\r\n");
      out.write("\tright: 0;\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\tmargin: auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#search-text-area {\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\twidth: 85%;\r\n");
      out.write("\tfloat: left;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#search-btn-area {\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\twidth: 15%;\r\n");
      out.write("\tfloat: left;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#search-input {\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\tbox-sizing: border-box;\r\n");
      out.write("\tborder-top-right-radius: 10px;\r\n");
      out.write("\tborder-bottom-right-radius: 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#search-btn {\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\tbox-sizing: border-box;\r\n");
      out.write("\tborder-top-left-radius: 10px;\r\n");
      out.write("\tborder-bottom-left-radius: 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#header3 {\r\n");
      out.write("\twidth: 25%;\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#header3 a {\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("\tfont-size: 18px;\r\n");
      out.write("\tcolor: #949494;\r\n");
      out.write("\tfont-weight: bold;\r\n");
      out.write("\tfloat: left;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#logform {\r\n");
      out.write("\twidth: 60%;\r\n");
      out.write("\theight: 20%;\r\n");
      out.write("\ttop: 0;\r\n");
      out.write("\tbottom: 0;\r\n");
      out.write("\tleft: 0;\r\n");
      out.write("\tright: 0;\r\n");
      out.write("\tmargin: auto;\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#loginform {\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\twidth: 50%;\r\n");
      out.write("\tfloat: left;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#joinform {\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\twidth: 50%;\r\n");
      out.write("\tfloat: left;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#header3 a:hover {\r\n");
      out.write("\tcolor: #f1f1f1;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#content1 {\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 35%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#content2 {\r\n");
      out.write("\tletter-spacing: 0.2ch;\r\n");
      out.write("\tfont-weight: bold;\r\n");
      out.write("\tfont-size: x-large;\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 32.5%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#content3 {\r\n");
      out.write("\tletter-spacing: 0.2ch;\r\n");
      out.write("\tfont-weight: bold;\r\n");
      out.write("\tfont-size: x-large;\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 32.5%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("html.open {\r\n");
      out.write("\toverflow: hidden;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".btn {\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\tleft: 0px;\r\n");
      out.write("\ttop: 0px;\r\n");
      out.write("\tz-index: 1;\r\n");
      out.write("\tbackground-size: 50%;\r\n");
      out.write("\tbackground-repeat: no-repeat;\r\n");
      out.write("\tbackground-position: center;\r\n");
      out.write("\tcursor: pointer;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".close {\r\n");
      out.write("\twidth: 50px;\r\n");
      out.write("\theight: 50px;\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\tright: 0px;\r\n");
      out.write("\ttop: 0px;\r\n");
      out.write("\tbackground-size: 50%;\r\n");
      out.write("\tbackground-repeat: no-repeat;\r\n");
      out.write("\tbackground-position: center;\r\n");
      out.write("\tcursor: pointer;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#menu a {\r\n");
      out.write("\tpadding: 10px 40px 10px 20px;\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("\tfont-size: 25px;\r\n");
      out.write("\tcolor: #818181;\r\n");
      out.write("\tdisplay: block;\r\n");
      out.write("\tfont-weight: bold;\r\n");
      out.write("\tfloat: left;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#menu a:hover {\r\n");
      out.write("\tcolor: #f1f1f1;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#menu {\r\n");
      out.write("\twidth: 250px;\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\tposition: fixed;\r\n");
      out.write("\ttop: 0px;\r\n");
      out.write("\tleft: -252px;\r\n");
      out.write("\tz-index: 10;\r\n");
      out.write("\tbackground-color: black;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\ttransition: All 0.2s ease;\r\n");
      out.write("\t-webkit-transition: All 0.2s ease;\r\n");
      out.write("\t-moz-transition: All 0.2s ease;\r\n");
      out.write("\t-o-transition: All 0.2s ease;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#menu.open {\r\n");
      out.write("\tleft: 0px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".page_cover.open {\r\n");
      out.write("\tdisplay: block;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".page_cover {\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\tposition: fixed;\r\n");
      out.write("\ttop: 0px;\r\n");
      out.write("\tleft: 0px;\r\n");
      out.write("\tbackground-color: rgba(0, 0, 0, 0.4);\r\n");
      out.write("\tz-index: 4;\r\n");
      out.write("\tdisplay: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("    .right-align {\r\n");
      out.write("      text-align: right;\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    @media only screen and (min-width: 0) {\r\n");
      out.write("      html {\r\n");
      out.write("        font-size: 14px;\r\n");
      out.write("      }\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("    @media only screen and (min-width: 992px) {\r\n");
      out.write("      html {\r\n");
      out.write("        font-size: 14.5px;\r\n");
      out.write("      }\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    h1, h2, h3, h4, h5, h6 {\r\n");
      out.write("      font-weight: 400;\r\n");
      out.write("      line-height: 1.3;\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("    h3 {\r\n");
      out.write("      font-size: 2.92rem;\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    .mslider {\r\n");
      out.write("      position: relative;\r\n");
      out.write("      height: 400px;\r\n");
      out.write("      width: 100%;\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("    .mslider.fullscreen {\r\n");
      out.write("      height: 100%;\r\n");
      out.write("      width: 100%;\r\n");
      out.write("      position: relative;\r\n");
      out.write("      top: 0;\r\n");
      out.write("      left: 0;\r\n");
      out.write("      right: 0;\r\n");
      out.write("      bottom: 0;\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    .mslider .slidess {\r\n");
      out.write("      background-color: #9e9e9e;\r\n");
      out.write("      margin: 0;\r\n");
      out.write("      height: 400px;\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("    .mslider .slidess li {\r\n");
      out.write("      opacity: 0;\r\n");
      out.write("      position: absolute;\r\n");
      out.write("      top: 0;\r\n");
      out.write("      left: 0;\r\n");
      out.write("      z-index: 1;\r\n");
      out.write("      width: 100%;\r\n");
      out.write("      height: inherit;\r\n");
      out.write("      overflow: hidden;\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("    .mslider .slidess li img {\r\n");
      out.write("      height: 100%;\r\n");
      out.write("      width: 100%;\r\n");
      out.write("      background-size: cover;\r\n");
      out.write("      background-position: relative;\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("    .mslider .slidess li .caption {\r\n");
      out.write("      color: #fff;\r\n");
      out.write("      position: absolute;\r\n");
      out.write("      top: 15%;\r\n");
      out.write("      left: 15%;\r\n");
      out.write("      width: 70%;\r\n");
      out.write("      opacity: 0;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("     /* 바로가기 버튼 */\r\n");
      out.write("     .linkbtn{\r\n");
      out.write("\twidth: 157px;\r\n");
      out.write("\theight: 44px;\r\n");
      out.write("\tborder-radius: 5px;\r\n");
      out.write("\tfont-size: 16px;\r\n");
      out.write("\tfont-weight: bold;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("\tline-height: 20px;\r\n");
      out.write("\tcolor: #FFFFFF;\r\n");
      out.write("\toutline: none;\r\n");
      out.write("\tmargin: 10px;\r\n");
      out.write("  transition: all .2s ease-in-out;\r\n");
      out.write("  cursor: pointer;\r\n");
      out.write("}\r\n");
      out.write("\t/* Outline Button */\r\n");
      out.write("\t.btn-outline{\r\n");
      out.write("\t\tborder: 2px solid #FFFFFF;\r\n");
      out.write("\t\tbackground: transparent;\r\n");
      out.write("\t}\r\n");
      out.write("  .btn-outline:hover,\r\n");
      out.write("\t.btn-outline-hover{\r\n");
      out.write("\t\tbackground-color: #FFFFFF;\r\n");
      out.write("\t\tcolor: #181C25;\r\n");
      out.write("\t}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\t<div id=\"wrapper\">\r\n");
      out.write("\t\t<div id=\"header\">\r\n");
      out.write("\t\t\t<div class=\"header\" id=\"header-menu\">\r\n");
      out.write("\t\t\t\t<div class=\"btn\">\r\n");
      out.write("\t\t\t\t\t<link\r\n");
      out.write("\t\t\t\t\t\thref=\"https://fonts.googleapis.com/icon?family=Material+Icons\"\r\n");
      out.write("\t\t\t\t\t\trel=\"stylesheet\">\r\n");
      out.write("\t\t\t\t\t<i id=\"menu-icon\" class=\"material-icons\">menu</i>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"header\" id=\"header1\">\r\n");
      out.write("\t\t\t\t<img class=\"logo\" src=\"images/logo.png\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"header\" id=\"header2\">\r\n");
      out.write("\t\t\t\t<form id=\"search-form\">\r\n");
      out.write("\t\t\t\t\t<section id=\"search-btn-area\">\r\n");
      out.write("\t\t\t\t\t\t<button type=\"submit\" id=\"search-btn\">\r\n");
      out.write("\t\t\t\t\t\t\t<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\"\r\n");
      out.write("\t\t\t\t\t\t\t\tfill=\"currentColor\" class=\"bi bi-search\" viewBox=\"0 0 16 16\">\r\n");
      out.write("                            <path\r\n");
      out.write("\t\t\t\t\t\t\t\t\td=\"M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z\"></path>\r\n");
      out.write("                          </svg>\r\n");
      out.write("\t\t\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t\t</section>\r\n");
      out.write("\t\t\t\t\t<section id=\"search-text-area\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" id=\"search-input\" name=\"search-input\"\r\n");
      out.write("\t\t\t\t\t\t\tplaceholder=\"  보고싶은 영화를 검색해보세요.\">\r\n");
      out.write("\t\t\t\t\t</section>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"header\" id=\"header3\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<form id=\"logform\">\r\n");
      out.write("\t\t\t\t\t<section id=\"loginform\">\r\n");
      out.write("\t\t\t\t\t\t<a href=\"");
      out.print(request.getContextPath());
      out.write("/views/member/loginView.jsp\">로그인</a>\r\n");
      out.write("\t\t\t\t\t</section>\r\n");
      out.write("\t\t\t\t\t<section id=\"joinform\">\r\n");
      out.write("\t\t\t\t\t\t<a\r\n");
      out.write("\t\t\t\t\t\t\thref=\"");
      out.print(request.getContextPath());
      out.write("/views/member/joinMember.jsp\">회원가입</a>\r\n");
      out.write("\t\t\t\t\t</section>\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div onclick=\"history.back();\" class=\"page_cover\"></div>\r\n");
      out.write("\t\t<div id=\"menu\" class=\"\">\r\n");
      out.write("\t\t\t<div onclick=\"history.back();\" class=\"close\">\r\n");
      out.write("\t\t\t\t<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"100%\" height=\"100%\"\r\n");
      out.write("\t\t\t\t\tfill=\"white\" class=\"bi bi-x-circle\" viewBox=\"0 0 16 16\">\r\n");
      out.write("                    <path\r\n");
      out.write("\t\t\t\t\t\td=\"M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z\"></path>\r\n");
      out.write("                    <path\r\n");
      out.write("\t\t\t\t\t\td=\"M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z\"></path>\r\n");
      out.write("                  </svg>\r\n");
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<br> <br> <br> <br> <a href=\"#\">HOME</a><br>\r\n");
      out.write("\t\t\t<a href=\"#\">마이페이지</a><br> <a href=\"#\">관심 영화</a><br> <a\r\n");
      out.write("\t\t\t\thref=\"#\">Watcha Party</a><br> <a href=\"#\">Netflix Party</a><br>\r\n");
      out.write("\t\t\t<a href=\"#\">Q&amp;A</a><br> <a href=\"#\">STORE - Goods</a><br>\r\n");
      out.write("\t\t\t<a href=\"#\">STORE - Ticket</a><br>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<div id=\"content\">\r\n");
      out.write("\t\t\t<div class=\"content\" id=\"content1\">\r\n");
      out.write("\t\t\t\t<body>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<script\r\n");
      out.write("\t\t\t\t\t\tsrc='https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.1/js/materialize.js'></script>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t <script id=\"rendered-js\">\r\n");
      out.write("\t                  const mslider = document.querySelector('.mslider');\r\n");
      out.write("\t                  M.mslider.init(mslider, {\r\n");
      out.write("\t                    height: 400,\r\n");
      out.write("\t                    indicators: false,\r\n");
      out.write("\t                    interval: 5000,\r\n");
      out.write("\t                    transition: 5000\r\n");
      out.write("\t                  });\r\n");
      out.write("            \r\n");
      out.write("              </script>\r\n");
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