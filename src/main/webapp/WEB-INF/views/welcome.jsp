<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cnw.models.bean.Member" %>
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
    <title>Xin chào - CNW</title>
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
                <li><a href="${pageContext.request.contextPath}/edit">EDIT</a></li>
                <li><a href="${pageContext.request.contextPath}/add">ADD</a></li>
            </ul>
            <a href="${pageContext.request.contextPath}/logout" class="nav-btn nav-btn-logout">Logout</a>
        </div>
    </nav>
    
    <!-- Welcome Section -->
    <div class="welcome-container">
        <div class="welcome-content">
            <div class="welcome-avatar">
                <img src="${pageContext.request.contextPath}/assets/avatars/<%= loggedInMember.getAvtUrl() %>" 
                     alt="<%= loggedInMember.getHoVaTen() %>"
                     onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/avatars/defAvatar.jpg';">
            </div>
            <h1 class="welcome-title">Xin chào, <%= loggedInMember.getHoVaTen() %>!</h1>
            <p class="welcome-subtitle"><%= loggedInMember.getChucVu() %></p>
            
            <div class="welcome-info">
                <div class="info-item">
                    <span class="info-label">Email:</span>
                    <span class="info-value"><%= loggedInMember.getEmail() %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">Công việc:</span>
                    <span class="info-value"><%= loggedInMember.getCongViec() %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">Địa chỉ:</span>
                    <span class="info-value"><%= loggedInMember.getDiaChi() %></span>
                </div>
                <div class="info-item">
                    <span class="info-label">Số điện thoại:</span>
                    <span class="info-value"><%= loggedInMember.getSdt() %></span>
                </div>
            </div>
            
            <div class="welcome-actions">
                <a href="${pageContext.request.contextPath}/" class="btn-primary">Về trang chủ</a>
                <a href="${pageContext.request.contextPath}/members" class="btn-secondary">Xem thành viên</a>
            </div>
        </div>
    </div>
</body>
</html>
