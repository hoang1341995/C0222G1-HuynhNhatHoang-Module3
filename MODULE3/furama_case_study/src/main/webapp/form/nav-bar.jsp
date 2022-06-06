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
                <li class="nav-item"><a href="/employee" class="nav-link">Nhân viên</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="customer" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Khách hàng</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="/customer?action=list">Danh sách khách hàng</a>
                        <a class="dropdown-item" href="/customer?action=add">Thêm mới khách hàng</a>
                    </div>
                </li>
                <li class="nav-item"><a href="/service" class="nav-link">Dịch vụ</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Hợp Đồng</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Đăng nhập</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Đăng ký</a></li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
