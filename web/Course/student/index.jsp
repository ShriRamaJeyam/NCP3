<%-- 
    Document   : index
    Created on : Oct 7, 2019, 1:20:36 PM
    Author     : Niranjan Kumar K S
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="/NCP3/ckeditor/ckeditor.js"></script>
  <script>
      var cid=0;
      var isa=0;
      function getlink(link,post='')
      {
        if(link=='announcements')
            isa=1;
        else
            isa=0;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() 
        {
            if (this.readyState == 4) 
            {
                document.getElementById("body").innerHTML = xhttp.responseText;
                if(this.readyState!=200)
                console.log(xhttp.responseText)
                if(isa==1)
                {
                    CKEDITOR.replace('announcement');
                }
            }
        };
        link+=('?cid='+cid);
        link+=post;
        xhttp.open("GET",link, true);
        xhttp.send(); 
      }
      var fn1=function()
    {
      var name = document.getElementById('real-input').value.split(/\\|\//).pop();
      var truncated = name.length > 40 ? name.substr(0,20)+"..."+name.substr(name.length-9,name.length-1) : name;
      document.getElementById('FileName').value=name;
      document.getElementById('file-info').innerHTML = truncated;
    };
  </script>
  
</head>
    <%
        Globals.univ.logincheck(request, response);
        int role=((data.login)request.getSession().getAttribute("state")).role;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con=DriverManager.getConnection(Globals.univ.ConString);
        Statement stmt=con.createStatement();
        ResultSet rs;
        if(role==0)
        rs=stmt.executeQuery("select courseid,name from course where courseid in(select courseid from courseenrollment where studentid="+((data.login)(request.getSession(true).getAttribute("state"))).id+")");
        else
        rs=stmt.executeQuery("select courseid,name from course where courseid in(select courseid from facultyenrollment where teacherid="+((data.login)(request.getSession(true).getAttribute("state"))).id+")");
    %>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        Subjects
                    </a>
                    <div class="dropdown-menu">
                        <%
                            String z="";
                            boolean entry=true;
                            while(rs.next())
                            {   
                            if(entry)
                            {
                                z+="<script> cid="+rs.getString("courseid")+";document.getElementById('subname').innerHTML = '"+rs.getString("name")+"' ; </script>";
                                entry=false;
                            }
                        %>
                            <a class="dropdown-item" style="cursor: pointer;" onclick="cid=<%= rs.getString("courseid") %> ;document.getElementById('subname').innerHTML = '<%= rs.getString("name") %>' ;"><%= rs.getString("name") %></a>
                        <%  }
                        %>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="font-weight: bold;" id="subname"></a>
                </li>
                <li class="nav-item" onclick="getlink('announcements')" style="cursor: pointer">
                    <a class="nav-link">Announcements</a>
                </li>
                <li class="nav-item" onclick="getlink('files')" style="cursor: pointer">
                    <a class="nav-link" >Files</a>
                </li>
                <li class="nav-item" onclick="getlink('unit','&unit=1')" style="cursor: pointer">
                    <a class="nav-link" >Unit1</a>
                </li>
                <li class="nav-item" onclick="getlink('unit','&unit=2')" style="cursor: pointer">
                    <a class="nav-link" >Unit2</a>
                </li>
                <li class="nav-item" onclick="getlink('unit','&unit=3')" style="cursor: pointer">
                    <a class="nav-link" >Unit3</a>
                </li>
                <li class="nav-item" onclick="getlink('examschedule')" style="cursor: pointer">
                    <a class="nav-link" >ExamTimeTable</a>
                </li>
                <%
                    if(Globals.univ.logincheck(request, response)&&(((data.login)request.getSession().getAttribute("state")).role==1))
                    {%>
                <li class="nav-item" onclick="getlink('../teacher/marks')" style="cursor: pointer">
                    <a class="nav-link" >UpdateMarks</a>
                </li>        
                  <%}   
                    else
                    {%>
                    
                    <li class="nav-item" onclick="getlink('/NCP3/Course/student/marks/')" style="cursor: pointer">
                    <a class="nav-link" >Marks</a>
                </li>
                  <%}
                %>
            </ul>
        </nav>
        <br>
        <div style="padding:40px;padding-top:20px" id="body">
        </div>
    </body>
    <%
        out.print(z);
        String who=request.getParameter("who");
        if(who!=null)
        {
            if(who.equals("2")){
                %><script>  getlink('files');</script><%
            }
            else if(who.equals("1")){
            %><script>  getlink('announcements');</script><%

            }
            else if(who.equals("3")){
            %><script>  getlink('../teacher/marks');</script><%
            }
        }
    %>
    
</html>

<%
    try{rs.close();}catch(Exception e){}
    try{stmt.close();}catch(Exception e){}
    try{con.close();}catch(Exception e){}
%>
