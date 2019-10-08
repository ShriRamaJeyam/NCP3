/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilities;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Niranjan Kumar K S
 */
@WebServlet(name = "handlecourseupdate", urlPatterns = {"/landing/courseaddedit/handle"})
public class handlecourseupdate extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta http-equiv=\"refresh\" content=\"0;url=\\\\NCP3\\\\landing\\\\courseaddedit\\\\view\\\\index.jsp\">");
            out.println("<title>Servlet handlecourseupdate</title>");            
            out.println("</head>");
            out.println("<body>");
            try
            {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
                Connection con=DriverManager.getConnection(Globals.univ.ConString);
                boolean error=true;
                if(request.getParameter("id")==null)
                {
                    System.out.println(request.getParameter("p1"));
                    System.out.println("insert");
                    PreparedStatement stmt=con.prepareStatement("insert into course(name,unit1,unit2,unit3,p1,p2,p3,endsem,credits) values(?,?,?,?,?,?,?,?,?)");
                    stmt.setString(1,request.getParameter("name"));
                    stmt.setString(2,request.getParameter("unit1"));
                    stmt.setString(3,request.getParameter("unit2"));
                    stmt.setString(4,request.getParameter("unit3"));
                    System.out.println(request.getParameter("p1"));
                    stmt.setDate(5,Date.valueOf(request.getParameter("p1")));
                    stmt.setDate(6,Date.valueOf(request.getParameter("p2")));
                    stmt.setDate(7,Date.valueOf(request.getParameter("p3")));
                    stmt.setDate(8,Date.valueOf(request.getParameter("endsem")));
                    stmt.setInt(9,Integer.parseInt(request.getParameter("credits")));
                    stmt.executeUpdate();
                    error=false;
                    stmt.close();
                }
                else
                {

                    PreparedStatement stmt=con.prepareStatement("update course set name=?,unit1=?,unit2=?,unit3=?,p1=?,p2=?,p3=?,endsem=?,credits=? where courseid="+request.getParameter("id"));
                    stmt.setString(1,request.getParameter("name"));
                    stmt.setString(2,request.getParameter("unit1"));
                    stmt.setString(3,request.getParameter("unit2"));
                    stmt.setString(4,request.getParameter("unit3"));
                    System.out.println(request.getParameter("p1"));
                    stmt.setDate(5,Date.valueOf(request.getParameter("p1")));

                    stmt.setDate(6,Date.valueOf(request.getParameter("p2")));
                    stmt.setDate(7,Date.valueOf(request.getParameter("p3")));
                    stmt.setDate(8,Date.valueOf(request.getParameter("endsem")));
                    stmt.setInt(9,Integer.parseInt(request.getParameter("credits")));
                    stmt.executeUpdate();
                    error=false;
                    stmt.close();
                }
                if(error)
                {
                    out.write("<script> alert(\"Unexpected error occured\"); </script>");
                }
                else
                {
                    out.write("<script> alert(\"Success\"); </script>");
                }
                con.close();
                
            }
            catch(Exception e)
            {
                
            }
            out.println("<script> window.location.href = '/NCP3/landing/courseaddedit/view/'; </script>");
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
