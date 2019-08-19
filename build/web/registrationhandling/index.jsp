<%-- 
    Document   : index
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
    PreparedStatement stmt=con.prepareStatement("insert into student([name],dob,email,username,passcode) values (?,?,?,?,?)");
    //System.out.println(request.getParameter("coursename")+request.getParameter("p1")+request.getParameter("p2")+request.getParameter("p3")+request.getParameter("credits"));
    stmt.setString(1,request.getParameter("name"));
    System.out.println("ALO0\n"+request.getParameter("dob"));
    stmt.setDate(2,java.sql.Date.valueOf(request.getParameter("dob")));
    stmt.setString(3,request.getParameter("email"));
    stmt.setString(4,request.getParameter("user"));
    stmt.setString(5,request.getParameter("pass"));
    stmt.executeUpdate();
    con.close();
    Utilities.EmailSend.Send(request.getParameter("email"),"Registration for ACMS","<h1>Dear "+request.getParameter("name")+",\nThank You for registering with us.\n-Amrita Course Management System</h1>");
%>
<html>
    <head>
       <meta http-equiv="refresh" content="0; url=\NCP3\">
    </head>
</html>
