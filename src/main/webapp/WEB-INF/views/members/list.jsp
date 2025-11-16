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
            <a href="${pageContext.request.contextPath}/" class="nav-logo">
                <img src="${pageContext.request.contextPath}/assets/icon.png" alt="Logo">
                <span class="logo-text">CNW</span>
            </a>
            <ul class="nav-menu">
                <li><a href="${pageContext.request.contextPath}/members">MEMBERS</a></li>
                <li><a href="${pageContext.request.contextPath}/about">ABOUT</a></li>
                <% if (session.getAttribute("loggedInMember") != null) { %>
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
    
    <!-- Page Title -->
    <h2 class="page-title">Danh sách thành viên</h2>
    
    <!-- Content -->
    <div class="content">
        <c:forEach var="member" items="${members}">
            <div class="content-box" onclick="showMemberModal(${member.id})" style="cursor: pointer;">
                <div class="member-avatar">
                    <img src="${pageContext.request.contextPath}/assets/avatars/${member.avtUrl}" 
                         alt="${member.hoVaTen}"
                         onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/avatars/defAvatar.jpg';">
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
    
    <!-- Modal Panel -->
    <div id="memberModal" class="modal">
        <div class="modal-content">
            <span class="modal-close" onclick="closeMemberModal()">&times;</span>
            <div id="modalBody">
                <!-- Content will be loaded here -->
            </div>
        </div>
    </div>
    
    <script>
        // Member data for modal
        const members = [
            <c:forEach var="member" items="${members}" varStatus="status">
            {
                id: ${member.id},
                hoVaTen: "${member.hoVaTen}",
                chucVu: "${member.chucVu}",
                congViec: "${member.congViec}",
                diaChi: "${member.diaChi}",
                sdt: "${member.sdt}",
                email: "${member.email}",
                gioiThieu: "${member.gioiThieu}",
                avtUrl: "${member.avtUrl}"
            }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];
        
        function showMemberModal(memberId) {
            const member = members.find(m => m.id === memberId);
            if (!member) return;
            
            const modal = document.getElementById('memberModal');
            const modalBody = document.getElementById('modalBody');
            
            modalBody.innerHTML = `
                <div class="modal-avatar">
                    <img src="${pageContext.request.contextPath}/assets/avatars/\${member.avtUrl}" 
                         alt="\${member.hoVaTen}"
                         onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/avatars/defAvatar.jpg';">
                </div>
                <h2 class="modal-name">\${member.hoVaTen}</h2>
                <p class="modal-position">\${member.chucVu} - \${member.congViec}</p>
                <div class="modal-details">
                    <p><strong>📍 Địa chỉ:</strong> \${member.diaChi}</p>
                    <p><strong>📞 Số điện thoại:</strong> \${member.sdt}</p>
                    <p><strong>✉️ Email:</strong> \${member.email}</p>
                    <p class="modal-bio"><strong>Giới thiệu:</strong><br>\${member.gioiThieu}</p>
                </div>
            `;
            
            modal.style.display = 'flex';
            document.body.style.overflow = 'hidden';
        }
        
        function closeMemberModal() {
            const modal = document.getElementById('memberModal');
            modal.style.display = 'none';
            document.body.style.overflow = 'auto';
        }
        
        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('memberModal');
            if (event.target === modal) {
                closeMemberModal();
            }
        }
        
        // Close modal with ESC key
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                closeMemberModal();
            }
        });
    </script>
</body>
</html>
