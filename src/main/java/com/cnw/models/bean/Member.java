package com.cnw.models.bean;

public class Member {
    private int id;
    private String hoVaTen;
    private String congViec;
    private String chucVu;
    private String diaChi;
    private String sdt;
    private String email;
    private String gioiThieu;
    private String avtUrl;

    // Constructors
    public Member() {
    }

    public Member(int id, String hoVaTen, String congViec, String chucVu,
            String diaChi, String sdt, String email, String gioiThieu, String avtUrl) {
        this.id = id;
        this.hoVaTen = hoVaTen;
        this.congViec = congViec;
        this.chucVu = chucVu;
        this.diaChi = diaChi;
        this.sdt = sdt;
        this.email = email;
        this.gioiThieu = gioiThieu;
        this.avtUrl = avtUrl;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHoVaTen() {
        return hoVaTen;
    }

    public void setHoVaTen(String hoVaTen) {
        this.hoVaTen = hoVaTen;
    }

    public String getCongViec() {
        return congViec;
    }

    public void setCongViec(String congViec) {
        this.congViec = congViec;
    }

    public String getChucVu() {
        return chucVu;
    }

    public void setChucVu(String chucVu) {
        this.chucVu = chucVu;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGioiThieu() {
        return gioiThieu;
    }

    public void setGioiThieu(String gioiThieu) {
        this.gioiThieu = gioiThieu;
    }

    public String getAvtUrl() {
        return avtUrl;
    }

    public void setAvtUrl(String avtUrl) {
        this.avtUrl = avtUrl;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id=" + id +
                ", hoVaTen='" + hoVaTen + '\'' +
                ", chucVu='" + chucVu + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
