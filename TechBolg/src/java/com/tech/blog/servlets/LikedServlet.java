package com.tech.blog.servlets;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LikedServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        boolean flag = false;
        String success = "";

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String operation = request.getParameter("operation");
        Integer postId = Integer.parseInt(request.getParameter("postId"));
        Integer userId = Integer.parseInt(request.getParameter("userId"));

        LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());

        if (operation.equals("liked")) {
            Integer userExist = likeDao.isLikedExistByUser(postId, userId);
            if (userExist > 0) {
                flag = likeDao.deleteLike(postId, userId);
                success = "userDeleted";
            } else {
                flag = likeDao.createLike(postId, userId);
                success = "userCreated";
            }
            if (flag) {
                if (success.equals("userCreated")) {
                    out.println("created");
                } else if (success.equals("userDeleted")) {
                    out.println("deleted");
                }
            } else {
                out.println("failed");
            }
        }
    }

}
