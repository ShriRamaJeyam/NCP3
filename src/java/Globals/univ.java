
package Globals;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class univ
{
    
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
