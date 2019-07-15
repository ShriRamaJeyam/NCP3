package org.apache.jsp.testing;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import javax.servlet.http.*;

public final class upload1_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\n");
      out.write("\n");

    







      out.write("\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("<style>\n");
      out.write("    body {\n");
      out.write("        font-family: Arial, Helvetica, sans-serif;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    html,\n");
      out.write("    body {\n");
      out.write("        width: 100%;\n");
      out.write("        height: 100%;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    * {\n");
      out.write("        box-sizing: border-box\n");
      out.write("    }\n");
      out.write("    /* Full-width input fields */\n");
      out.write("    \n");
      out.write("    body {\n");
      out.write("        background-image: url(\"bg.jpg\");\n");
      out.write("         /* Full height */\n");
      out.write("        height: 100%;\n");
      out.write("        /* Center and scale the image nicely */\n");
      out.write("        background-position: center;\n");
      out.write("        background-repeat: no-repeat;\n");
      out.write("        background-size: cover;\n");
      out.write("        background-attachment: fixed;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("\n");
      out.write("    .maxl {\n");
      out.write("        margin: 25px;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .inline {\n");
      out.write("        display: inline-block;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .inline+.inline {\n");
      out.write("        margin-left: 10px;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .radio {\n");
      out.write("        color: white;\n");
      out.write("        font-size: 15px;\n");
      out.write("        position: relative;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .radio span {\n");
      out.write("        position: relative;\n");
      out.write("        padding-left: 20px;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .radio span:after {\n");
      out.write("        content: '';\n");
      out.write("        width: 15px;\n");
      out.write("        height: 15px;\n");
      out.write("        border: 3px solid;\n");
      out.write("        position: absolute;\n");
      out.write("        left: 0;\n");
      out.write("        top: 1px;\n");
      out.write("        border-radius: 100%;\n");
      out.write("        -ms-border-radius: 100%;\n");
      out.write("        -moz-border-radius: 100%;\n");
      out.write("        -webkit-border-radius: 100%;\n");
      out.write("        box-sizing: border-box;\n");
      out.write("        -ms-box-sizing: border-box;\n");
      out.write("        -moz-box-sizing: border-box;\n");
      out.write("        -webkit-box-sizing: border-box;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .radio input[type=\"radio\"] {\n");
      out.write("        cursor: pointer;\n");
      out.write("        position: absolute;\n");
      out.write("        width: 100%;\n");
      out.write("        height: 100%;\n");
      out.write("        z-index: 1;\n");
      out.write("        opacity: 0;\n");
      out.write("        filter: alpha(opacity=0);\n");
      out.write("        -ms-filter: \"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)\"\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .radio input[type=\"radio\"]:checked+span {\n");
      out.write("        color: #0B8;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .radio input[type=\"radio\"]:checked+span:before {\n");
      out.write("        content: '';\n");
      out.write("        width: 5px;\n");
      out.write("        height: 5px;\n");
      out.write("        position: absolute;\n");
      out.write("        background: #0B8;\n");
      out.write("        left: 5px;\n");
      out.write("        top: 6px;\n");
      out.write("        border-radius: 100%;\n");
      out.write("        -ms-border-radius: 100%;\n");
      out.write("        -moz-border-radius: 100%;\n");
      out.write("        -webkit-border-radius: 100%;\n");
      out.write("    }\n");
      out.write("    /* Set a style for all buttons */\n");
      out.write("    \n");
      out.write("    .button {\n");
      out.write("        background-color: #4CAF50;\n");
      out.write("        color: white;\n");
      out.write("        padding: 14px 20px;\n");
      out.write("        margin: 8px 0;\n");
      out.write("        border: none;\n");
      out.write("        cursor: pointer;\n");
      out.write("        width: 100%;\n");
      out.write("        opacity: 0.9;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .button:hover {\n");
      out.write("        opacity: 1;\n");
      out.write("    }\n");
      out.write("    /* Extra styles for the cancel button */\n");
      out.write("    /* Float cancel and signup buttons and add an equal width */\n");
      out.write("    \n");
      out.write("    .signupbtn {\n");
      out.write("        float: left;\n");
      out.write("        width: 50%;\n");
      out.write("    }\n");
      out.write("    /* Add padding to container elements */\n");
      out.write("    \n");
      out.write("    .container {\n");
      out.write("        padding: 16px;\n");
      out.write("    }\n");
      out.write("    /* The Modal (background) */\n");
      out.write("    \n");
      out.write("    .modal {\n");
      out.write("        display: none;\n");
      out.write("        /* Hidden by default */\n");
      out.write("        position: fixed;\n");
      out.write("        /* Stay in place */\n");
      out.write("        z-index: 1;\n");
      out.write("        /* Sit on top */\n");
      out.write("        left: 0;\n");
      out.write("        top: 0;\n");
      out.write("        width: 100%;\n");
      out.write("        /* Full width */\n");
      out.write("        height: 100%;\n");
      out.write("        /* Full height */\n");
      out.write("        overflow: auto;\n");
      out.write("        /* Enable scroll if needed */\n");
      out.write("        background-color: #474e5d;\n");
      out.write("        padding-top: 50px;\n");
      out.write("    }\n");
      out.write("    /* Modal Content/Box */\n");
      out.write("    \n");
      out.write("    .modal-content {\n");
      out.write("        /*background-color: #fefefe;*/\n");
      out.write("        background: rgba(0, 0, 0, 0.5);\n");
      out.write("        margin: 5% auto 15% auto;\n");
      out.write("        /* 5% from the top, 15% from the bottom and centered */\n");
      out.write("        border: 1px solid #888;\n");
      out.write("        width: 50%;\n");
      out.write("        /* Could be more or less, depending on screen size */\n");
      out.write("    }\n");
      out.write("    /* Style the horizontal ruler */\n");
      out.write("    \n");
      out.write("    hr {\n");
      out.write("        border: 1px solid #f1f1f1;\n");
      out.write("        margin-bottom: 25px;\n");
      out.write("    }\n");
      out.write("    /* The Close Button (x) */\n");
      out.write("    \n");
      out.write("    .close {\n");
      out.write("        position: absolute;\n");
      out.write("        right: 35px;\n");
      out.write("        top: 15px;\n");
      out.write("        font-size: 40px;\n");
      out.write("        font-weight: bold;\n");
      out.write("        color: #f1f1f1;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .close:hover,\n");
      out.write("    .close:focus {\n");
      out.write("        color: #f44336;\n");
      out.write("        cursor: pointer;\n");
      out.write("    }\n");
      out.write("    /* Clear floats */\n");
      out.write("    \n");
      out.write("    .clearfix::after {\n");
      out.write("        content: \"\";\n");
      out.write("        clear: both;\n");
      out.write("        display: table;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .checkboxgroup {\n");
      out.write("        width: 20em;\n");
      out.write("        overflow: auto;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .checkboxgroup p {\n");
      out.write("        width: 7em;\n");
      out.write("        text-align: right;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .checkboxgroup label {\n");
      out.write("        width: 12em;\n");
      out.write("        float: right;\n");
      out.write("    }\n");
      out.write("    /* Change styles for cancel button and signup button on extra small screens */\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("<body text=\"white\">\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            // assign onclick handler to hazard checkbox\n");
      out.write("    \n");
      out.write("            function inform()\n");
      out.write("            {\n");
      out.write("                alert(\"An email will be sent shortly to your ID with instructions on how to proceed\");\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <h1 style=\"align-content: center\">Upload PDFs</h1>\n");
      out.write("    ");

        if(request.getPart("file1")!=null)
        out.println("NOT NULL");
    
      out.write("\n");
      out.write("    <form>\n");
      out.write("        <input name=\"file1\" type=\"file\" >\n");
      out.write("        <input type=\"submit\">\n");
      out.write("    </form>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <a style=\"color: #f1f1f1\" href=\"admin_homepage.html\"> Homepage</a>\n");
      out.write("    <br>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
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
