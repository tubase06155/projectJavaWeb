/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.LessonDAO;
import entity.Lesson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Anh Tu
 */
public class UploadFileController extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UploadFileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadFileController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public void listLesson(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Lesson> lessons = new LessonDAO().listLesson(1);
        request.setAttribute("lessons", lessons);
        RequestDispatcher rd = request.getRequestDispatcher("lessonManagement.jsp");
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
         DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
        try {
            String title = "";
            String content = "";
            int category = 0 ;
            int difficulty = 0 ;
       
            String imageName = "";
            String audioName = "";
            // get list of item
            List<FileItem> fileItems = upload.parseRequest(request);
            for (FileItem uploadItem : fileItems) {
                if(uploadItem.isFormField()){
                    // collect parameter
                    String fieldName = uploadItem.getFieldName();
                    String fieldValue = uploadItem.getString();
                    switch (fieldName) {
                        case "title":
                            title = fieldValue;
                            break;
                        case "content":
                            content = fieldValue;
                            break;
                        case "category":
                            category = Integer.valueOf(fieldValue);
                            break;
                        case "difficulty":
                            difficulty = Integer.valueOf(fieldValue);
                            break;
                        default:
                            break;
                    }      
                }else{ // it's not formfield
                    // xử lý file
                    
                    String fieldName = uploadItem.getFieldName();
                    String fieldValue = uploadItem.getString();
                    if(fieldName.equals("image")){
                        // upload anh
                        if(!fieldValue.isEmpty()){
                            // co hinh anh up len
                            String filename = uploadItem.getName();    
                            imageName = filename; // get the name of image
                            //String mimeType = getServletContext().getMimeType(filename); 
                            String dirUrl = request.getServletContext().getRealPath("") + File.separator + "images" + File.separator + "lessonImage";
                            File dir = new File(dirUrl);
                            if (!dir.exists()) {
                                dir.mkdir();
                            }
                            String imagePath = dirUrl + File.separator + filename;
                            //System.out.println("dirURL = " + request.getServletContext().getRealPath(""));
                            File file = new File(imagePath);
                            try {
                                uploadItem.write(file);
                            } catch (Exception ex) {
                                Logger.getLogger(UploadFileController.class.getName()).log(Level.SEVERE, null, ex);
                            }
                            
                        }else{
                            imageName = "defaulImage";
                        } 
                    }else if (fieldName.equals("audio")){
                        // up load audio
                        if(!fieldValue.isEmpty()){
                            // co audio up len
                            String filename = uploadItem.getName();  
                            audioName = filename; // get the name of audio
                            //String mimeType = getServletContext().getMimeType(filename); 
                            String dirUrl = request.getServletContext().getRealPath("") + File.separator + "Audio" ;
                            File dir = new File(dirUrl);
                            if (!dir.exists()) {
                                dir.mkdir();
                            }
                            String audioPath = dirUrl + File.separator + filename;
                            File file = new File(audioPath);
                            try {
                                uploadItem.write(file);
                            } catch (Exception ex) {
                                Logger.getLogger(UploadFileController.class.getName()).log(Level.SEVERE, null, ex);
                            }
                            
                        }else{
                            audioName = "defaultAudio";
                        }
                    }   
                }  // end of !uploadItem.isFormField()
            }
            // save data to db base
            new LessonDAO().addLesson(title, imageName, category, content, difficulty, audioName);     
            // send data back to table
            
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(UploadFileController.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            listLesson(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UploadFileController.class.getName()).log(Level.SEVERE, null, ex);
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
