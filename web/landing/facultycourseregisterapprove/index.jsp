<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    if(Globals.univ.logincheck(request, response)&&((data.login)(request.getSession(true).getAttribute("state"))).role==2)
    {

    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con=DriverManager.getConnection(Globals.univ.ConString);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select course.courseid cid,course.[name] cname,teacher.teacherid [sid],teacher.[name] sname from ((course join facultyenrollment on course.courseid=facultyenrollment.courseid) join teacher on teacher.teacherid=facultyenrollment.teacherid) where ((approved IS NULL) or (approved!=1));");
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
                <th>CourseName</th>
                <th>FacultyID</th>
                <th>FacultyName</th>
                <th>Approve</th>
            </tr>
            <%
            while(rs.next())
            { %>
            <tr>
                <td><%=rs.getString("cid") %></td>
                <td><%=rs.getString("cname") %></td>
                <td><%=rs.getString("sid") %></td>
                <td><%=rs.getString("sname") %></td>
                <td>
                    <form action="handle">
                        <input type="hidden" name="cid" value="<%=rs.getString("cid") %>">
                        <input type="hidden" name="fid" value="<%=rs.getString("sid") %>">
                        <button class="btn btn-primary" type="submit">Approve</button>
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
    </body>
</html>
<%
    }
else{
%>
<script>
    window.location.href='/NCP3/landing/';
</script>
<%
}

%>