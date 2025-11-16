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
    <title>Chỉnh sửa thông tin - CNW</title>
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
    
    <!-- Page Title -->
    <h2 class="page-title">Chỉnh sửa thông tin cá nhân</h2>
    
    <!-- Edit Form -->
    <div class="edit-container">
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>
        
        <form action="${pageContext.request.contextPath}/edit" method="post" class="edit-form">
            <div class="form-group">
                <label for="hoVaTen">Họ và tên:</label>
                <input type="text" id="hoVaTen" name="hoVaTen" 
                       value="<%= loggedInMember.getHoVaTen() %>" required>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="congViec">Công việc:</label>
                    <input type="text" id="congViec" name="congViec" 
                           value="<%= loggedInMember.getCongViec() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="chucVu">Chức vụ:</label>
                    <input type="text" id="chucVu" name="chucVu" 
                           value="<%= loggedInMember.getChucVu() %>" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="diaChi">Địa chỉ:</label>
                <input type="text" id="diaChi" name="diaChi" 
                       value="<%= loggedInMember.getDiaChi() %>" required>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="sdt">Số điện thoại:</label>
                    <input type="tel" id="sdt" name="sdt" 
                           value="<%= loggedInMember.getSdt() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" 
                           value="<%= loggedInMember.getEmail() %>" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="gioiThieu">Giới thiệu:</label>
                <textarea id="gioiThieu" name="gioiThieu" rows="4" required><%= loggedInMember.getGioiThieu() %></textarea>
            </div>
            
            <div class="form-group">
                <label for="avtUrl">Avatar URL:</label>
                <input type="text" id="avtUrl" name="avtUrl" 
                       value="<%= loggedInMember.getAvtUrl() %>" required>
                <small>Tên file avatar (ví dụ: avatar1.jpg)</small>
            </div>
            
            <div class="form-actions">
                <a href="${pageContext.request.contextPath}/welcome" class="btn-cancel">Hủy</a>
                <button type="submit" class="btn-submit">Lưu thay đổi</button>
            </div>
        </form>
    </div>
</body>
</html>
