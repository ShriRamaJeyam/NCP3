<%-- 
    Document   : index
    Created on : Oct 7, 2019, 3:21:29 PM
    Author     : Niranjan Kumar K S
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        Globals.univ.logincheck(request, response);
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con=DriverManager.getConnection(Globals.univ.ConString);
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select courseid,name,p1,p2,p3,endsem from course");
        String p1="<tr><th>Exam Name</th><th>Date Of Exam</th></tr>",p2="<tr><th>Exam Name</th><th>Date Of Exam</th></tr>",p3="<tr><th>Exam Name</th><th>Date Of Exam</th></tr>",es="<tr><th>Exam Name</th><th>Date Of Exam</th></tr>";
        while(rs.next())
        {
            p1+="<tr>"+"<td>"+rs.getString("name") +"</td>"+"<td>"+rs.getString("p1") +"</td>"+"</tr>";
            p2+="<tr>"+"<td>"+rs.getString("name") +"</td>"+"<td>"+rs.getString("p2") +"</td>"+"</tr>";
            p3+="<tr>"+"<td>"+rs.getString("name") +"</td>"+"<td>"+rs.getString("p3") +"</td>"+"</tr>";
            es+="<tr>"+"<td>"+rs.getString("name") +"</td>"+"<td>"+rs.getString("endsem") +"</td>"+"</tr>";
        }
        rs.close();
        stmt.close();
        con.close();
%>
<style>
.dsgntbl    {
  padding: 10px;
  font-family:  sans-serif;
  border-collapse: collapse;
  width: 100%;
}

.dsgntbl td,th {
  padding: 5px;
  border: 1px solid black;
  text-align: center;
  padding: 8px;
}

.dsgntbl tr:nth-child(even) {
  background-color: #dddddd;
}
.dsgntbl th{
    background-color: #0084da;
    color: white;
} 
</style>
<h1>Periodical 1</h1><br>
<table class="dsgntbl"><%= p1 %></table><br>
<h1>Periodical 2</h1><br>
<table class="dsgntbl"><%= p2 %></table><br>
<h1>Periodical 3</h1><br>
<table class="dsgntbl"><%= p3 %></table><br>
<h1>End Semester</h1><br>
<table class="dsgntbl"><%= es %></table><br>
<%
    try{rs.close();}catch(Exception e){}
    try{stmt.close();}catch(Exception e){}
    try{con.close();}catch(Exception e){}
%>
