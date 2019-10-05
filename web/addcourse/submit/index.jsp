<%--     Document   : index
    Created on : Aug 19, 2019, 2:35:06 PM
    Author     : Niranjan Kumar K S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.*,javax.servlet.http.Cookie,java.sql.*" %>
<%
    Connection con;
    try
    {
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
    }
    catch(Exception e)
    {
        ;
    }
    con=DriverManager.getConnection(Globals.univ.ConString);
    PreparedStatement stmt=con.prepareStatement("insert into course([name],unit1,unit2,unit3,credits) values (?,?,?,?,?)");
    System.out.println(request.getParameter("coursename")+request.getParameter("p1")+request.getParameter("p2")+request.getParameter("p3")+request.getParameter("credits"));
    stmt.setString(1,request.getParameter("coursename"));
    stmt.setString(2,request.getParameter("p1"));
    stmt.setString(3,request.getParameter("p2"));
    stmt.setString(4,request.getParameter("p3"));
    stmt.setInt(5, (int)(Integer.parseInt(request.getParameter("credits"))));
    stmt.executeUpdate();
    con.close();
%>
<html>
    <head>
       <meta http-equiv="refresh" content="0; url=\NCP3\addcourse">
    </head>
</html>
