<%-- 
    Document   : index.jsp
    Created on : Oct 7, 2019, 4:50:37 PM
    Author     : Niranjan Kumar K S
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
body {
  font-family: sans-serif;
}
.input-container {
  margin: 3em auto;
  max-width: 500px;
  background-color: #EDEDED;
  border: 1px solid #DFDFDF;
  border-radius: 5px;
}
input[type='file'] {
  display: none;
}
.file-info {
  font-size: 0.9em;
}
.browse-btn {
  background: #03A595;
  color: #fff;
  min-height: 35px;
  padding: 10px;
  border: none;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
}
.browse-btn:hover {
  background: #4ec0b4;
}
@media (max-width: 500px) {
  button {
    width: 100%;
    border-top-right-radius: 5px;
    border-bottom-left-radius: 0;
  }
  
  .file-info {
    display: block;
    margin: 10px 5px;
  }
}
input[type='file'] {
  display: none;
}
.thumbnail
{
    background-color:rgb(235,235,255);
}
.thumbnail:hover
{
    background-color:rgb(205,205,225);
}
</style>
<script type="text/javascript">
            console.log("Hello");
            
</script>
<%
    Globals.univ.logincheck(request, response);
    HttpSession ssn=request.getSession();
    int role=((data.login)(ssn.getAttribute("state"))).role;
    if(role==1)
    {
        %>
        
        <form method="post"  enctype="multipart/form-data" action="/NCP3/landing/upload/do">
            <div class="input-container">
                <input type="hidden" value="" id="FileName" name="FileName">
                <input type="hidden" value="<%=request.getParameter("cid") %>" name="cid">
                <input type="file" id="real-input" onchange="fn1()" name="file" required>
                    <button class="browse-btn" id="browse-btn" onclick="document.getElementById('real-input').click()">
                            Browse Files
                    </button>
                    <span class="file-info" id="file-info">Upload a file</span>
            </div>
            <div style="display:block;margin-left: auto;margin-right: auto;width: 3%">
                <input type="submit" class="btn btn-success">
            </div>
        </form>
        <%
    }
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con=DriverManager.getConnection(Globals.univ.ConString);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select materialid fileid,[filename] [name],size from coursematerials where courseid="+request.getParameter("cid"));
    %><div class="row"><%
    while(rs.next())
    {
        String name=rs.getString("name");
    %>    
        <div class="col-sm-3" style="padding:8px;"> 
                     <div class="thumbnail" style="cursor: pointer;border-radius:10px;padding:8px;" 
                     <%
                     out.print("onclick=\"window.location.assign('/NCP3/DownloadFile?id="+rs.getInt("fileid")+"');\"");
                     %>  >
                        <img src="/NCP3/resources/icons/<%

                                out.print((name.substring(name.lastIndexOf('.')+1)).toLowerCase());

                             %>.png" onerror="this.src='/NCP3/resources/icons/file.png'" style="width:100px;padding: 10px;margin-left: auto;margin-right: auto;display: block"></img> 
                        <span style="font-size: 23px;margin-left: auto;"><%out.println(name); %><br><% Integer sz=Integer.parseInt(rs.getString("size")); if(sz>1048576)out.print(""+(sz/1048576)+" MB");else if(sz>1024)out.print(""+(sz/1024)+" KB");else {out.print(""+sz+" Bytes");} %> </span>
                    </div>
        </div>
  <%}
    %></div><%
%>
<%
    try{rs.close();}catch(Exception e){}
    try{stmt.close();}catch(Exception e){}
    try{con.close();}catch(Exception e){}
%>
