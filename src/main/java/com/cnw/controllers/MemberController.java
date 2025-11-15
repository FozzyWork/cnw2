package com.cnw.controllers;

import com.cnw.models.bean.Member;
import com.cnw.models.bo.MemberBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MemberController", urlPatterns = { "/members", "/member" })
public class MemberController extends HttpServlet {
    private MemberBO memberBO;

    @Override
    public void init() throws ServletException {
        memberBO = new MemberBO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        if (path.equals("/members")) {
            // Hiển thị danh sách tất cả members
            showMemberList(request, response);
        } else if (path.equals("/member")) {
            // Hiển thị chi tiết một member
            showMemberDetail(request, response);
        }
    }

    private void showMemberList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Member> members = memberBO.getAllMembers();
            request.setAttribute("members", members);
            request.getRequestDispatcher("/WEB-INF/views/members/list.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Lỗi khi tải danh sách thành viên");
        }
    }

    private void showMemberDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                int id = Integer.parseInt(idParam);
                Member member = memberBO.getMemberById(id);

                if (member != null) {
                    request.setAttribute("member", member);
                    request.getRequestDispatcher("/WEB-INF/views/members/detail.jsp")
                            .forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND,
                            "Không tìm thấy thành viên");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/members");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID không hợp lệ");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Lỗi khi tải thông tin thành viên");
        }
    }
}
