package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

    private Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean createLike(Integer postId, Integer userId) {
        boolean flag = false;
        try {
            String query = "INSERT INTO likedpost(post_id, user_id) VALUES(?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);
            pstmt.setInt(2, userId);
            pstmt.executeUpdate();
            flag = true;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return flag;
    }

    public Integer countLikedByPostId(Integer postId) {
        Integer total = 0;
        try {
            String query = "SELECT COUNT(id) AS total_post_likes FROM likedpost WHERE post_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                total = set.getInt("total_post_likes");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return total;
    }

    public Integer isLikedExistByUser(Integer postId, Integer userId) {
        int postLikedByUser = 0;
        try {
            String query = "SELECT COUNT(id) AS post_like_by_user FROM likedpost WHERE post_id = ? AND user_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);
            pstmt.setInt(2, userId);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                postLikedByUser = set.getInt("post_like_by_user");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return postLikedByUser;
    }

    public boolean deleteLike(Integer postId, Integer userId) {
        boolean flag = false;
        try {
            String query = "DELETE FROM likedpost WHERE post_id = ? AND user_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);
            pstmt.setInt(2, userId);
            pstmt.executeUpdate();
            flag = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return flag;
    }

}
