<%-- 
    Document   : index
    Created on : Aug 20, 2019, 12:17:28 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
    
    //Cookie retrieval code
    Cookie[] ck=request.getCookies();
    boolean roleset=false;
    int role=-1;
    String ID="";
    String actualpass="";
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
    
    con=DriverManager.getConnection(Globals.univ.ConString);
    Statement stmt=con.createStatement();
    ResultSet rs = null;
    String[] tables = {"student","teacher","administrator"};
    System.out.println("ROLE:"+role);
    System.out.println("ID:"+ID);
    rs=stmt.executeQuery("select passcode from "+ tables[role] +" where cookie='"+ID+"'");

    if(rs.next()){
        System.out.println("HII");
        actualpass = rs.getString("passcode");
        System.out.println("retrievedPassINSIDE:"+rs.getString("passcode"));
    }
    System.out.println("retrievedPass:"+actualpass);
    
    if(request.getParameter("oldpassword").equals(actualpass))
    {
        System.out.println("Passmatch!!!");
        String newpass = request.getParameter("newpassword");
        String confirmpass = request.getParameter("confirmpassword");
        System.out.println("NEWPASS:"+newpass);
        System.out.println("CONFPASS:"+confirmpass);
        if(newpass.equals(confirmpass))
        {   
            System.out.println("YAAY!");
            Statement stmtnew = con.createStatement();
            stmt.execute("UPDATE "+ tables[role] +" SET passcode = '"+ newpass +"' WHERE cookie = '"+ ID +"';");
            %>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <title>Password changed successfully!</title>
                    </head>
                    <body>
                        <h1>Password changed successfully!</h1>

            <%
        }
        else
        {
            %>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <title>Confirm password mismatch</title>
                    </head>
                    <body>
                        <h1>Confirm password mismatch</h1>
            <%
        }
    }
    //con=DriverManager.getConnection(Globals.univ.ConString);
    //PreparedStatement stmt=con.prepareStatement("insert into course([name],unit1,unit2,unit3,credits) values (?,?,?,?,?)");
    else
    {
        %>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <title>Incorrect password</title>
                    </head>
                    <body>
                        <h1>Incorrect password</h1>
       <%
    }
    con.close();
%>
</body>
</html>