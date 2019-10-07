<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <%          
                if(Globals.univ.logincheck(request, response)==false)
                {
                    out.println("<head>");
                    out.println("<meta http-equiv=\"refresh\" content=\"0; url=\\NCP3\\logout\">");           
                    out.println("</head>");
                }
                else
                {
                int role=-1;    
                HttpSession ssn=request.getSession();
                if(ssn!=null)
                {
                    role=((data.login)ssn.getAttribute("state")).role;
                }
                boolean isedit=false;
                String id=null,p1=null,p2=null,p3=null,u1=null,u2=null,u3=null,credit=null,name=null,endsem=null;
                if(request.getParameter("id")!=null)
                {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    Connection con=DriverManager.getConnection(Globals.univ.ConString);
                    Statement stmt=con.createStatement();
                    ResultSet rs=stmt.executeQuery("select * from course where courseid="+request.getParameter("id"));
                    if(rs.next())
                    {
                        isedit=true;
                        id=request.getParameter("id");
                        p1=rs.getString("p1");
                        p2=rs.getString("p2");
                        p3=rs.getString("p3");
                        u1=rs.getString("unit1");
                        if(u1!=null)
                        u1 = DatatypeConverter.printBase64Binary(u1.getBytes());
                        
                        u2=rs.getString("unit2");
                        if(u2!=null)
                        u2 = DatatypeConverter.printBase64Binary(u2.getBytes());
                        u3=rs.getString("unit3");
                        if(u3!=null)
                        u3 = DatatypeConverter.printBase64Binary(u3.getBytes());
                        endsem=rs.getString("endsem");
                        credit=rs.getString("credits");
                        name=rs.getString("name");
                    }
              
                }
            
        
        if(role==2){ %>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Mgmt</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/styles.min.css">
    <script src="/NCP3/ckeditorfull/ckeditor/ckeditor.js"></script>
    
</head>

<body>
    <div class="contact-clean" style="background-image:url(&quot;assets/img/background.jpg&quot;);padding:36px;">
        <form method="POST" action="handle" style="margin:15px;width:1201px;">
            <h2 class="text-center">Add or Edit Course</h2>
            <%
            if(isedit){
            %><input type="hidden" name="id" value="<%=id%>" /><% }
            %>
            <div class="form-group"><input class="form-control" type="text" name="name" value="<%= (name!=null?name:"") %>" required="" placeholder="Course Name"></div>
            <div class="form-group"><input class="form-control" type="number" name="credits" value="<%= (credit!=null?credit:"") %>" placeholder="Credits" min="1" max="20" step="1"></div>
                      
            <div class="form-group"><label>Periodical 1 Date</label><input  class="form-control" type="date" value="<%= (p1!=null?p1:"") %>" name="p1" required=""></div>
            <div class="form-group"><label>Periodical 2 Date</label><input class="form-control" type="date" name="p2" value="<%= (p2!=null?p2:"") %>" required=""></div>
            <div class="form-group"><label>Periodical 3 Date</label><input class="form-control" type="date" name="p3" value="<%= (p3!=null?p3:"") %>" required=""></div>
            <div class="form-group"><label>End Semester Date</label><input class="form-control" type="date" value="<%= (endsem!=null?endsem:"") %>" name="endsem" required=""></div><label>Unit 1</label>
            <div class="form-group">
                <textarea class="form-control" rows="14" id="u1"  name="unit1">
                </textarea>
            </div>
            <label>Unit 2</label>
            <div class="form-group">
                <textarea class="form-control" rows="14" id="u2"  name="unit2">
                </textarea>
            </div>
            <label>Unit 3</label>
            <div class="form-group">
                <textarea class="form-control" rows="14"  id="u3" name="unit3">
                </textarea>
            </div>
            <div class="form-group"><button class="btn btn-primary" type="submit">Add / Edit Course</button></div>
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
    <script>
        
        var u1='<%=(u1!=null?u1:"")%>';
        var u2='<%=(u2!=null?u2:"")%>';
        var u3='<%=(u3!=null?u3:"")%>';
        u1=atob(u1);
        console.log(u1);
        u2=atob(u2);
        u3=atob(u3);
        document.getElementById('u1').value=u1;
        document.getElementById('u2').value=u2;
        document.getElementById('u3').value=u3;
        /*CKEDITOR.instances.u1.insertHtml=u1;
        CKEDITOR.instances.u2.insertHtml=u2;
        CKEDITOR.instances.u3.insertHtml=u3;*/
        CKEDITOR.replace('u1');
        CKEDITOR.replace('u2');
        CKEDITOR.replace('u3');
    </script>
</body>
<% }

else
{
    out.println("<head>");
    out.println("<meta http-equiv=\"refresh\" content=\"0; url=\\NCP3\\logout\">");           
    out.println("</head>");
}
}%>
</html>