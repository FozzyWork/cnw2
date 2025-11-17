package com.cnw.models.dao;

import com.cnw.models.bean.Project;
import com.cnw.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO {

    public List<Project> getProjectsByMemberId(int memberId) {
        List<Project> projects = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM projects WHERE IdMem = ?");
            pstmt.setInt(1, memberId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Project project = new Project();
                project.setIdProj(rs.getInt("IdProj"));
                project.setIdMem(rs.getInt("IdMem"));
                project.setTenProj(rs.getString("TenProj"));
                project.setCongNgheProj(rs.getString("CongNgheProj"));
                project.setGioiThieuProj(rs.getString("GioiThieuProj"));
                project.setThoiGianProj(rs.getString("ThoiGianProj"));
                projects.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return projects;
    }

    public List<Project> getAllProjects() {
        List<Project> projects = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM projects");

            while (rs.next()) {
                Project project = new Project();
                project.setIdProj(rs.getInt("IdProj"));
                project.setIdMem(rs.getInt("IdMem"));
                project.setTenProj(rs.getString("TenProj"));
                project.setCongNgheProj(rs.getString("CongNgheProj"));
                project.setGioiThieuProj(rs.getString("GioiThieuProj"));
                project.setThoiGianProj(rs.getString("ThoiGianProj"));
                projects.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return projects;
    }
}
