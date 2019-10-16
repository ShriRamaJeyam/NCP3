
package Globals;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.*;
public class univ
{
    public static boolean logincheck(HttpServletRequest req,HttpServletResponse res)
    {
        
        try
        {
            HttpSession ssn=req.getSession(true);
            if(ssn.getAttribute("state")!=null)
                return true;
            data.login state=new data.login();
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
            Connection con=DriverManager.getConnection(Globals.univ.ConString);
            Statement stmt=con.createStatement();
            Cookie[] ck=req.getCookies();
            boolean roleset=false;
            int role=-1;
            String ID="";
            if(ck!=null)
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
            if(rs.next())
            {
                state.id=rs.getInt("id");
                state.role=role;
                ssn.setAttribute("state", state);
                return true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }
   // public static String ConString="jdbc:sqlserver://localhost:1433;instance=SQLEXPRESS;database=CourseWebsite;user=tibi;password=SriRama108++;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
    public static String ConString="jdbc:sqlserver://localhost;instance=SQLEXPRESS;database=CourseWebsite;user=tibi;password=SriRama108++;";
    public static Connection conn=null;
    public void univ(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn=DriverManager.getConnection("jdbc:sqlserver://studysite.database.windows.net:1433;database=CourseWebsite;user=tibi@studysite;password=SriRama108!;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(univ.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(univ.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
