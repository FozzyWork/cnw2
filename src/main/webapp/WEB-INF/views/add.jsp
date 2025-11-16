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
    <title>Thêm thành viên mới - CNW</title>
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
    <h2 class="page-title">Thêm thành viên mới</h2>
    
    <!-- Add Form -->
    <div class="edit-container">
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>
        
        <form action="${pageContext.request.contextPath}/add" method="post" class="edit-form">
            <div class="form-group">
                <label for="hoVaTen">Họ và tên: <span class="required">*</span></label>
                <input type="text" id="hoVaTen" name="hoVaTen" required>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="congViec">Công việc: <span class="required">*</span></label>
                    <input type="text" id="congViec" name="congViec" required>
                </div>
                
                <div class="form-group">
                    <label for="chucVu">Chức vụ: <span class="required">*</span></label>
                    <input type="text" id="chucVu" name="chucVu" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="diaChi">Địa chỉ: <span class="required">*</span></label>
                <input type="text" id="diaChi" name="diaChi" required>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="sdt">Số điện thoại: <span class="required">*</span></label>
                    <input type="tel" id="sdt" name="sdt" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email: <span class="required">*</span></label>
                    <input type="email" id="email" name="email" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="matKhau">Mật khẩu: <span class="required">*</span></label>
                <input type="password" id="matKhau" name="matKhau" required>
            </div>
            
            <div class="form-group">
                <label for="gioiThieu">Giới thiệu: <span class="required">*</span></label>
                <textarea id="gioiThieu" name="gioiThieu" rows="4" required></textarea>
            </div>
            
            <div class="form-group">
                <label for="avtUrl">Avatar URL:</label>
                <input type="text" id="avtUrl" name="avtUrl" placeholder="Để trống sẽ sử dụng avatar mặc định">
                <small>Tên file avatar (ví dụ: avatar1.jpg). Nếu bỏ trống sẽ dùng defAvatar.jpg</small>
            </div>
            
            <div class="form-actions">
                <a href="${pageContext.request.contextPath}/members" class="btn-cancel">Hủy</a>
                <button type="submit" class="btn-submit">Thêm thành viên</button>
            </div>
        </form>
    </div>
</body>
</html>
