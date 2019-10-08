<%-- 
    Document   : index
    Created on : Oct 7, 2019, 6:59:49 PM
    Author     : Niranjan Kumar K S
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Globals.univ.logincheck(request, response);
    HttpSession ssn=request.getSession();
    int role=((data.login)(ssn.getAttribute("state"))).role;
    if(role==1)
    {
        %>
        <form method="post" action="/NCP3/announce">
            <textarea id="announcement" name="announcement"></textarea><br><br>
            <input type="hidden" name="cid" value="<%= request.getParameter("cid") %>" />
            <input type="submit" class="btn btn-success" />
        </form>
        <%
    }
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con=DriverManager.getConnection(Globals.univ.ConString);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select courseid,ID,message from announcement where courseid=" + request.getParameter("cid") + " order by ID desc");
    while(rs.next())
    {%>
    <div class="container" style="background:greenyellow;margin:10px;padding:5px;border-radius:10px;">
        <%= rs.getString("message") %>
    </div>    
  <%}
%>
<%
    try{rs.close();}catch(Exception e){}
    try{stmt.close();}catch(Exception e){}
    try{con.close();}catch(Exception e){}
%>
