package com.tech.blog.dao;

import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Posts;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

public class PostDao {

    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Categories> getAllCategories() {
        ArrayList<Categories> categoryList = new ArrayList<Categories>();
        try {
            String query = "SELECT * FROM post_categories";
            Statement stmt = con.createStatement();
            ResultSet set = stmt.executeQuery(query);
            while (set.next()) {
                Categories category = new Categories(set.getInt("id"), set.getString("category"), set.getString("description"), set.getString("created_at"));
                categoryList.add(category);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return categoryList;
    }

    public boolean savePost(Posts post) {
        boolean flag = false;
        try {
            String query = "INSERT INTO posts(title, content, code, image, category_id, user_id, posted_at) VALUES(?,?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, post.getTitle());
            pstmt.setString(2, post.getContent());
            pstmt.setString(3, post.getCode());
            pstmt.setString(4, "Image Path");
            pstmt.setInt(5, post.getCategoryId());
            pstmt.setInt(6, post.getUserId());
            pstmt.setString(7, "postedAt");
            pstmt.executeUpdate();
            flag = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return flag;
    }

    public ArrayList<Posts> getAllPost() {
        ArrayList<Posts> postList = new ArrayList<Posts>();
        try {
            String query = "SELECT * FROM posts";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {
                Integer postId = set.getInt("id");
                String postTitle = set.getString("title");
                String postContent = set.getString("content");
                String code = set.getString("code");
                Integer categoryId = set.getInt("category_id");
                Integer userId = set.getInt("user_id");
                String image = set.getString("image");
                Posts post = new Posts(postId, postTitle, postContent, code, image, "postedAt", userId, categoryId);
                postList.add(post);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return postList;
    }

    public ArrayList<Posts> getPostsByCatId(Integer catId) {
        ArrayList<Posts> postList = new ArrayList<Posts>();
        try {
            String query = "SELECT * FROM posts WHERE category_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, catId);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {
                Integer postId = set.getInt("id");
                String postTitle = set.getString("title");
                String postContent = set.getString("content");
                Integer categoryId = set.getInt("category_id");
                String code = set.getString("code");
                Integer userId = set.getInt("user_id");
                String image = set.getString("image");
                Posts post = new Posts(postId, postTitle, postContent, code, image, "postedAt", userId, categoryId);
                postList.add(post);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return postList;
    }

}
