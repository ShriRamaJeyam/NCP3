package org.apache.jsp.landing.upload;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class upload_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE HTML>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<style>\r\n");
      out.write("body {\r\n");
      out.write("  font-family: sans-serif;\r\n");
      out.write("}\r\n");
      out.write(".input-container {\r\n");
      out.write("  margin: 3em auto;\r\n");
      out.write("  max-width: 500px;\r\n");
      out.write("  background-color: #EDEDED;\r\n");
      out.write("  border: 1px solid #DFDFDF;\r\n");
      out.write("  border-radius: 5px;\r\n");
      out.write("}\r\n");
      out.write("input[type='file'] {\r\n");
      out.write("  display: none;\r\n");
      out.write("}\r\n");
      out.write(".file-info {\r\n");
      out.write("  font-size: 0.9em;\r\n");
      out.write("}\r\n");
      out.write(".browse-btn {\r\n");
      out.write("  background: #03A595;\r\n");
      out.write("  color: #fff;\r\n");
      out.write("  min-height: 35px;\r\n");
      out.write("  padding: 10px;\r\n");
      out.write("  border: none;\r\n");
      out.write("  border-top-left-radius: 5px;\r\n");
      out.write("  border-bottom-left-radius: 5px;\r\n");
      out.write("}\r\n");
      out.write(".browse-btn:hover {\r\n");
      out.write("  background: #4ec0b4;\r\n");
      out.write("}\r\n");
      out.write("@media (max-width: 500px) {\r\n");
      out.write("  button {\r\n");
      out.write("    width: 100%;\r\n");
      out.write("    border-top-right-radius: 5px;\r\n");
      out.write("    border-bottom-left-radius: 0;\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
      out.write("  .file-info {\r\n");
      out.write("    display: block;\r\n");
      out.write("    margin: 10px 5px;\r\n");
      out.write("  }\r\n");
      out.write("}\r\n");
      out.write("input[type='file'] {\r\n");
      out.write("  display: none;\r\n");
      out.write("}\r\n");
      out.write(".thumbnail{\r\n");
      out.write("            background-color:rgb(230,230,230);\r\n");
      out.write("            border-radius: 10px;\r\n");
      out.write("            margin-left: 4px;\r\n");
      out.write("        }\r\n");
      out.write("</style>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("var fn1=function()\r\n");
      out.write("{\r\n");
      out.write("  var name = document.getElementById('real-input').value.split(/\\\\|\\//).pop();\r\n");
      out.write("  var truncated = name.length > 40 ? name.substr(0,20)+\"...\"+name.substr(name.length-9,name.length-1) : name;\r\n");
      out.write("  document.getElementById('file-info').innerHTML = truncated;\r\n");
      out.write("};\r\n");
      out.write("        \r\n");
      out.write("</script>\r\n");
      out.write("<script src=\"/NCP3/resources/bootstrap/js/bootstrap.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"/NCP3/resources/bootstrap/css/bootstrap.min.css\">\r\n");
      out.write("<title>Upload Materials</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <form>\r\n");
      out.write("        <div class=\"input-container\">\r\n");
      out.write("\r\n");
      out.write("                <input type=\"file\" id=\"real-input\" onchange=\"fn1()\">\r\n");
      out.write("                <button class=\"browse-btn\" id=\"browse-btn\" onclick=\"document.getElementById('real-input').click()\">\r\n");
      out.write("                        Browse Files\r\n");
      out.write("                </button>\r\n");
      out.write("                <span class=\"file-info\" id=\"file-info\">Upload a file</span>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div style=\"display:block;margin-left: auto;margin-right: auto;width: 3%\">\r\n");
      out.write("            <input type=\"submit\" class=\"btn btn-success\">\r\n");
      out.write("        </div>\r\n");
      out.write("    </form>\r\n");
      out.write("    <div style=\"padding:25px;\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"col-sm-2 thumbnail\">\r\n");
      out.write("                Hello World<br>Hello\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-sm-2 thumbnail\" style=\"align-content: center;align-items: center;display: block;\">\r\n");
      out.write("                <img src=\"../../resources/icons/mp3.png\"></img> \r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
