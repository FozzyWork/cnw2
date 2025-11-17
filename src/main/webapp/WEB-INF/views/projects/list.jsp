<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cnw.models.bean.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Member loggedInMember = (Member) session.getAttribute("loggedInMember");
    if (loggedInMember == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dự án của tôi - CNW</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="${pageContext.request.contextPath}/" class="nav-logo">
                <img src="${pageContext.request.contextPath}/assets/icon.png" alt="Logo">
                <span class="logo-text">CNW</span>
            </a>
            <ul class="nav-menu">
                <li><a href="${pageContext.request.contextPath}/members">MEMBERS</a></li>
                <li><a href="${pageContext.request.contextPath}/about">ABOUT</a></li>
                <li><a href="${pageContext.request.contextPath}/projects">PROJECTS</a></li>
                <li><a href="${pageContext.request.contextPath}/edit">EDIT</a></li>
                <li><a href="${pageContext.request.contextPath}/add">ADD</a></li>
            </ul>
            <a href="${pageContext.request.contextPath}/logout" class="nav-btn nav-btn-logout">Logout</a>
        </div>
    </nav>
    
    <!-- Page Title -->
    <h2 class="page-title">Dự án của <%= loggedInMember.getHoVaTen() %></h2>
    
    <!-- Projects Grid -->
    <div class="projects-container">
        <c:forEach var="project" items="${projects}">
            <div class="project-card">
                <div class="project-id">
                    <span class="id-badge">#${project.idProj}</span>
                </div>
                <h3 class="project-title">${project.tenProj}</h3>
                <div class="project-meta">
                    <div class="meta-item">
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
                            <path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM1.5 8a6.5 6.5 0 1 0 13 0 6.5 6.5 0 0 0-13 0z"/>
                            <path d="M8 3.5a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5H4a.5.5 0 0 1 0-1h3.5V4a.5.5 0 0 1 .5-.5z"/>
                        </svg>
                        <span>${project.thoiGianProj}</span>
                    </div>
                </div>
                <div class="project-tech">
                    <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
                        <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2zm2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H4z"/>
                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                    </svg>
                    <div class="tech-tags">
                        <c:forEach var="tech" items="${project.congNgheProj.split(', ')}" varStatus="status">
                            <span class="tech-tag">${tech}</span>
                        </c:forEach>
                    </div>
                </div>
                <div class="project-description">
                    <p>${project.gioiThieuProj}</p>
                </div>
            </div>
        </c:forEach>
        
        <c:if test="${empty projects}">
            <div class="no-projects">
                <svg width="120" height="120" viewBox="0 0 120 120" fill="none">
                    <circle cx="60" cy="60" r="50" stroke="#e0e0e0" stroke-width="4"/>
                    <path d="M40 60h40M60 40v40" stroke="#e0e0e0" stroke-width="4" stroke-linecap="round"/>
                </svg>
                <h3>Chưa có dự án nào</h3>
                <p>Bạn chưa tham gia dự án nào. Hãy bắt đầu thêm dự án mới!</p>
            </div>
        </c:if>
    </div>
</body>
</html>
