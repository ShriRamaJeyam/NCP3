<%-- 
    Document   : index
    Created on : Oct 8, 2019, 2:23:42 PM
    Author     : Niranjan Kumar K S
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<form method="post">
    <center> <h1><br>Results<br></h1></center>
<table class="dsgntbl">
<tr>
    <th>Subject</th>
    <th>Periodical 1</th>
    <th>Periodical 2</th>
    <th>Periodical 3</th>
    <th>Internals</th>
    <th>End Semester</th>
</tr>
<%
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con=DriverManager.getConnection(Globals.univ.ConString);
    Statement stmt=con.createStatement();
    Globals.univ.logincheck(request, response);
    int sid=((data.login)request.getSession().getAttribute("state")).id;
    ResultSet rs=stmt.executeQuery("select course.courseid courseid,course.[name] [name],p1marks,p2marks,p3marks,semestermarks,internal from courseenrollment,course where course.courseid=courseenrollment.courseid and approved=1 and courseenrollment.studentid="+sid+"");
    int rowcount=0;
    while(rs.next())
    {
        rowcount++;
%>
    <tr style="font-size: 20px;font-weight: bold;">
        <td>
            <%= rs.getString("name") %>
            <input type="hidden" name="<%= rowcount %>" value="<%= rs.getString("name") %>" />
        </td>
        <td><%= (rs.getString("p1marks")!=null?rs.getString("p1marks"):"0")  %></td>
        <td><%= (rs.getString("p2marks")!=null?rs.getString("p2marks"):"0")  %></td>
        <td><%= (rs.getString("p3marks")!=null?rs.getString("p3marks"):"0")  %></td>
        <td><%= (rs.getString("internal")!=null?rs.getString("internal"):"0")  %></td>
        <td><%= (rs.getString("semestermarks")!=null?rs.getString("semestermarks"):"0") %></td>
    </tr>
  <%}
    rs.close();
    stmt.close();
    con.close();
%>
</table>
<input type="hidden" value="<%= request.getParameter("cid") %>" name="cid" />
<input type="hidden" value="<%= rowcount %>" name="rowcount" /><br>

</form>

