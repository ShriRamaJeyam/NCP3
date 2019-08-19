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
    String ConnURL="jdbc:sqlserver://studysite.database.windows.net:1433;database=CourseWebsite;user=tibi@studysite;password=SriRama108!;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
    con=DriverManager.getConnection(ConnURL);
    Statement stmt=con.createStatement();
    Cookie[] ck=request.getCookies();
    boolean roleset=false;
    int role=-1;
    String ID="";
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
    ResultSet rs=stmt.executeQuery("select * from logindet where cookie='"+ID+"' and role='"+role+"'");
    if(roleset==false||(rs.next()==false))
    {
        out.println("<head><meta http-equiv=\"refresh\" content=\"0; url=\\NCP3 \"></head>");
        out.close();
    }
    else
    {
        String name=rs.getString("name");
%>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CourseWebsite</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aclonica">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/styles.min.css">
    <script>
            
            function MainFrameLink(a)
            {
               document.getElementById('MainFrame').src=a;
                
            }
            function SizeAdjust()
            {
                var element=document.getElementById('MainFrame');
                var height=element.contentWindow.document.body.offsetHeight;
                if(height + 500 <= 1500)
                {
                    element.style.height='1500px';
                }
                else
                {
                    element.style.height=''+(height+500)+'px';
                } 
                console.log("Hello Called");
            }
    </script>
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-md bg-warning" style="padding:4px 4px;height:139px;">
        <div class="container-fluid"><a class="navbar-brand" href="#" style="font-family:Aclonica, sans-serif;"><img src="assets/img/logo.png" style="width:100px;"></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div
                class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="#" style="font-family:Aclonica, sans-serif;font-size:30px;"><br><strong>Amrita Course Management System</strong><br><br></a></li>
                    <li class="nav-item align-self-end" role="presentation" style="font-size:16px;color:rgb(13,124,235);"><a class="nav-link active align-items-center align-content-center align-self-center" style="font-family:Aclonica, sans-serif;font-size:16px;">Hello,  <% out.print(name); %><div class="btn-group align-self-center" role="group"></div><br></a></li>
                    <li
                        class="nav-item align-self-center" role="presentation">
                        <a class="nav-link active align-items-center align-content-center align-self-center" style="height:80px;width:400px;">
                            <div class="btn-group align-self-center" role="group">
                                <button type="button" style="height:80px;width:80px;" class="btn btn-primary" onclick="MainFrameLink('./home/')"><i class="fa fa-home" style="font-size:40px;color: whitesmoke"></i></button>
                                <button type="button" style="height:80px;width:80px;" class="btn btn-primary" onclick="MainFrameLink('/NCP3/resetpassword.html')"><i class="fa fa-key" style="font-size:40px;color: whitesmoke"></i></button>
                                <button type="button" style="height:80px;width:80px;" class="btn btn-primary" onclick="MainFrameLink('./profile/')"><i class="fa fa-user-circle-o" style="font-size:40px;color: whitesmoke"></i></button>
                                <button type="button" style="height:80px;width:80px;" class="btn btn-primary"  onclick="window.location.href='/NCP3/logout'"><i  class="fa fa-sign-out" style="font-size:48px;color:whitesmoke"></i></button>
                            </div><br></a>
                         </li>
                </ul>
        </div>
        </div>
    </nav>
    <nav class="navbar navbar-light navbar-expand-md bg-success">
        <div class="container-fluid"><a class="navbar-brand" href="#"></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-2"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                id="navcol-2">
                <ul class="nav navbar-nav">
                  <% if(role==2){ %>
                    <li class="nav-item" role="presentation" style="font-size:20px;"><a class="nav-link active" target="MainFrame" href="#" onclick="">First Item</a></li>
                  
                    <% } %>
                </ul>
            </div>
        </div>
    </nav><div class="embed-responsive embed-responsive-16by9">
        <iframe name="MainFrame" id="MainFrame" class="embed-responsive-item" src="http://www.w3.org" onload="SizeAdjust()                      "></iframe></div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>
<% }
try
        {
            con.close();
        }
        catch(Exception e){;}
%>