package testing;
import java.io.File;
import java.sql.*;
import javax.sound.midi.SysexMessage;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
public class XMLtoDATABASE 
{
    public static void main(String args[])
    {
        
        Connection con;
        try
        {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
        
        Document doc=DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new File("D:\\upload.xml"));
        doc.getDocumentElement().normalize();
        String root=doc.getDocumentElement().getNodeName();
        NodeList lst=doc.getElementsByTagName(root.substring(0, root.length()-1));
        //System.out.print(root.substring(0, root.length()-1));
        con=DriverManager.getConnection(Globals.univ.ConString);
        for(int i=0;i!=lst.getLength();i++)
        {
            Node J=lst.item(i);
             if(J.getNodeType()==Node.ELEMENT_NODE)
            {
                Statement s=con.createStatement();
                Element j=(Element)J;
                s.executeUpdate("insert into announcement(courseid,message) values ("+((Element)(j.getElementsByTagName("courseid").item(0))).getTextContent()+",'"+((Element)(j.getElementsByTagName("message").item(0))).getTextContent()+"');");
            }
        }
        
        }
        catch(Exception e)
        {
            e.printStackTrace(System.err);
        }
    }
}
