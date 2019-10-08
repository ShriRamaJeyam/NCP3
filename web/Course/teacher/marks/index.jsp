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
<form action="/NCP3/Course/teacher/marks/update" method="post">
<table class="dsgntbl">
<tr>
    <th>Roll Number</th>
    <th>Periodical 1</th>
    <th>Periodical 1</th>
    <th>Periodical 1</th>
    <th>Internals</th>
    <th>End Semester</th>
</tr>
<%
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con=DriverManager.getConnection(Globals.univ.ConString);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select * from courseenrollment where courseid="+request.getParameter("cid")+" order by studentid");
    int rowcount=0;
    while(rs.next())
    {
        rowcount++;
%>
    <tr style="font-size: 20px;font-weight: bold;">
        <td>
            <%= rs.getString("studentid") %>
            <input type="hidden" name="<%= rowcount %>" value="<%= rs.getString("studentid") %>" />
        </td>
        <td><input type="number" min="0" max="50" default="0" step="0.25" name="<%= ""+rowcount+"_p1" %>" value="<%= (rs.getString("p1marks")!=null?rs.getString("p1marks"):"0")  %>" /></td>
        <td><input type="number" min="0" max="50" step="0.25" name="<%= ""+rowcount+"_p2" %>" value="<%= (rs.getString("p2marks")!=null?rs.getString("p2marks"):"0")  %>" /></td>
        <td><input type="number" min="0" max="50" step="0.25" name="<%= ""+rowcount+"_p3" %>" value="<%= (rs.getString("p3marks")!=null?rs.getString("p3marks"):"0")  %>" /></td>
        <td><input type="number" min="0" max="20" step="0.01" name="<%= ""+rowcount+"_in" %>" value="<%= (rs.getString("internal")!=null?rs.getString("internal"):"0")  %>" /></td>
        <td><input type="number" min="0" max="100" step="0.25" name="<%= ""+rowcount+"_es" %>" value="<%= (rs.getString("semestermarks")!=null?rs.getString("semestermarks"):"0") %>" /></td>
    </tr>
  <%}
    rs.close();
    stmt.close();
    con.close();
%>
</table>
<input type="hidden" value="<%= request.getParameter("cid") %>" name="cid" />
<input type="hidden" value="<%= rowcount %>" name="rowcount" /><br>
<center><input type="submit" class="btn btn-primary" /></center>
</form>

