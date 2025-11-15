<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách thành viên - CNW</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="nav-container">
            <div class="nav-logo">
                <img src="${pageContext.request.contextPath}/assets/icon.png" alt="Logo">
                <span class="logo-text">CNW</span>
            </div>
            <ul class="nav-menu">
                <li><a href="members">MEMBERS</a></li>
                <li><a href="#about">ABOUT</a></li>
                <li><a href="#package">PACKAGE</a></li>
                <li><a href="#contact">CONTACT</a></li>
            </ul>
            <a href="#book" class="nav-btn">Book Trip</a>
        </div>
    </nav>
    
    <!-- Page Title -->
    <h2 class="page-title">Danh sách thành viên</h2>
    
    <!-- Content -->
    <div class="content">
        <c:forEach var="member" items="${members}">
            <div class="content-box">
                <div class="member-avatar">
                    <img src="${pageContext.request.contextPath}/assets/avatars/${member.avtUrl}" 
                         alt="${member.hoVaTen}">
                </div>
                <div class="member-info">
                    <h3>${member.hoVaTen}</h3>
                    <p class="member-position">${member.chucVu} - ${member.congViec}</p>
                    <p class="member-address"><strong>📍</strong> ${member.diaChi}</p>
                    <p class="member-contact">
                        <strong>📞</strong> ${member.sdt} | 
                        <strong>✉️</strong> ${member.email}
                    </p>
                    <p class="member-bio">${member.gioiThieu}</p>
                </div>
            </div>
        </c:forEach>
        
        <c:if test="${empty members}">
            <div class="content-box">
                <p style="text-align: center; color: #666;">Không có thành viên nào.</p>
            </div>
        </c:if>
    </div>
</body>
</html>
