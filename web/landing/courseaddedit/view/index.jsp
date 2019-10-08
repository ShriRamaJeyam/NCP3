<%-- 
    Document   : index
    Created on : Oct 6, 2019, 3:40:52 PM
    Author     : Niranjan Kumar K S
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con=DriverManager.getConnection(Globals.univ.ConString);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select courseid,name,p1,p2,p3,endsem,credits from course");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <style>
table {
  padding: 10px;
  font-family:  sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  padding: 5px;
  border: 1px solid black;
  text-align: center;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
th{
    background-color: #0084da;
    color: white;
}
</style>
        <title>Course List</title>
    </head>
    <body style="padding:20px">
        <table>
            <tr>
                <th>CourseID</th>
                <th>Name</th>
                <th>Periodical 1</th>
                <th>Periodical 2</th>
                <th>Periodical 3</th>
                <th>End Semester</th>
                <th>Credits</th>
                <th>Edit</th>
            </tr>
            <%
            while(rs.next())
            { %>
            <tr>
                <td><%=rs.getString("courseid") %></td>
                <td><%=rs.getString("name") %></td>
                <td><%=rs.getString("p1") %></td>
                <td><%=rs.getString("p2") %></td>
                <td><%=rs.getString("p3") %></td>
                <td><%=rs.getString("endsem") %></td>
                <td><%=rs.getString("credits") %></td>
                <td>
                    <form action="../">
                        <input type="hidden" name="id" value="<%=rs.getString("courseid") %>">
                        <button class="btn btn-primary" type="submit">Edit</button>
                    </form>
                    
                </td>
                
            </tr>
           <% }
            rs.close();
            stmt.close();
            con.close();
            %>
        </table>
        <br>
        <center>
            <form action="../">
                <button type="submit" class="btn btn-primary">Add</button>
            </form>
        </center>
    </body>
</html>
