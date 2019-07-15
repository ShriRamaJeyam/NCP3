<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.util.*,javax.servlet.http.Cookie,java.sql.*" %>
<%
    Connection con;
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
%>
<html>
    <head>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="/NCP3/resources/vendor/bootstrap/css/bootstrap.min.css">
        <script src="/NCP3/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
        <title>Utilities Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            
            function MainFrameLink(a)
            {
               document.getElementById('mainframe').src=a;
                
            }
            
        </script>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark">
            <img src="/NCP3/resources/images/logo.png" style="width:80px"/>
            <ul class="navbar-nav mr-auto">
                
                <li><h3 style="color: whitesmoke;font-family:Lucida Console">Amrita Course Management System</h3><li style="color: whitesmoke;font-family:Lucida Console"><br><br>Welcome <% out.print(name); %></li></li>
            </ul>
            
            <div class="btn-group">
                <button type="button" class="btn btn-primary" onclick="MainFrameLink('./home/')"><i class="fa fa-home" style="font-size:40px;color: whitesmoke"></i></button>
                <button type="button" class="btn btn-primary" onclick="MainFrameLink('./psw/')"><i class="fa fa-key" style="font-size:40px;color: whitesmoke"></i></button>
                <button type="button" class="btn btn-primary" onclick="MainFrameLink('./profile/')"><i class="fa fa-user-circle-o" style="font-size:40px;color: whitesmoke"></i></button>
                <button type="button" class="btn btn-primary"  onclick="window.location.href='/NCP3/logout'"><i  class="fa fa-sign-out" style="font-size:48px;color:whitesmoke"></i></button>
            </div>
                
        </nav>
        <nav class="navbar navbar-expand-sm bg-info ">
            
                <div class="btn-group">
                    <button type="button" class="btn btn-danger" onclick="MainFrameLink('./attendance1/')">Attendance</button>
                <button type="button" class="btn btn-danger" onclick="MainFrameLink('./grades/')">Grades</button>
                <button type="button" class="btn btn-success" onclick="MainFrameLink('./feedback/')">Feedback</button>
                <button type="button" class="btn btn-success">Registration</button>
                <button type="button" class="btn btn-success">Fees</button>
                <!--<button  type="button" class="btn btn-primary">My Workspace</button>--->
            </div>
            
            <ul class="navbar-nav ml-auto">
            <li>
                    <select name="course" class="form-control"  style="width: 415px">
                        <option >Home</option>
                        <option>Net Centric Programming</option>
                        <option>Internet Of Things</option>
                        <option>Structure And Interpretation of Computer Programs</option>
                        <option>Information Security</option>
                    </select>
                </li>
            </ul>
        </nav>
       
        <iframe id="mainframe" style="border:none;width:100%;" src="./home/" onload="this.style.height=(this.contentDocument.body.scrollHeight +70)+'px'; if((this.contentDocument.body.scrollHeight +70) <= 600) this.style.height='600px' "/>
        
    </body>
</html>
<% }
try
        {
            con.close();
        }
        catch(Exception e){;}
%>