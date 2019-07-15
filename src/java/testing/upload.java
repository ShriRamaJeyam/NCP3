/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testing;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author niran
 */
@WebServlet(name = "upload", urlPatterns = {"/upload"})
@MultipartConfig(maxFileSize = 23177215)
public class upload extends HttpServlet {

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
        
        String contentType = request.getContentType();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<style> \n .upload-btn-wrapper {\n" +
"  position: relative;\n" +
"  overflow: hidden;\n" +
"  display: inline-block;\n" +
"}\n" +
"\n" +
".btn {\n" +
"  border: 2px solid gray;\n" +
"  color: gray;\n" +
"  background-color: white;\n" +
"  padding: 8px 20px;\n" +
"  border-radius: 8px;\n" +
"  font-size: 20px;\n" +
"  font-weight: bold;\n" +
"}\n" +
"\n" +
".upload-btn-wrapper input[type=file] {\n" +
"  font-size: 100px;\n" +
"  position: absolute;\n" +
"  left: 0;\n" +
"  top: 0;\n" +
"  opacity: 0;\n" +
"}\n</style>");
            
            out.println("</head>");
            out.println("<body>");
            out.println("<form method=\"post\"  enctype=\"multipart/form-data\"><div class=\"upload-btn-wrapper\"><input name=\"file1\" class=\"btn\" type=\"file\" required ></div><input type=\"submit\"></form>");
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
