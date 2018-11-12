/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.LessonDAO;
import dal.QuestionDAO;
import dal.UserDAO;
import entity.Lesson;
import entity.Question;
import entity.User;
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
public class QuizServlet extends HttpServlet {

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
                response.sendRedirect("IndexServlet");
            }

            switch (action) {
                case "doQuiz":
                    doQuiz(request, response);
                    break;
                case "submitQuiz":
                    submitQuiz(request, response);
                    break;
            }
        } catch (Exception e) {

        }
    }

    public void doQuiz(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // check if login yet
        HttpSession session = request.getSession();
        if (session.getAttribute("theUser") == null && session.getAttribute("theAdmin") == null) {
            // not login
            request.setAttribute("notLogin", "#");
            RequestDispatcher rd = request.getRequestDispatcher("learnLesson.jsp");
            rd.forward(request, response);
        } else {
            String lessonIDx = request.getParameter("lessonID");
            List<Question> questions = new ArrayList<>();
            questions = new QuestionDAO().listQuestionByLessonID(lessonIDx);
            Lesson lesson = new LessonDAO().getLessonByID(lessonIDx);

            request.setAttribute("questions", questions);
            request.setAttribute("lessonID", lessonIDx);
            request.setAttribute("lesson", lesson);
            RequestDispatcher rd = request.getRequestDispatcher("doquiz.jsp");
            rd.forward(request, response);
        }
    }

    public void submitQuiz(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // get the list of question
        String lessonIDx = request.getParameter("lessonID");
        Lesson lesson = new LessonDAO().getLessonByID(lessonIDx);

        List<Question> questions = new ArrayList<>();
        questions = new QuestionDAO().listQuestionByLessonID(lessonIDx);
        // user answer
        List<String> userAnswers = new ArrayList<>();
        for (int i = 0; i < questions.size(); i++) {

            String answer = (request.getParameter(String.valueOf(questions.get(i).getQuestionID())) != null) ? (request.getParameter(String.valueOf(questions.get(i).getQuestionID()))) : "5";
            userAnswers.add(answer);
        }
        // right option
        List<String> rightOpts = new ArrayList<>();
        for (int i = 0; i < questions.size(); i++) {
            rightOpts.add(String.valueOf(questions.get(i).getRightOpt()));
        }
        // count right answer
        int countRightAnswer = 0;
        for (int i = 0; i < questions.size(); i++) {
            if (userAnswers.get(i).equalsIgnoreCase(rightOpts.get(i))) {
                countRightAnswer++;
            }
        }
        // TODO: update user score
        HttpSession session = request.getSession();
        User theUser = (User) session.getAttribute("theUser");
        if (session.getAttribute("theAdmin") != null) theUser = (User) session.getAttribute("theAdmin");
        int currentScore = new UserDAO().getCurrentScoreByUserID(theUser.getUserID());
        new UserDAO().updateScoreByUserID(theUser.getUserID(), currentScore, countRightAnswer);
        // foward data to the resultQuiz
        int numberOfQuestion = questions.size();
        request.setAttribute("numberOfQuestion", numberOfQuestion);
        request.setAttribute("countRightAnswer", countRightAnswer);
        request.setAttribute("questions", questions);
        request.setAttribute("userAnswers", userAnswers);
        request.setAttribute("lesson", lesson);

//        request.setAttribute("rightOpts", rightOpts);    
        RequestDispatcher rd = request.getRequestDispatcher("resultQuiz.jsp");
        rd.forward(request, response);

        //request.getParameter(String.valueOf(questions.get(i).getQuestionID()))
        //questions.get(i).getRightOpt()
        // compare answer of user with the right option
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
