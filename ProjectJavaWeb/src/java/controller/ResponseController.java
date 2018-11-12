/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ResponseDAO;
import entity.Response;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anh Tu
 */
public class ResponseController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
                   if (action == null) response.sendRedirect("IndexServlet");

            switch (action) {
                case "list":
                    list(request, response);
                    break;
                case "submitResponse":
                    addResponse(request, response);
                    break;
                case "delete":
                    delete(request, response);
                    break;
            }
        } catch (Exception e) {

        }
    }

    public void list(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }   
        List<Response> responses = new ResponseDAO().listAllResponse();

        request.setAttribute("responses", responses);
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        RequestDispatcher rd = request.getRequestDispatcher("responseManagement.jsp");
        rd.forward(request, response);
    }

    public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
         HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }   
        String id = request.getParameter("resID");
        new ResponseDAO().deleteByID(id);
        list(request, response);
    }

    public void addResponse(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String name = request.getParameter("name");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String email = request.getParameter("email");
        int userID = -1;
        boolean isActive = true;

        new ResponseDAO().addResponse(name, title, content, userID, isActive, email);
        request.setAttribute("responseSuccessfully", "#");
        RequestDispatcher rd = request.getRequestDispatcher("userResponse.jsp");
        rd.forward(request, response);

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
