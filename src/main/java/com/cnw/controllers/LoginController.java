package com.cnw.controllers;

import com.cnw.models.bean.Member;
import com.cnw.models.bo.MemberBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
    private MemberBO memberBO;

    @Override
    public void init() throws ServletException {
        memberBO = new MemberBO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Member member = memberBO.checkLogin(email, password);

        if (member != null) {
            // Đăng nhập thành công - lưu thông tin vào session
            HttpSession session = request.getSession();
            session.setAttribute("loggedInMember", member);

            // Chuyển đến trang welcome
            response.sendRedirect(request.getContextPath() + "/welcome");
        } else {
            // Đăng nhập thất bại - quay lại trang login với thông báo lỗi
            request.setAttribute("errorMessage", "Email hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }
}
