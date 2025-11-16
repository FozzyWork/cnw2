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

@WebServlet(name = "AddController", urlPatterns = {"/add"})
public class AddController extends HttpServlet {
    
    private MemberBO memberBO = new MemberBO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInMember") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        request.getRequestDispatcher("/WEB-INF/views/add.jsp").forward(request, response);
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
        
        // Lấy dữ liệu từ form
        String hoVaTen = request.getParameter("hoVaTen");
        String congViec = request.getParameter("congViec");
        String chucVu = request.getParameter("chucVu");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String gioiThieu = request.getParameter("gioiThieu");
        String avtUrl = request.getParameter("avtUrl");
        String matKhau = request.getParameter("matKhau");
        
        // Nếu không có avatar, sử dụng avatar mặc định
        if (avtUrl == null || avtUrl.trim().isEmpty()) {
            avtUrl = "defAvatar.jpg";
        }
        
        // Tạo member mới
        Member newMember = new Member();
        newMember.setHoVaTen(hoVaTen);
        newMember.setCongViec(congViec);
        newMember.setChucVu(chucVu);
        newMember.setDiaChi(diaChi);
        newMember.setSdt(sdt);
        newMember.setEmail(email);
        newMember.setGioiThieu(gioiThieu);
        newMember.setAvtUrl(avtUrl);
        newMember.setMatKhau(matKhau);
        
        // Lưu vào database
        boolean success = memberBO.addMember(newMember);
        
        if (success) {
            response.sendRedirect(request.getContextPath() + "/members");
        } else {
            request.setAttribute("errorMessage", "Thêm thành viên thất bại!");
            request.getRequestDispatcher("/WEB-INF/views/add.jsp").forward(request, response);
        }
    }
}
