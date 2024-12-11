package com.example.mvcboard;

import com.example.board.CommentDAO;
import com.example.board.CommentDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/mvcboard/CommentEdit.do")
public class CommentEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String commentId = request.getParameter("id");
        String postnum = request.getParameter("postnum");

        CommentDAO commentDAO = new CommentDAO();
        CommentDTO comment = commentDAO.getCommentById(commentId);

        request.setAttribute("comment", comment);
        request.setAttribute("postnum", postnum);
        request.getRequestDispatcher("/Board/CommentEdit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String commentId = request.getParameter("id");
        String content = request.getParameter("content");
        String postnum = request.getParameter("postnum");

        CommentDAO commentDAO = new CommentDAO();
        commentDAO.updateComment(commentId, content);

        response.sendRedirect(request.getContextPath() + "/mvcboard/ProjectView.do?num=" + postnum);
    }
}
