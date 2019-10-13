/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LoginGroup;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;
import java.sql.*;
//import com.microsoft.sqlserver.jdbc.SQLServerDriver;
import java.sql.DriverManager;
/**
 *
 * @author niran
 */
public class LoginValidator extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        Connection con=null;
        response.setContentType("text/html;charset=UTF-8");
        try  
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
            PrintWriter out = response.getWriter();
            HttpSession ssn=request.getSession();
            
            String ConnURL=Globals.univ.ConString;
            con=DriverManager.getConnection(ConnURL);
            Statement stmt=con.createStatement();
            String role=request.getParameter("role");
            String tbl="administrator";
            if(role.equals("0"))
            {
                tbl="student";
            }
            if(role.equals("1"))
            {
                tbl="teacher";
            }
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            int d=((int)(Math.random()*10000));
            ResultSet rs=stmt.executeQuery("select * from "+tbl+" where username='"+request.getParameter("usr")+"' and passcode='"+request.getParameter("pass")+"'");
            String reurl;
            if(rs.next())
            {
                Cookie ckie=new Cookie("ID",ssn.getId()+d),typ=new Cookie("role",request.getParameter("role"));
                Integer introle=Integer.parseInt(role);
                request.getSession(true).setAttribute("role",introle);
                ckie.setPath("/");
                typ.setPath("/");
                ckie.setMaxAge(60*60*24*10);
                typ.setMaxAge(60*60*24*10);
                response.addCookie(ckie);
                response.addCookie(typ);
                String id=rs.getString(1);
                rs.close();
                
                stmt.execute("update "+tbl+" set cookie='"+ssn.getId()+d+"' where "+tbl+"id='"+id+"';");
                reurl="/NCP3/landing";
            }
            else
            {
                reurl="/NCP3";
            }
            out.println("<meta http-equiv=\"refresh\" content=\"0; url="+reurl+"\">");            
            out.println("</head>");
            out.println("</html>");
            con.close();
        }
        catch(Exception ex)
        {
            System.out.println(ex.toString());
        }
        try
        {
            con.close();
        }
        catch(Exception e){;}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
