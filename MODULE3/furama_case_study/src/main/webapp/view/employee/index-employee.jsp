<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý nhân viên</title>
</head>
<body>
<%@include file="../../form/header.jsp" %>
<%@include file="../../form/nav-bar.jsp" %>
<!-- body employee-->
<div class="container-fluid d-flex m-2">
    <div class="left col-12">
        <div class="d-flex m-2">
            <div class="col-8">
                <h1>Danh sách nhân viên</h1>
            </div>
            <div class="col-4 m-2">
                <form action="/employee?action=search" method="post">

                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Tìm kiếm nhân viên" name="search-employee"
                               aria-label="Tìm kiếm nhân viên"
                               value="${search}" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="submit">Tìm kiếm</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="d-flex">
            <div class="col-10">
            </div>
            <div class="col-2 text-right">
                <button type="button" class="btn btn-outline-info" style="margin-right: 2px" data-toggle="modal"
                        data-target="#addNew">Thêm mới nhân viên
                </button>
            </div>
        </div>
        <table id="tables" class="table table-striped table-bordered" style="width:100%">
            <thead>
            <tr>
                <th>STT</th>
                <th>Tên nhân viên</th>
                <th>Ngày sinh</th>
                <th>Số CMND</th>
                <th>Điện thoại</th>
                <th>Email</th>
                <th>Địa chỉ</th>
                <th>Trình độ</th>
                <th>Bộ phận</th>
                <th>Vị trí</th>
                <th>Lương</th>
                <th>Tên tài khoản</th>
                <th>Tuỳ chọn</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${employeeList}" var="employee" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${employee.name}</td>
                <td>${employee.birthday}</td>
                <td>${employee.idCard}</td>
                <td>${employee.phone}</td>
                <td>${employee.email}</td>
                <td>${employee.address}</td>
                <td>${positonList.get(employee.positionId)}</td>
                <td>${educationList.get(employee.educationId)}</td>
                <td>${divisionList.get(employee.divisionId)}</td>
                <td>${employee.salary}</td>
                <td>${employee.username}</td>
                <td>
                    <div class="d-flex">
                        <button type="button" class="btn btn-outline-primary" style="margin-right: 2px"
                                data-toggle="modal" data-target="#edit"
                                onclick="editEmployee('${employee.id}','${employee.name}','${employee.birthday}',
                                        '${employee.idCard}','${employee.phone}','${employee.email}','${employee.address}','${employee.salary}',
                                        '${employee.positionId}','${employee.educationId}','${employee.divisionId}')">
                            Sửa
                        </button>
                        <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#delete"
                                onclick="deleteEmployee('${employee.id}','${employee.name}');">Xoá
                        </button>
                    </div>
                </td>

            </tr>
            </c:forEach>
        </table>


    </div>
</div>
<!-- body employee-->
<!-- Modal delete -->
<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabeldelete"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabeldelete">Xoá Nhân Viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="bodyDelete">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <form action="/employee?action=delete" method="post">
                    <input hidden type="text" name="idDelete" id="idDelete">
                    <button type="submit" class="btn btn-primary">Đồng ý</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal delete -->
