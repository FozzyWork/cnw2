package com.cnw.controllers;

import com.cnw.models.bean.Member;
import com.cnw.models.bean.Project;
import com.cnw.models.bo.ProjectBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProjectController", urlPatterns = {"/projects"})
public class ProjectController extends HttpServlet {
    
    private ProjectBO projectBO;

    @Override
    public void init() throws ServletException {
        projectBO = new ProjectBO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInMember") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        Member loggedInMember = (Member) session.getAttribute("loggedInMember");
        List<Project> projects = projectBO.getProjectsByMemberId(loggedInMember.getId());
        
        request.setAttribute("projects", projects);
        request.getRequestDispatcher("/WEB-INF/views/projects/list.jsp").forward(request, response);
    }
}
