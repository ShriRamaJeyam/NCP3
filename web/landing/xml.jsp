<%@page contentType="text/xml"%>
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
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("SELECT count(*) as cnt FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '"+request.getParameter("table") +"'");
    rs.next();
    Integer cnt=rs.getInt("cnt");
    System.out.println("SriRamaJeyam _ "+cnt);
    try{
        if(Integer.parseInt(request.getParameter("css"))==1)
        {
            out.println("<?xml-stylesheet type=\"text/css\" href=\"/NCP3/landing/xml/"+request.getParameter("table")+".css\"?>");
        }
        
        }
    catch(Exception e)
    {
        
    }
    String lst[]=new String[cnt.intValue()+5];
    stmt=con.createStatement();
    System.out.println("SriRamaJeyam0");
    rs=stmt.executeQuery("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '"+request.getParameter("table") +"'");
    int z=0;
    System.out.println("SriRamaJeyam1");
    while(rs.next())
    {
        System.out.println("SriRamaJeyam");
        lst[z]=rs.getString("COLUMN_NAME");
        z++;
    }
    System.out.println("SriRamaJeyam CHK1");
    stmt=con.createStatement();
    rs=stmt.executeQuery("select * from "+request.getParameter("table")+";");
    out.println("<"+request.getParameter("table")+"s>");
    System.out.println("Hare Krishna");
    while(rs.next())
    {
        out.println("<"+request.getParameter("table")+">");
        System.out.println(lst[z]);
        for(int i=0;i!=z;i++)
        {
            out.println("<"+lst[i]+">");
            out.println(rs.getString(lst[i]));
            out.println("</"+lst[i]+">");
        }
        out.println("</"+request.getParameter("table")+">");
    }
    out.println("</"+request.getParameter("table")+"s>");
%>