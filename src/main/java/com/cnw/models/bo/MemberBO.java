package com.cnw.models.bo;

import com.cnw.models.bean.Member;
import com.cnw.models.dao.MemberDAO;

import java.util.List;

public class MemberBO {
    private MemberDAO memberDAO;

    public MemberBO() {
        this.memberDAO = new MemberDAO();
    }

    public List<Member> getAllMembers() {
        return memberDAO.getAllMembers();
    }

    public Member getMemberById(int id) {
        return memberDAO.getMemberById(id);
    }

    public Member checkLogin(String email, String password) {
        return memberDAO.checkLogin(email, password);
    }

    public boolean updateMember(Member member) {
        return memberDAO.updateMember(member);
    }

    public boolean addMember(Member member) {
        return memberDAO.addMember(member);
    }

    // Có thể thêm các business logic khác ở đây
    // Ví dụ: validation, tính toán, xử lý dữ liệu phức tạp
}
