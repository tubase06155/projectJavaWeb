/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.QuestionDAO;
import entity.Question;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class QuestionController extends HttpServlet {

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
            String action = request.getParameter("action");
            if (action == null) {
                action = "list";
            }

            switch (action) {
                case "list":
                    listQuestion(request, response);
                    break;
                case "delete":
                    deleteQuestion(request, response);
                    break;
                case "edit":
                    edit(request, response);
                    break;
                case "updateQuestion":
                    updateQuestion(request, response);
                    break;
                case "listByLessonID":
                    listByLessonID(request, response);
                    break;

            }
        } catch (Exception e) {

        }
    }

    public void listQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
           HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }   
        String page = request.getParameter("page");
        page = (page != null) ? page : "1";
        int paging = 1;

        try {
            paging = Integer.parseInt(page);
        } catch (Exception e) {

        }
        List<Question> questions = new ArrayList<>();
        questions = new QuestionDAO().listQuestion(paging);

        request.setAttribute("questions", questions);
        RequestDispatcher rd = request.getRequestDispatcher("questionManagement.jsp");
        rd.forward(request, response);
    }
    public void listByLessonID(HttpServletRequest request, HttpServletResponse response) throws Exception {
       HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }   
        String lessonId = request.getParameter("lessonID");
     
        List<Question> questions = new ArrayList<>();
        questions = new QuestionDAO().listQuestionByLessonID(lessonId);

        request.setAttribute("questions", questions);
        RequestDispatcher rd = request.getRequestDispatcher("listByLessonID.jsp");
        rd.forward(request, response);
    }

    public void deleteQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
          HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }   
        String id = request.getParameter("questionID");
        new QuestionDAO().deleteByID(id);
        listQuestion(request, response);
    }

    public void edit(HttpServletRequest request, HttpServletResponse response) throws Exception {
         HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }   
        String id = request.getParameter("questionID");
        Question theQuestion = new QuestionDAO().getQuestionByID(id);
        request.setAttribute("questionID", id);
        request.setAttribute("question", theQuestion);
        RequestDispatcher rd = request.getRequestDispatcher("editQuestion.jsp");
        rd.forward(request, response);
    }

    // update Question
    public void updateQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
          HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }   
        String id = request.getParameter("questionID");
        String questionContent = request.getParameter("questionContent");
        String opt1 = request.getParameter("opt1");
        String opt2 = request.getParameter("opt2");
        String opt3 = request.getParameter("opt3");
        String opt4 = request.getParameter("opt4");
        String rightOpt = request.getParameter("rightOpt");
        new QuestionDAO().updateQuestion(id, questionContent, opt1, opt2, opt3, opt4, rightOpt);

        listQuestion(request, response);

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
