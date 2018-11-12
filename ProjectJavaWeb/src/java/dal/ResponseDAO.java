/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import DBContext.DBContext;
import entity.Response;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anh Tu
 */
public class ResponseDAO {
   // insert response
    public void addResponse(String name, String title, String content, int userID, boolean isActive, String email ) throws Exception {
        String query = "INSERT INTO User_Response VALUES(?,?,?,?,?,?,?)";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        // set param
        ps.setString(1, null);
        ps.setNString(2, name);
        ps.setNString(3, title);
        ps.setString(4, "");
        ps.setBoolean(5, isActive);
        ps.setString(6, email);
        ps.setNString(7, content);
        
        ps.executeUpdate();
        
        ps.close();
        conn.close();
    }
    // list response
    public List<Response> listAllResponse() throws Exception {
        List<Response> responses = new ArrayList<>();
        String query = "SELECT * FROM User_Response WHERE isActive=1  ORDER BY responseID DESC";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            int id = rs.getInt("responseID");
            String name = rs.getString("username");
            String title = rs.getString("title"); 
            String content = rs.getString("content2");
            String email = rs.getString("email");
            boolean isActive = rs.getBoolean("isActive");
            
            responses.add(new Response(id, name, email, title, content, isActive));
        }
        ps.close();
        conn.close();
        return responses;
        
    }
    // delete response
    public void deleteByID(String id) throws Exception {
        String query = "UPDATE User_Response SET isActive = 0 WHERE responseID = " + id;
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.executeUpdate();

        ps.close();
        conn.close();
    }  
}
