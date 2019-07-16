/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilities;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig(maxFileSize = 23177215)
@WebServlet(name = "FileUpload", urlPatterns = {"/landing/upload/do"})
public class FileUpload extends HttpServlet {

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
            throws ServletException, IOException {
        
       Exception erro=null;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
            String ConnURL="jdbc:sqlserver://studysite.database.windows.net:1433;database=CourseWebsite;user=tibi@studysite;password=SriRama108!;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
            Connection con=DriverManager.getConnection(ConnURL);
            Part fp=request.getPart("file");
            if(fp!=null)
            {
                PreparedStatement stmt=con.prepareStatement("insert into [file](name,size,data) values (?,?,?);");
                
                String fname=request.getParameter("FileName").toString();
                long size=fp.getSize();
                InputStream is=fp.getInputStream();
                stmt.setString(1,fname);
                stmt.setString(2,""+size+"");
                if(is!=null)
                {
                    stmt.setBlob(3, is);
                    stmt.executeUpdate();
                }
            }
        }
        catch(Exception e)
        {
            erro=e;
            e.printStackTrace();
            System.err.println(e.toString());
            
        }
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta http-equiv=\"refresh\" content=\"2;url=/NCP3/landing/upload\" />");            
            out.println("</head>");
            out.println("<body>");
            if(erro!=null)
                erro.printStackTrace(out);
            out.println("<h1>Servlet FileUpload at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
