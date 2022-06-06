<%--
  Created by IntelliJ IDEA.
  User: huynhhoang
  Date: 02/06/2022
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>footer</title>
</head>
<body>
<div class="container">
    <footer class="py-3 my-4">
        <ul class="nav justify-content-center border-bottom pb-3 mb-3">
            <li class="nav-item"><a href="/" class="nav-link px-2 text-muted">Trang chủ</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Nhân viên</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Khách hàng</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Dịch vụ</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Hợp đồng</a></li>
        </ul>
        <p class="text-center text-muted">© 2022 Furama Casestudy, Inc</p>
    </footer>
</div>
</body>
<script src="../bootstrap/js/jquery-3.6.0.min.js"></script>
<script src="../bootstrap/js/jquery.dataTables.min.js"></script>
<script src="../bootstrap/js/dataTables.bootstrap4.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tables').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 10
        });
    });
</script>
</html>
