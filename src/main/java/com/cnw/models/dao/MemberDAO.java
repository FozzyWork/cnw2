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
}
