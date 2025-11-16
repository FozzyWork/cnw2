package com.cnw.models.dao;

import com.cnw.models.bean.Member;
import com.cnw.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

    public List<Member> getAllMembers() {
        List<Member> members = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM members");

            while (rs.next()) {
                Member member = new Member();
                member.setId(rs.getInt("Id"));
                member.setHoVaTen(rs.getString("HoVaTen"));
                member.setCongViec(rs.getString("CongViec"));
                member.setChucVu(rs.getString("ChucVu"));
                member.setDiaChi(rs.getString("DiaChi"));
                member.setSdt(rs.getString("SDT"));
                member.setEmail(rs.getString("Email"));
                member.setGioiThieu(rs.getString("GioiThieu"));
                member.setAvtUrl(rs.getString("AvtUrl"));
                member.setMatKhau(rs.getString("MatKhau"));
                members.add(member);
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

        return members;
    }

    public Member getMemberById(int id) {
        Member member = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM members WHERE Id = ?");
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                member = new Member();
                member.setId(rs.getInt("Id"));
                member.setHoVaTen(rs.getString("HoVaTen"));
                member.setCongViec(rs.getString("CongViec"));
                member.setChucVu(rs.getString("ChucVu"));
                member.setDiaChi(rs.getString("DiaChi"));
                member.setSdt(rs.getString("SDT"));
                member.setEmail(rs.getString("Email"));
                member.setGioiThieu(rs.getString("GioiThieu"));
                member.setAvtUrl(rs.getString("AvtUrl"));
                member.setMatKhau(rs.getString("MatKhau"));
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

        return member;
    }

    public Member checkLogin(String email, String password) {
        Member member = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM members WHERE Email = ? AND MatKhau = ?");
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                member = new Member();
                member.setId(rs.getInt("Id"));
                member.setHoVaTen(rs.getString("HoVaTen"));
                member.setCongViec(rs.getString("CongViec"));
                member.setChucVu(rs.getString("ChucVu"));
                member.setDiaChi(rs.getString("DiaChi"));
                member.setSdt(rs.getString("SDT"));
                member.setEmail(rs.getString("Email"));
                member.setGioiThieu(rs.getString("GioiThieu"));
                member.setAvtUrl(rs.getString("AvtUrl"));
                member.setMatKhau(rs.getString("MatKhau"));
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

        return member;
    }

    public boolean updateMember(Member member) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "UPDATE members SET HoVaTen = ?, CongViec = ?, ChucVu = ?, " +
                    "DiaChi = ?, SDT = ?, Email = ?, GioiThieu = ?, AvtUrl = ? WHERE Id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getHoVaTen());
            pstmt.setString(2, member.getCongViec());
            pstmt.setString(3, member.getChucVu());
            pstmt.setString(4, member.getDiaChi());
            pstmt.setString(5, member.getSdt());
            pstmt.setString(6, member.getEmail());
            pstmt.setString(7, member.getGioiThieu());
            pstmt.setString(8, member.getAvtUrl());
            pstmt.setInt(9, member.getId());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean addMember(Member member) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO members (HoVaTen, CongViec, ChucVu, DiaChi, SDT, Email, GioiThieu, AvtUrl, MatKhau) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getHoVaTen());
            pstmt.setString(2, member.getCongViec());
            pstmt.setString(3, member.getChucVu());
            pstmt.setString(4, member.getDiaChi());
            pstmt.setString(5, member.getSdt());
            pstmt.setString(6, member.getEmail());
            pstmt.setString(7, member.getGioiThieu());
            pstmt.setString(8, member.getAvtUrl());
            pstmt.setString(9, member.getMatKhau());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
