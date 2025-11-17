<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chào mừng - CNW</title>
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
                <% if (session.getAttribute("loggedInMember") != null) { %>
                    <li><a href="${pageContext.request.contextPath}/projects">PROJECTS</a></li>
                    <li><a href="${pageContext.request.contextPath}/edit">EDIT</a></li>
                    <li><a href="${pageContext.request.contextPath}/add">ADD</a></li>
                <% } %>
            </ul>
            <% if (session.getAttribute("loggedInMember") != null) { %>
                <a href="${pageContext.request.contextPath}/logout" class="nav-btn nav-btn-logout">Logout</a>
            <% } else { %>
                <a href="${pageContext.request.contextPath}/login" class="nav-btn">Login</a>
            <% } %>
        </div>
    </nav>
    
    <!-- Welcome Section -->
    <div class="welcome-section">
        <h1>Chào mừng đến với CNW</h1>
        <p>TEST TEST TEST TEST TEST</p>
        <a href="${pageContext.request.contextPath}/members" class="btn-primary">Xem danh sách thành viên</a>
    </div>
</body>
</html>
