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

@WebServlet(name = "EditController", urlPatterns = { "/edit" })
public class EditController extends HttpServlet {

    private MemberBO memberBO = new MemberBO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInMember") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/views/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInMember") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Member loggedInMember = (Member) session.getAttribute("loggedInMember");

        // Lấy dữ liệu từ form
        String hoVaTen = request.getParameter("hoVaTen");
        String congViec = request.getParameter("congViec");
        String chucVu = request.getParameter("chucVu");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String gioiThieu = request.getParameter("gioiThieu");
        String avtUrl = request.getParameter("avtUrl");

        // Cập nhật thông tin member
        loggedInMember.setHoVaTen(hoVaTen);
        loggedInMember.setCongViec(congViec);
        loggedInMember.setChucVu(chucVu);
        loggedInMember.setDiaChi(diaChi);
        loggedInMember.setSdt(sdt);
        loggedInMember.setEmail(email);
        loggedInMember.setGioiThieu(gioiThieu);
        loggedInMember.setAvtUrl(avtUrl);

        // Lưu vào database
        boolean success = memberBO.updateMember(loggedInMember);

        if (success) {
            // Cập nhật lại session
            session.setAttribute("loggedInMember", loggedInMember);
            response.sendRedirect(request.getContextPath() + "/welcome");
        } else {
            request.setAttribute("errorMessage", "Cập nhật thông tin thất bại!");
            request.getRequestDispatcher("/WEB-INF/views/edit.jsp").forward(request, response);
        }
    }
}
