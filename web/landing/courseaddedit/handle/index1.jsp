<%-- 
    Document   : index
    Created on : Oct 6, 2019, 3:39:01 PM
    Author     : Niranjan Kumar K S
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
     Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
    Connection con=DriverManager.getConnection(Globals.univ.ConString);
    boolean error=true;
    //System.out.println(request.);
    System.out.println("__________________________________________________________________\n\n\n\n\n\n\n\n\n\n\n\n\n");
    System.out.println(request.getParameter("id"));
    System.out.println(request.getAttribute("id"));
    if(request.getParameter("id")==null)
    {
        System.out.println(request.getParameter("p1"));
        System.out.println("insert");
        PreparedStatement stmt=con.prepareStatement("insert into course(name,unit1,unit2,unit3,p1,p2,p3,endsem,credits) values(?,?,?,?,?,?,?,?,?)");
        stmt.setString(1,request.getParameter("name"));
        stmt.setString(2,request.getParameter("unit1"));
        stmt.setString(3,request.getParameter("unit2"));
        stmt.setString(4,request.getParameter("unit3"));
        System.out.println(request.getParameter("p1"));
        stmt.setDate(5,Date.valueOf(request.getParameter("p1")));
        stmt.setDate(6,Date.valueOf(request.getParameter("p2")));
        stmt.setDate(7,Date.valueOf(request.getParameter("p3")));
        stmt.setDate(8,Date.valueOf(request.getParameter("endsem")));
        stmt.setInt(9,Integer.parseInt(request.getParameter("credits")));
        stmt.executeUpdate();
        error=false;
        stmt.close();
    }
    else
    {
        
        PreparedStatement stmt=con.prepareStatement("update course set name=?,unit1=?,unit2=?,unit3=?,p1=?,p2=?,p3=?,endsem=?,credits=? where courseid="+request.getParameter("id"));
        stmt.setString(1,request.getParameter("name"));
        stmt.setString(2,request.getParameter("unit1"));
        stmt.setString(3,request.getParameter("unit2"));
        stmt.setString(4,request.getParameter("unit3"));
        System.out.println(request.getParameter("p1"));
        stmt.setDate(5,Date.valueOf(request.getParameter("p1")));
        
        stmt.setDate(6,Date.valueOf(request.getParameter("p2")));
        stmt.setDate(7,Date.valueOf(request.getParameter("p3")));
        stmt.setDate(8,Date.valueOf(request.getParameter("endsem")));
        stmt.setInt(9,Integer.parseInt(request.getParameter("credits")));
        stmt.executeUpdate();
        error=false;
        stmt.close();
    }
    
    con.close();
%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="refresh" content="0;url=\\NCP3\\landing\\courseaddedit\\view\\">
        
        <script>
         <%
         if(error)
         {%>alert("Unexpected error occured");<%}
         else
         {%>alert("Success");<%}
         %>   
        </script>
        
    </head>
    <body>
        <h1></h1>
    </body>
</html>
