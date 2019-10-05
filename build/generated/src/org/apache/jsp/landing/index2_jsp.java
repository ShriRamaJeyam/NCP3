package org.apache.jsp.landing;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import javax.servlet.http.Cookie;
import java.sql.*;

public final class index2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("\n");

    Connection con;
    try
    {
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
    }
    catch(Exception e)
    {
        ;
    }
    String ConnURL="jdbc:sqlserver://studysite.database.windows.net:1433;database=CourseWebsite;user=tibi@studysite;password=SriRama108!;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
    con=DriverManager.getConnection(ConnURL);
    Statement stmt=con.createStatement();
    Cookie[] ck=request.getCookies();
    boolean roleset=false;
    int role=-1;
    String ID="";
    for(int i=0;i!=ck.length;i++)
    {
        if(ck[i].getName().equals("role"))
        {
            roleset=true;
            role=Integer.parseInt(ck[i].getValue());
            
        }
        if(ck[i].getName().equals("ID"))
        {
            ID=ck[i].getValue();
        }
    }
    ResultSet rs=stmt.executeQuery("select * from logindet where cookie='"+ID+"' and role='"+role+"'");
    if(roleset==false||(rs.next()==false))
    {
        out.println("<head><meta http-equiv=\"refresh\" content=\"0; url=\\NCP3 \"></head>");
        out.close();
    }
    else
    {
        String name=rs.getString("name");

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.7.0/css/all.css\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"/NCP3/resources/vendor/bootstrap/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"/NCP3/resources/vendor/bootstrap/js/bootstrap.min.js\"></script>\n");
      out.write("        <title>Utilities Home</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <script>\n");
      out.write("            \n");
      out.write("            function MainFrameLink(a)\n");
      out.write("            {\n");
      out.write("               document.getElementById('mainframe').src=a;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            \n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-expand-sm bg-dark\">\n");
      out.write("            <img src=\"/NCP3/resources/images/logo.png\" style=\"width:80px\"/>\n");
      out.write("            <ul class=\"navbar-nav mr-auto\">\n");
      out.write("                \n");
      out.write("                <li><h3 style=\"color: whitesmoke;font-family:Lucida Console\">Amrita Course Management System</h3><li style=\"color: whitesmoke;font-family:Lucida Console\"><br><br>Welcome ");
 out.print(name); 
      out.write("</li></li>\n");
      out.write("            </ul>\n");
      out.write("            \n");
      out.write("            <div class=\"btn-group\">\n");
      out.write("                <button type=\"button\" class=\"btn btn-primary\" onclick=\"MainFrameLink('./home/')\"><i class=\"fa fa-home\" style=\"font-size:40px;color: whitesmoke\"></i></button>\n");
      out.write("                <button type=\"button\" class=\"btn btn-primary\" onclick=\"MainFrameLink('/NCP3/resetpassword.html')\"><i class=\"fa fa-key\" style=\"font-size:40px;color: whitesmoke\"></i></button>\n");
      out.write("                <button type=\"button\" class=\"btn btn-primary\" onclick=\"MainFrameLink('./profile/')\"><i class=\"fa fa-user-circle-o\" style=\"font-size:40px;color: whitesmoke\"></i></button>\n");
      out.write("                <button type=\"button\" class=\"btn btn-primary\"  onclick=\"window.location.href='/NCP3/logout'\"><i  class=\"fa fa-sign-out\" style=\"font-size:48px;color:whitesmoke\"></i></button>\n");
      out.write("            </div>\n");
      out.write("                \n");
      out.write("        </nav>\n");
      out.write("        <nav class=\"navbar navbar-expand-sm bg-warning \">\n");
      out.write("            \n");
      out.write("                <div class=\"btn-group\">\n");
      out.write("                <button type=\"button\" class=\"btn btn-primary\" onclick=\"MainFrameLink(' upload')\">Course Material</button>\n");
      out.write("                ");
 if(role==0){   
      out.write("\n");
      out.write("                <button type=\"button\" class=\"btn btn-primary\" onclick=\"MainFrameLink('../quiz')\">Quiz</button>\n");
      out.write("                ");
  } 
      out.write("\n");
      out.write("                <button type=\"button\" class=\"btn btn-primary\" onclick=\"MainFrameLink('./feedback/')\">Feedback</button>\n");
      out.write("                <button type=\"button\" class=\"btn btn-primary\">Registration</button>\n");
      out.write("                <button type=\"button\" class=\"btn btn-primary\">Fees</button>\n");
      out.write("                <!--<button  type=\"button\" class=\"btn btn-primary\">My Workspace</button>--->\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <ul class=\"navbar-nav ml-auto\">\n");
      out.write("            <li>\n");
      out.write("                    <select name=\"course\" class=\"form-control\"  style=\"width: 415px\">\n");
      out.write("                        <option >Home</option>\n");
      out.write("                        <option>Net Centric Programming</option>\n");
      out.write("                        <option>Internet Of Things</option>\n");
      out.write("                        <option>Structure And Interpretation of Computer Programs</option>\n");
      out.write("                        <option>Information Security</option>\n");
      out.write("                    </select>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("       \n");
      out.write("        <iframe id=\"mainframe\" style=\"border:none;width:100%;\" src=\"./upload/\" onload=\"this.style.height=(this.contentDocument.body.scrollHeight +70)+'px'; if((this.contentDocument.body.scrollHeight +70) <= 600) this.style.height='600px' \"/>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
 }
try
        {
            con.close();
        }
        catch(Exception e){;}

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
