package com.tech.blog.dao;

import com.tech.blog.entities.Users;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(Users users) {
        boolean flag = false;
        try {
            String query = "INSERT INTO users (name,email,password,gender,information) VALUES (?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, users.getName());
            pstmt.setString(2, users.getEmail());
            pstmt.setString(3, users.getPassword());
            pstmt.setString(4, users.getGender());
            pstmt.setString(5, users.getInformation());
            pstmt.executeUpdate();
            flag = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return flag;
    }

    public Users getUserByEmailAndPassword(String user_email, String user_password) {
        Users user = null;
        try {
            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user_email);
            pstmt.setString(2, user_password);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new Users();
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setGender(set.getString("gender"));
                user.setInformation(set.getString("information"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return user;
    }
    
    public boolean updateUser(Users user){
        boolean flag = false;
        try{
            String query = "UPDATE users SET name = ?, email = ?, password=?, information = ?, profile_image = ? WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getInformation());
            pstmt.setString(5, user.getProfileImage());
            pstmt.setInt(6, user.getId());
            pstmt.executeUpdate();
            flag = true;
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return flag;
    }

}
