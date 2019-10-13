<%@page import="java.util.*,java.sql.*,javax.servlet.http.Cookie" %>
<!DOCTYPE HTML>
<html>
<head>
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
var fn1=function()
{
  var name = document.getElementById('real-input').value.split(/\\|\//).pop();
  var truncated = name.length > 40 ? name.substr(0,20)+"..."+name.substr(name.length-9,name.length-1) : name;
  document.getElementById('FileName').value=name;
  document.getElementById('file-info').innerHTML = truncated;
};
        
</script>
<script src="/NCP3/resources/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="/NCP3/resources/bootstrap/css/bootstrap.min.css">
<title>Upload Materials</title>
</head>
<body>
    <%
    Cookie[] ck=request.getCookies();
    boolean roleset=false;
    int role=-1;
    for(int i=0;i!=ck.length;i++)
    {
        if(ck[i].getName().equals("role"))
        {
            roleset=true;
            role=Integer.parseInt(ck[i].getValue());
            
        }
        
    }
    if(roleset&&(role==1||role==2))
    {
    %>
    <form method="post"  enctype="multipart/form-data" action="do">
        <div class="input-container">
            <input type="hidden" value="" id="FileName" name="FileName">
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
    <%  } 
        if(roleset)
        {  %>
        <div class="row">    
    <div style="padding: 10px;">
        <div class="row">
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
            ResultSet rs=stmt.executeQuery("select fileid,name,size,filetyp,ref from [file]");
            ResultSetMetaData mtdt=rs.getMetaData();
            for(int i=0;i!=mtdt.getColumnCount();i++)
            System.out.println(mtdt.getColumnName(i+1));
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
        <% } %>
        </div>
    </div><%
    }
    %>
</body>
</html>