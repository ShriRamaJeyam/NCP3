package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <style>\n");
      out.write("        select {\n");
      out.write("  -webkit-appearance: none;\n");
      out.write("  -moz-appearance: none;\n");
      out.write("  -ms-appearance: none;\n");
      out.write("  appearance: none;\n");
      out.write("  outline: 0;\n");
      out.write("  box-shadow: none;\n");
      out.write("  border: 0 !important;\n");
      out.write("  background: rgb(230,230,230);\n");
      out.write("  background-image: none;\n");
      out.write("}\n");
      out.write("/* Remove IE arrow */\n");
      out.write("select::-ms-expand {\n");
      out.write("  display: none;\n");
      out.write("}\n");
      out.write("/* Custom Select */\n");
      out.write(".select {\n");
      out.write("  position: relative;\n");
      out.write("  display: flex;\n");
      out.write("  width: 20em;\n");
      out.write("  height: 3em;\n");
      out.write("  line-height: 3;\n");
      out.write("  background: #2c3e50;\n");
      out.write("  overflow: hidden;\n");
      out.write("  border-radius: 1.38em;\n");
      out.write("}\n");
      out.write("select {\n");
      out.write("  flex: 1;\n");
      out.write("  padding: 0 1em;\n");
      out.write("  color: #000000;\n");
      out.write("  cursor: pointer;\n");
      out.write("}\n");
      out.write("/* Arrow */\n");
      out.write(".select::after {\n");
      out.write("  content: '\\25BC';\n");
      out.write("  position: absolute;\n");
      out.write("  top: 0;\n");
      out.write("  right: 0;\n");
      out.write("  padding: 0 1em;\n");
      out.write("  background: #34495e;\n");
      out.write("  color:white;\n");
      out.write("  cursor: pointer;\n");
      out.write("  pointer-events: none;\n");
      out.write("  -webkit-transition: .25s all ease;\n");
      out.write("  -o-transition: .25s all ease;\n");
      out.write("  transition: .25s all ease;\n");
      out.write("}\n");
      out.write("/* Transition */\n");
      out.write(".select:hover::after {\n");
      out.write("  color: #f39c12;\n");
      out.write("}\n");
      out.write("\n");
      out.write("    </style>\n");
      out.write("\t<title>Login</title>\n");
      out.write("\t<meta charset=\"UTF-8\">\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("<!--===============================================================================================-->\t\n");
      out.write("\t<link rel=\"icon\" type=\"image/png\" href=\"resources/images/icons/favicon.ico\"/>\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/vendor/bootstrap/css/bootstrap.min.css\">\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css\">\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/vendor/animate/animate.css\">\n");
      out.write("        \n");
      out.write("<!--===============================================================================================-->\t\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/vendor/css-hamburgers/hamburgers.min.css\">\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/vendor/select2/select2.min.css\">\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/css/util.css\">\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/css/main.css\">\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\t\n");
      out.write("\t<div class=\"limiter\">\n");
      out.write("\t\t<div class=\"container-login100\">\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<div class=\"wrap-login100\">\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t<div class=\"login100-pic js-tilt\" data-tilt>\n");
      out.write("\t\t\t\t\t<img src=\"resources/images/logo.png\" height = 300 width = 300 alt=\"IMG\">\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t<form class=\"login100-form validate-form\" action=\"LoginCheck\" method=\"POST\">\n");
      out.write("\t\t\t\t\t<span class=\"login100-form-title\">\n");
      out.write("\t\t\t\t\t\tAmrita Course Management System\n");
      out.write("\t\t\t\t\t</span>\n");
      out.write("                                    <div class=\"select wrap-input100\">\n");
      out.write("                                    <select name=\"role\">\n");
      out.write("                                        <option value=\"0\">Student</option>\n");
      out.write("                                        <option value=\"1\">Teacher</option>\n");
      out.write("                                        <option value=\"2\">Administrator</option>\n");
      out.write("                                    </select>\n");
      out.write("                                    </div>\n");
      out.write("\t\t\t\t\t<div class=\"wrap-input100\">\n");
      out.write("\t\t\t\t\t\t<input class=\"input100\" type=\"text\" name=\"usr\" placeholder=\"username\" pattern=\"[0-9A-Za-z]*\" title=\"UserName should can contain only numbers and alphabets\" required>\n");
      out.write("\t\t\t\t\t\t<span class=\"focus-input100\"></span>\n");
      out.write("\t\t\t\t\t\t<span class=\"symbol-input100\">\n");
      out.write("\t\t\t\t\t\t\t<i class=\"fa fa-user-circle\" aria-hidden=\"true\"></i>\n");
      out.write("\t\t\t\t\t\t</span>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("                                    \n");
      out.write("\t\t\t\t\t<div class=\"wrap-input100\">\n");
      out.write("\t\t\t\t\t\t<input class=\"input100\" type=\"password\" name=\"pass\" pattern=\"[0-9A-Za-z]*\" title=\"Password should can contain only numbers and alphabets\" placeholder=\"password\" required>\n");
      out.write("\t\t\t\t\t\t<span class=\"focus-input100\"></span>\n");
      out.write("\t\t\t\t\t\t<span class=\"symbol-input100\">\n");
      out.write("\t\t\t\t\t\t\t<i class=\"fa fa-lock\" aria-hidden=\"true\"></i>\n");
      out.write("\t\t\t\t\t\t</span>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("                                    \n");
      out.write("                                        \n");
      out.write("\t\t\t\t\t<div class=\"container-login100-form-btn\">\n");
      out.write("\t\t\t\t\t\t<button class=\"login100-form-btn\">\n");
      out.write("\t\t\t\t\t\t\tLogin\n");
      out.write("\t\t\t\t\t\t</button>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t<div class=\"text-center p-t-12\">\n");
      out.write("\t\t\t\t\t\t<span class=\"txt1\">\n");
      out.write("\t\t\t\t\t\t\tForgot\n");
      out.write("\t\t\t\t\t\t</span>\n");
      out.write("\t\t\t\t\t\t<a class=\"txt2\" href=\"forgotpassword.html\">\n");
      out.write("\t\t\t\t\t\t\tUsername / Password?\n");
      out.write("\t\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t\t\t<br>\n");
      out.write("\t\t\t\t\t\t<a class=\"txt2\" href=\"registration.html\">\n");
      out.write("\t\t\t\t\t\t\tNew User? Register here\n");
      out.write("\t\t\t\t\t\t\t<i class=\"fa fa-long-arrow-right m-l-5\" aria-hidden=\"true\"></i>\n");
      out.write("\t\t\t\t\t\t</a>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t<div class=\"text-center p-t-136\">\n");
      out.write("\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</form>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\n");
      out.write("\t\n");
      out.write("<!--===============================================================================================-->\t\n");
      out.write("\t<script src=\"resources/vendor/jquery/jquery-3.2.1.min.js\"></script>\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<script src=\"resources/vendor/bootstrap/js/popper.js\"></script>\n");
      out.write("\t<script src=\"resources/vendor/bootstrap/js/bootstrap.min.js\"></script>\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<script src=\"resources/vendor/select2/select2.min.js\"></script>\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<script src=\"resources/vendor/tilt/tilt.jquery.min.js\"></script>\n");
      out.write("\t<script >\n");
      out.write("\t\t$('.js-tilt').tilt({\n");
      out.write("\t\t\tscale: 1.1\n");
      out.write("\t\t})\n");
      out.write("\t</script>\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("\t<script src=\"js/main.js\"></script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
