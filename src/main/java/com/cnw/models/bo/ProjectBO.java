package com.cnw.models.bo;

import com.cnw.models.bean.Project;
import com.cnw.models.dao.ProjectDAO;

import java.util.List;

public class ProjectBO {
    private ProjectDAO projectDAO;

    public ProjectBO() {
        this.projectDAO = new ProjectDAO();
    }

    public List<Project> getProjectsByMemberId(int memberId) {
        return projectDAO.getProjectsByMemberId(memberId);
    }

    public List<Project> getAllProjects() {
        return projectDAO.getAllProjects();
    }
}
