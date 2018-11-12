/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.LessonDAO;
import entity.Lesson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anh Tu
 */
@MultipartConfig
public class LessonController extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            if (action == null) {
                action = "list";
            }

            switch (action) {
                case "list":
                    listLesson(request, response);
                    break;
                case "addQuestion":
                    addQuestion(request, response);
                    break;
                case "delete":
                    deleteLesson(request, response);
                    break;
                case "learn":
                    learn(request, response);
                    break;
                case "category":
                    listByCategory(request, response);
                    break;
                case "sortByName":
                    sortByName(request, response);
                    break;
                case "sortByDifficulty":
                    sortByDifficulty(request, response);
                    break;
                case "search":
                    search(request, response);
                    break;
                case "editLesson":
                    editLesson(request, response);
                    break;
                case "updateLesson":
                    updateLesson(request, response);
                    break;
            }
        }
    }

    // list lesson in Lesson management and paging 
    public void listLesson(HttpServletRequest request, HttpServletResponse response) throws Exception {
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

        List<Lesson> lessons = new LessonDAO().listLesson(paging);
        request.setAttribute("lessons", lessons);
        RequestDispatcher rd = request.getRequestDispatcher("lessonManagement.jsp");
        rd.forward(request, response);
    }

    // search lesson in home page
    public void search(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String searchText = request.getParameter("searchText");
        String page = request.getParameter("page");
        page = (page != null) ? page : "1";
        int paging = 1;

        try {
            paging = Integer.parseInt(page);
        } catch (Exception e) {

        }
        int row_count = new LessonDAO().countSearchRows(searchText);
        int maxPage = row_count / 10
                + (row_count % 10 > 0 ? 1 : 0);
        List< Lesson> lessons = new LessonDAO().searchByName(searchText, paging);
        int countResult = lessons.size();
        /*if (searchText.equals("")) {
            countResult = 0;
            maxPage = 0;
            request.setAttribute("error", "Please enter the lesson you want to seach !");
        }*/
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("searchText", searchText);
        request.setAttribute("lessons", lessons);
        request.setAttribute("countResult", countResult);
        RequestDispatcher rd = request.getRequestDispatcher("resultPage.jsp");
        rd.forward(request, response);
    }

    public void sortByName(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String category = request.getParameter("category");
        List<Lesson> lessons = new LessonDAO().sortByName(category);
        request.setAttribute("lessons", lessons);
        request.setAttribute("category", category);
        RequestDispatcher rd = request.getRequestDispatcher("category.jsp");
        rd.forward(request, response);
    }

    public void sortByDifficulty(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String category = request.getParameter("category");
        List<Lesson> lessons = new LessonDAO().sortByDifficulty(category);
        request.setAttribute("category", category);
        request.setAttribute("lessons", lessons);
        RequestDispatcher rd = request.getRequestDispatcher("category.jsp");
        rd.forward(request, response);
    }

    public void listByCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String category = request.getParameter("category");
        String page = request.getParameter("page");
        page = (page != null) ? page : "1";
        int paging = 1;

        try {
            paging = Integer.parseInt(page);
        } catch (Exception e) {
        }

        int row_count = new LessonDAO().countCategoryRows(category);
        int maxPage = row_count / 10
                + (row_count % 10 > 0 ? 1 : 0);

        List<Lesson> lessons = new LessonDAO().listLessonByCategory(category, paging);
        request.setAttribute("maxPage", maxPage);

        request.setAttribute("category", category);
        request.setAttribute("lessons", lessons);
        RequestDispatcher rd = request.getRequestDispatcher("category.jsp");
        rd.forward(request, response);
    }

    public void learn(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String lessonID = request.getParameter("lessonID");
        Lesson lesson = new LessonDAO().getLessonByID(lessonID);
        request.setAttribute("lesson", lesson);
        RequestDispatcher rd = request.getRequestDispatcher("learnLesson.jsp");
        rd.forward(request, response);
    }

    public void editLesson(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }
        String lessonID = request.getParameter("lessonID");
        Lesson lesson = new LessonDAO().getLessonByID(lessonID);
        request.setAttribute("lesson", lesson);
        RequestDispatcher rd = request.getRequestDispatcher("editLesson.jsp");
        rd.forward(request, response);
    }
//  update lesson

    public void updateLesson(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }
        // collect data
        String lessonID = request.getParameter("lessonID");
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        String difficulty = request.getParameter("difficulty");
        String content = request.getParameter("content");
        int cate = Integer.parseInt(category);
        int lesId = Integer.parseInt(lessonID);
        int dif = Integer.parseInt(difficulty);

        new LessonDAO().updateLesson(title, cate, content, dif, lesId);
        /*  request.setAttribute("updateLessonSuccesfully", "#");
        RequestDispatcher rd = request.getRequestDispatcher("editLesson.jsp");
        rd.forward(request, response);*/
        listLesson(request, response);
    }

    public void deleteLesson(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }
        String id = request.getParameter("lessonID");
        new LessonDAO().deleteByID(id);
        listLesson(request, response);
    }

    private void addQuestion(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }
// collect data
        int lessonID = Integer.valueOf(request.getParameter("lessonID"));
        String questionContent = request.getParameter("questionContent");
        String opt1 = request.getParameter("opt1");
        String opt2 = request.getParameter("opt2");
        String opt3 = request.getParameter("opt3");
        String opt4 = request.getParameter("opt4");
        int rightOpt = Integer.valueOf(request.getParameter("rightOpt"));

        new LessonDAO().addQuestion(lessonID, questionContent, opt1, opt2, opt3, opt4, rightOpt);
        // after adding question
        RequestDispatcher rd = request.getRequestDispatcher("addQuestion.jsp");
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(LessonController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(LessonController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
