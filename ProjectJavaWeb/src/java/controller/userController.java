/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.UserDAO;
import entity.User;
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
public class userController extends HttpServlet {

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
            if (action == null) {
                response.sendRedirect("IndexServlet");
            }
            switch (action) {
                case "register":
                    register(request, response);
                    break;
                case "getUserInfo":
                    getUserInfo(request, response);
                    break;
                case "changePassword":
                    changePassword(request, response);
                    break;
                case "list":
                    listUser(request, response);
                    break;
                case "createUser":
                    createUser(request, response);
                    break;
                
                case "editUser":
                    editUser(request, response);
                    break;
                case "delete":
                    deActiveUser(request, response);
                    break;
                case "reActive":
                    reActive(request, response);
                    break;
                case "resetUserPassword":
                    resetUserPassword(request, response);
                    break;
                case "checkRank":
                    checkRank(request, response);
                    break;
                
            }
            register(request, response);
        } catch (Exception e) {
            
        }
    }

    // get top 10 user has the best score
    public void checkRank(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<User> users = new UserDAO().getListOfRank();
        request.setAttribute("users", users);
        RequestDispatcher rd = request.getRequestDispatcher("rank.jsp");
        rd.forward(request, response);
    }

    //register new user
    public void register(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");
        String email = request.getParameter("email");
        request.setAttribute("username", username);
        request.setAttribute("email", email);
        boolean isExistedUser = new UserDAO().isUsernameExisted(username);
        if (username.equals("") || password.equals("")) {
            request.setAttribute("error", "Please enter username and password");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        if (!password.equals(rePassword)) {
            request.setAttribute("error", "Please confirm password correctly");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        if (isExistedUser) {
            request.setAttribute("error", "Username '" + username + "' has existed already. Please try again");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            new UserDAO().createUser(username, password, email, 1);
            request.setAttribute("registerSuccessfully", username);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    // get all info of user
    public void getUserInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String userID = request.getParameter("userID");
        User theUser = new UserDAO().selectUserByUserID(userID);
        request.setAttribute("theUser", theUser);
        RequestDispatcher rd = request.getRequestDispatcher("userInfo.jsp");
        rd.forward(request, response);
    }

    // create new user or admin in admin  Page
    public void createUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // collect data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        int type = Integer.valueOf(request.getParameter("type"));
        // create user
        new UserDAO().createUser(username, password, email, type);
        // back to main page
        listUser(request, response);
    }

    // change password
    public void changePassword(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        String userID = request.getParameter("userID");

        // check if the 2 passwords is match
        boolean match = newPassword.equals(confirmPassword);
        if (match) {
            // change pass and return message
            new UserDAO().updatePassword(newPassword, userID);
            request.setAttribute("changePasswordSuccessfully", "Change password successfully");
            RequestDispatcher rd = request.getRequestDispatcher("changePassword.jsp");
            rd.forward(request, response);
        } else {
            // return error message
            request.setAttribute("notChangePasswordSuccessfully", "Not match, re-enter password");
            RequestDispatcher rd = request.getRequestDispatcher("changePassword.jsp");
            rd.forward(request, response);
        }
    }

    // list of user
    // function to list user and can be paging by page size = 10 
    public void listUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }
        String page = request.getParameter("page");
        page = (page != null) ? page : "1";
        int pager = 1;
        try {
            pager = Integer.parseInt(page);
        } catch (Exception e) {
            
        }
        
        List<User> users = new UserDAO().getListOfUser(pager);
        request.setAttribute("users", users);
        RequestDispatcher rd = request.getRequestDispatcher("userManagement.jsp");
        rd.forward(request, response);
    }

    //  edit user by ID 
    public void editUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
       HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }
        String userID = request.getParameter("userID");
        User theUser = new UserDAO().selectUserByUserID(userID);
        //String userID = request.getParameter("userID");
        String email = request.getParameter("email");
        String type = request.getParameter("type");
        String score = request.getParameter("score");
        if (email != null && type != null && score != null) {
            new UserDAO().updateUserInfo(userID, email, type, score);
            theUser = new UserDAO().selectUserByUserID(userID);
            request.setAttribute("updateUserSuccess", "#");
            
        }
        request.setAttribute("theUser", theUser);
        request.getRequestDispatcher("editUser.jsp").forward(request, response);
    }

    // deActive user
    public void deActiveUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
         HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }
        String id = request.getParameter("userID");
        new UserDAO().deleteByID(id);
        //back to homepage
        listUser(request, response);
    }

    // reavtive user
    public void reActive(HttpServletRequest request, HttpServletResponse response) throws Exception {
      HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }
        String id = request.getParameter("userID");
        new UserDAO().reActiveByID(id);
        // back to homepage
        listUser(request, response);
    }

    // reset password to default 123
    public void resetUserPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("theAdmin") == null) {
            response.sendRedirect("login.jsp");
        }
        
        String userID = request.getParameter("userID");
        new UserDAO().resetPassword(userID);
        //back to home page
        listUser(request, response);
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
