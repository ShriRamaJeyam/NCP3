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
  <script>
      var cid=0;
      function getlink(link,post='')
      {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() 
        {
            if (this.readyState == 4 && this.status == 200) 
            {
                document.getElementById("body").innerHTML = xhttp.responseText;
            }
        };
        link+=('?cid='+cid);
        link+=post;
        xhttp.open("GET",link, true);
        xhttp.send(); 
      }
  </script>
</head>
    <%
        Globals.univ.logincheck(request, response);
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con=DriverManager.getConnection(Globals.univ.ConString);
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select courseid,name from course where courseid in(select courseid from courseenrollment where studentid="+((data.login)(request.getSession(true).getAttribute("state"))).id+")");
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
                            while(rs.next())
                            {   %>
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
                
            </ul>
        </nav>
        <br>
        <div style="padding:40px;padding-top:20px" id="body">
        </div>
    </body>
</html>

