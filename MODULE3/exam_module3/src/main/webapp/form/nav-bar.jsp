<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>navbar</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="fa fa-bars"></span> Menu
        </button>
        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav m-auto">
                <li class="nav-item active"><a href="/" class="nav-link">Trang chủ</a></li>
                <li class="nav-item"><a href="/danh-sach" class="nav-link">Danh sách bệnh nhân</a></li>
                <li class="nav-item"><a href="/#" class="nav-link">Dịch vụ khác</a></li>
<%--                <li class="nav-item"><a href="#" class="nav-link"></a></li>--%>
                <li class="nav-item"><a data-toggle="modal" data-target="#login" class="nav-link">Đăng nhập</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Đăng ký</a></li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