<!-- Modal addNew -->
<div class="modal fade bd-example-modal-lg" id="addNew" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabeladdNew">Thêm Nhân viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/employee?action=add">
                    <div class="d-flex">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Tên nhân viên</label>
                                <input type="text" class="form-control" name="name" value="${employee.name}"
                                       placeholder="Nhập tên nhân viên">
                                <p style="color: red">${errorAdd.get("name")}</p>
                            </div>
                            <div class="form-group">
                                <label>Ngày Sinh</label>
                                <input placeholder="Selected date" type="date" name="birthday" value="${employee.birthday}"
                                       class="form-control datepicker">
                                <p style="color: red">${errorAdd.get("birthday")}</p>
                            </div>
                            <div class="form-group">
                                <label>Số CMND</label>
                                <input type="text" class="form-control" name="idCard" value="${employee.idCard}"
                                       placeholder="Nhập số CMND">
                                <p style="color: red">${errorAdd.get("idCard")}</p>
                            </div>
                            <div class="form-group">
                                <label>Số Điện thoại</label>
                                <input type="text" class="form-control" name="phone" value="${employee.phone}"
                                       placeholder="Nhập số Điện thoại">
                                <p style="color: red">${errorAdd.get("phone")}</p>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email" value="${employee.email}"
                                       placeholder="Nhập Email">
                                <p style="color: red">${errorAdd.get("email")}</p>
                            </div>
                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <input type="text" class="form-control" name="address" value="${employee.address}"
                                       placeholder="Nhập địa chỉ">
                                <p style="color: red">${errorAdd.get("address")}</p>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Lương</label>
                                <input type="number" class="form-control" name="salary" value="${employee.salary}"
                                       placeholder="Nhập lương" required>
                                <p style="color: red">${errorAdd.get("salary")}</p>
                            </div>
                            <div class="form-group">
                                <label>Chức vụ</label>
                                <select class="custom-select" name="position" required>
                                    <c:forEach var="type" items="${positonList}">
                                        <option value="${type.key}">${type.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Trình độ</label>
                                <select class="custom-select" name="education" required>
                                    <c:forEach var="type" items="${educationList}">
                                        <option value="${type.key}">${type.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Bộ phận</label>
                                <select class="custom-select" name="division" required>
                                    <c:forEach var="type" items="${divisionList}">
                                        <option value="${type.key}">${type.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Tên tài khoản</label>
                                <input type="text" class="form-control" name="username" value="${employee.username}"
                                       placeholder="Nhập tên tài khoản">
                                <p style="color: red">${errorAdd.get("username")}</p>
                            </div>
                            <div class="form-group">
                                <label>Mật khẩu</label>
                                <input type="password" class="form-control" name="password" value="${employee.password}"
                                       placeholder="Nhập mật khẩu">
                                <p style="color: red">${errorAdd.get("password")}</p>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block mb-4">Xác nhận</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal addNew -->
<!-- Modal edit -->
<div class="modal fade bd-example-modal-lg" id="edit" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Sửa nhân viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/employee?action=update">
                    <input hidden type="text" class="form-control" name="id" id="id" value="${employee.id}"
                           placeholder="">
                    <div class="d-flex">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Tên nhân viên</label>
                                <input type="text" class="form-control" name="name" id="name" value="${employee.name}"
                                       placeholder="Nhập tên nhân viên">
                                <p style="color: red">${errorEdit.get("name")}</p>
                            </div>
                            <div class="form-group">
                                <label>Ngày Sinh</label>
                                <input placeholder="Selected date" type="date" name="birthday" id="birthday"
                                       value="${employee.birthday}" class="form-control datepicker">
                                <p style="color: red">${errorEdit.get("birthday")}</p>
                            </div>
                            <div class="form-group">
                                <label>Số CMND</label>
                                <input type="text" class="form-control" name="idCard" id="idCard" value="${employee.idCard}"
                                       placeholder="Nhập số CMND">
                                <p style="color: red">${errorEdit.get("idCard")}</p>
                            </div>
                            <div class="form-group">
                                <label>Số Điện thoại</label>
                                <input type="text" class="form-control" name="phone" id="phone" value="${employee.phone}"
                                       placeholder="Nhập số Điện thoại">
                                <p style="color: red">${errorEdit.get("phone")}</p>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email" id="email" value="${employee.email}"
                                       placeholder="Nhập Email">
                                <p style="color: red">${errorEdit.get("email")}</p>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <input type="text" class="form-control" name="address" id="address" value="${employee.address}"
                                       placeholder="Nhập địa chỉ">
                                <p style="color: red">${errorEdit.get("address")}</p>
                            </div>
                            <div class="form-group">
                                <label>Lương</label>
                                <input type="number" class="form-control" name="salary" id="salary" value="${employee.salary}"
                                       placeholder="Nhập lương" required>
                                <p style="color: red">${errorEdit.get("salary")}</p>
                            </div>
                            <div class="form-group">
                                <label>Chức vụ</label>
                                <select class="custom-select" name="position" required>
                                    <c:forEach var="type" items="${positonList}">
                                        <option value="${type.key}">${type.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Trình độ</label>
                                <select class="custom-select" name="education" required>
                                    <c:forEach var="type" items="${educationList}">
                                        <option value="${type.key}">${type.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Bộ phận</label>
                                <select class="custom-select" name="division" required>
                                    <c:forEach var="type" items="${divisionList}">
                                        <option value="${type.key}">${type.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block mb-4">Xác nhận</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal edit -->
<%@include file="../../form/footer.jsp" %>
<script>
    $(document).ready(function () {
        ${openModalAdd}
        ${openModalEdit}
        ${openModalMessage}
    });
</script>
<script>
    function editEmployee(id, name, birthday, idCard, phone, email, address, salary, positionId, educationId, divisionId) {
        document.getElementById("id").value = id;
        document.getElementById("name").value = name;
        document.getElementById("birthday").value = birthday;
        document.getElementById("idCard").value = idCard;
        document.getElementById("phone").value = phone;
        document.getElementById("email").value = email;
        document.getElementById("address").value = address;
        document.getElementById("salary").value = salary;
        document.getElementById("position").value = positionId;
        document.getElementById("education").value = educationId;
        document.getElementById("division").value = divisionId;
    }

    function deleteEmployee(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("bodyDelete").innerHTML = "Chắc chắn xoá nhân viên <b style='color: #005cbf'>" + name + "</b> chứ ?";
    }
</script>
</body>
</html>
