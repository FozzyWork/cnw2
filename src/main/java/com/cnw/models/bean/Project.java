package com.cnw.models.bean;

public class Project {
    private int idProj;
    private int idMem;
    private String tenProj;
    private String congNgheProj;
    private String gioiThieuProj;
    private String thoiGianProj;

    public Project() {
    }

    public int getIdProj() {
        return idProj;
    }

    public void setIdProj(int idProj) {
        this.idProj = idProj;
    }

    public int getIdMem() {
        return idMem;
    }

    public void setIdMem(int idMem) {
        this.idMem = idMem;
    }

    public String getTenProj() {
        return tenProj;
    }

    public void setTenProj(String tenProj) {
        this.tenProj = tenProj;
    }

    public String getCongNgheProj() {
        return congNgheProj;
    }

    public void setCongNgheProj(String congNgheProj) {
        this.congNgheProj = congNgheProj;
    }

    public String getGioiThieuProj() {
        return gioiThieuProj;
    }

    public void setGioiThieuProj(String gioiThieuProj) {
        this.gioiThieuProj = gioiThieuProj;
    }

    public String getThoiGianProj() {
        return thoiGianProj;
    }

    public void setThoiGianProj(String thoiGianProj) {
        this.thoiGianProj = thoiGianProj;
    }
}
