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
<%--login--%>
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabellogin"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabellogin">Đăng nhập</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/login?action=login" method="post">
                    <div class="form-group">
                        <label>Tên đăng nhập</label>
                        <input type="text" class="form-control" name="username" value="${login.username}" placeholder="Nhập tên đăng nhập" >
                    </div>
                    <div class="form-group">
                        <label>Mật khẩu</label>
                        <input type="password" class="form-control" name="password" value="${login.password}" placeholder="Nhập mật khẩu" >
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="rememberMe" name="rememberMe">
                        <label class="form-check-label">
                            Remember me
                        </label>
                    </div>
                    <p style="color: red">${login.get("messLogin")}</p>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block mb-4">Đăng nhập</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--login--%>
<!-- Modal Message -->
<div class="modal fade" id="message" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelmessage"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabelmessage">Thông báo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="bodyMessage">
                <h4>
                    <p style="color: cornflowerblue">${message}</p>
                    <p style="color: red">${error}</p>
                </h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal Message -->
<div class="container">
    <footer class="py-3 my-4">
        <ul class="nav justify-content-center border-bottom pb-3 mb-3">
            <li class="nav-item"><a href="/" class="nav-link px-2 text-muted">Trang chủ</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Nhân viên</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Khách hàng</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Dịch vụ</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Hợp đồng</a></li>
        </ul>
        <p class="text-center text-muted">© 2022 Exam module3</p>
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
            "pageLength": 2
        });
    });
</script>
<script>
    $(document).ready(function () {
        ${openModalAdd}
        ${openModalEdit}
        ${openModalMessage}
    });
</script>
</html>
