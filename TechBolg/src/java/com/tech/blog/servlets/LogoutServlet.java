package com.tech.blog.servlets;

import com.tech.blog.entities.Message;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("userDetails");
        Message message = new Message("Logout successfully", "success", "alert-success");
        session.setAttribute("message", message);
        response.sendRedirect("login_page.jsp");
    }

}
