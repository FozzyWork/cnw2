<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới thiệu - CNW</title>
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
    <h2 class="page-title">Giới thiệu về CNW</h2>
    
    <!-- Content -->
    <div class="content">
        <!-- About Main Section -->
        <div class="about-section">
            <div class="about-hero">
                <h1>Chào mừng đến với CNW</h1>
                <p class="about-subtitle">Công Nghệ Web - Nơi kết nối đam mê và sáng tạo</p>
            </div>
            
            <div class="about-content-box">
                <h2>🎯 Sứ mệnh của chúng tôi</h2>
                <p>
                    CNW được thành lập với mục tiêu tạo ra một cộng đồng năng động, nơi các nhà phát triển web 
                    có thể học hỏi, chia sẻ kinh nghiệm và cùng nhau phát triển các dự án công nghệ hiện đại. 
                    Chúng tôi tin rằng sự hợp tác và đam mê là chìa khóa để tạo ra những sản phẩm vượt trội.
                </p>
            </div>
            
            <div class="about-content-box">
                <h2>💡 Giá trị cốt lõi</h2>
                <div class="values-grid">
                    <div class="value-item">
                        <div class="value-icon">🚀</div>
                        <h3>Đổi mới sáng tạo</h3>
                        <p>Luôn tìm kiếm và áp dụng những công nghệ mới nhất để mang lại giá trị tốt nhất.</p>
                    </div>
                    <div class="value-item">
                        <div class="value-icon">🤝</div>
                        <h3>Hợp tác đoàn kết</h3>
                        <p>Làm việc nhóm hiệu quả, chia sẻ kiến thức và cùng nhau tiến bộ.</p>
                    </div>
                    <div class="value-item">
                        <div class="value-icon">⭐</div>
                        <h3>Chất lượng hàng đầu</h3>
                        <p>Cam kết mang đến những sản phẩm và dịch vụ với chất lượng cao nhất.</p>
                    </div>
                    <div class="value-item">
                        <div class="value-icon">📚</div>
                        <h3>Học hỏi liên tục</h3>
                        <p>Không ngừng học hỏi và cập nhật kiến thức mới trong lĩnh vực công nghệ.</p>
                    </div>
                </div>
            </div>
            
            <div class="about-content-box">
                <h2>🎓 Lĩnh vực hoạt động</h2>
                <ul class="about-list">
                    <li><strong>Phát triển Web Full-stack:</strong> Xây dựng các ứng dụng web hoàn chỉnh với công nghệ hiện đại như Java, Spring Boot, JSP, và các framework JavaScript.</li>
                    <li><strong>Thiết kế UI/UX:</strong> Tạo ra giao diện người dùng đẹp mắt, trực quan và dễ sử dụng.</li>
                    <li><strong>Quản lý dự án:</strong> Áp dụng các phương pháp Agile và Scrum để quản lý dự án hiệu quả.</li>
                    <li><strong>Đào tạo và chia sẻ:</strong> Tổ chức các workshop, seminar để chia sẻ kiến thức và kinh nghiệm.</li>
                </ul>
            </div>
            
            <div class="about-content-box">
                <h2>📊 Thành tựu nổi bật</h2>
                <div class="stats-grid">
                    <div class="stat-item">
                        <div class="stat-number">50+</div>
                        <div class="stat-label">Dự án hoàn thành</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">100+</div>
                        <div class="stat-label">Thành viên</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">5+</div>
                        <div class="stat-label">Năm kinh nghiệm</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">98%</div>
                        <div class="stat-label">Khách hàng hài lòng</div>
                    </div>
                </div>
            </div>
            
            <div class="about-content-box">
                <h2>🌟 Tại sao chọn CNW?</h2>
                <p>
                    Với đội ngũ chuyên gia giàu kinh nghiệm, chúng tôi không chỉ tạo ra các sản phẩm công nghệ 
                    chất lượng cao mà còn xây dựng một môi trường làm việc sáng tạo, năng động và đầy cảm hứng. 
                    CNW là nơi lý tưởng để bạn phát triển sự nghiệp và thực hiện những ý tưởng đột phá.
                </p>
                <div class="cta-section">
                    <h3>Sẵn sàng tham gia cùng chúng tôi?</h3>
                    <a href="${pageContext.request.contextPath}/members" class="btn-primary">Xem đội ngũ của chúng tôi</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
