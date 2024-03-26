/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.87
 * Generated at: 2024-03-25 14:43:58 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.include;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class joinUser_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
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

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
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
      out.write("<meta name=\"viewport\" content=\"width=device-width\", initial-scale=\"1\">\r\n");
      out.write("<title>JoinUser</title>\r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"./css/joinUser-style.css\">\r\n");
      out.write("<style>\r\n");
      out.write("	#red-star{	/* 항목옆의 별 */\r\n");
      out.write("		color:red;\r\n");
      out.write("		font-size: 15px;\r\n");
      out.write("	}\r\n");
      out.write("	#required{	/* \"필수입력사항\" */\r\n");
      out.write("		float: right;\r\n");
      out.write("		margin: 0 0 10px 0;\r\n");
      out.write("	}\r\n");
      out.write("	#user-join-btn{	/* '개인 회원' 버튼 */\r\n");
      out.write("		float: left;\r\n");
      out.write("		width: 250px;\r\n");
      out.write("		height: 100%;\r\n");
      out.write("		color: var(--color-bean-brown);\r\n");
      out.write("  		background-color: var(--color-rose-white);\r\n");
      out.write("  		box-shadow: none;\r\n");
      out.write("		text-align: center;\r\n");
      out.write("		font-size: 20px;\r\n");
      out.write("		font-weight: bold;\r\n");
      out.write("		margin: 0 auto;\r\n");
      out.write("		padding: 0 0 5px 0;\r\n");
      out.write("	}\r\n");
      out.write("	#shelter-join-btn{	/* '보호소 회원' 버튼 */\r\n");
      out.write("		float: right;\r\n");
      out.write("		width: 250px;\r\n");
      out.write("		height: 100%;\r\n");
      out.write("		color: var(--color-bean-brown);\r\n");
      out.write("  		background-color: var(--color-rose-white);\r\n");
      out.write("  		box-shadow: none;\r\n");
      out.write("		text-align: center;\r\n");
      out.write("		font-size: 20px;\r\n");
      out.write("		font-weight: bold;\r\n");
      out.write("		margin: 0 auto;\r\n");
      out.write("		padding: 0 0 5px 0;\r\n");
      out.write("	}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body id=\"join\">\r\n");
      out.write("<script>\r\n");
      out.write("</script>\r\n");
      out.write("        <!-- join -->\r\n");
      out.write("        <div class=\"join-form\">\r\n");
      out.write("            <h1>회원가입</h1>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"join-select\">\r\n");
      out.write("            	<button type=\"button\" id=\"user-join-btn\">개인 회원</button>\r\n");
      out.write("            	<button type=\"button\" id=\"shelter-join-btn\">보호소 회원</button>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("            <form action=\"joinAction.jsp\" method=\"post\">\r\n");
      out.write("            	<div>\r\n");
      out.write("            	<p id=\"required\"><span id=\"red-star\">*</span>필수입력사항</p>\r\n");
      out.write("            	</div>\r\n");
      out.write("            	\r\n");
      out.write("                <div class=\"form-element\">\r\n");
      out.write("                    <span>아이디</span><span id=\"red-star\">*</span>\r\n");
      out.write("                    <input type=\"text\" class=\"join-input\" name=\"mem_id\" maxlength=\"20\" required>\r\n");
      out.write("                    <p class=\"check-message\" id=\"checkId\"></p>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"form-element\">\r\n");
      out.write("                    <span>비밀번호</span><span id=\"red-star\">*</span>\r\n");
      out.write("                    <input type=\"password\" class=\"join-input\" name=\"pwd\" maxlength=\"20\" required>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"form-element\">\r\n");
      out.write("                    <span>비밀번호 확인</span><span id=\"red-star\">*</span>\r\n");
      out.write("                    <input type=\"password\" class=\"join-input\" name=\"pwdCheck\" onkeyup=\"checkPwd()\" maxlength=\"20\" required>\r\n");
      out.write("                    <br><br>\r\n");
      out.write("                    <!-- onkeyup : 키를 눌렀다가 땠을 때 이벤트 -->\r\n");
      out.write("                    <p class=\"check-message\" id=\"checkPwd\"></p>    \r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("               \r\n");
      out.write("                <div class=\"form-element\">\r\n");
      out.write("                    <span>이름</span><span id=\"red-star\">*</span>\r\n");
      out.write("                    <input type=\"text\" class=\"join-input\" name=\"name\" maxlength=\"20\" required>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"form-element\">\r\n");
      out.write("                    <span>이메일</span><span id=\"red-star\">*</span>\r\n");
      out.write("                    <input type=\"email\" class=\"join-input\" name=\"email\" maxlength=\"20\" required>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"form-element\">\r\n");
      out.write("                    <span>연락처</span>\r\n");
      out.write("                    <input type=\"text\" class=\"join-input\" name=\"tel\" maxlength=\"20\" required>\r\n");
      out.write("                </div>   \r\n");
      out.write("            <button type=\"submit\" class=\"btn\"><span>가입하기</span></button>\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("<!--  id 중복성체크(미완성)\r\n");
      out.write("<script type=\"text/javascript\"> \r\n");
      out.write("$(document).ready(function() {\r\n");
      out.write("	$(\"#mem_id\").blur(function() {\r\n");
      out.write("		$.ajax({\r\n");
      out.write("			url:\"idcheck.jsp\",\r\n");
      out.write("			type:\"post\",\r\n");
      out.write("			data:{ \"mem_id\":$(\"#mem_id\").val() },\r\n");
      out.write("			success:function( data ){\r\n");
      out.write("				if(data.trim() == \"YES\"){\r\n");
      out.write("					$(\"#checkId\").css(\"color\", \"#0000ff\");\r\n");
      out.write("					$(\"#checkId\").text(\"사용할 수 있는 아이디입니다\");\r\n");
      out.write("				}else{\r\n");
      out.write("					$(\"#checkId\").css(\"color\", \"#ff0000\");\r\n");
      out.write("					$(\"#checkId\").text(\"사용할 수 없는 아이디입니다\");\r\n");
      out.write("					$(\"#mem_id\").val(\"\");\r\n");
      out.write("				}\r\n");
      out.write("			},\r\n");
      out.write("			error:function(){\r\n");
      out.write("				alert('error');\r\n");
      out.write("			}			\r\n");
      out.write("		});\r\n");
      out.write("	});\r\n");
      out.write("});\r\n");
      out.write("</script> \r\n");
      out.write("--> \r\n");
      out.write("<script type=\"text/javascript\"> //pw 유효성 체크\r\n");
      out.write("function checkPwd(){\r\n");
      out.write("	  var input = document.forms[0];\r\n");
      out.write("	  var pwd = input.pwd.value;\r\n");
      out.write("	  var pwdCheck = input.pwdCheck.value;\r\n");
      out.write("	  if(pwd!=pwdCheck){\r\n");
      out.write("	   document.getElementById('checkPwd').style.color = \"red\";	//밝은 빨강으로 수정\r\n");
      out.write("	   document.getElementById('checkPwd').innerHTML = \"비밀번호가 일치하지 않습니다.\"; \r\n");
      out.write("	  }else{\r\n");
      out.write("	   document.getElementById('checkPwd').style.color = \"blue\";	//밝은 파랑으로 수정\r\n");
      out.write("	   document.getElementById('checkPwd').innerHTML = \"비밀번호가 일치합니다.\";\r\n");
      out.write("	  }\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
