<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<%@include file="../../form/header.jsp" %>
<%@include file="../../form/nav-bar.jsp" %>
<div class="container-fluid d-flex m-2">
    <div class="left col-2">
        left
    </div>
    <div class="left col-8">
        <h1>Thêm mới khách hàng</h1>
        <form method="post">
            <p style="color: cornflowerblue">${message}</p>
            <div class="form-group">
                <label>Mã khách hàng</label>
                <input type="text" class="form-control" name="code" value="${customer.code}" placeholder="Nhập mã khách hàng" >
                <p style="color: red">${error.get("code")}</p>
            </div>
            <div class="form-group">
                <label>Tên khách hàng</label>
                <input type="text" class="form-control" name="name" value="${customer.name}" placeholder="Nhập tên khách hàng" >
                <p style="color: red">${error.get("name")}</p>
            </div>
            <div class="form-group">
                <label>Loại khách hàng</label>
                <select class="custom-select" name="customerTypeId" required>
                    <c:forEach var="type" items="${customerList}">
                        <option value="${type.key}">${type.value}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>Ngày Sinh</label>
                <input placeholder="Selected date" type="date" name="birthday" value="${customer.birthday}" class="form-control datepicker" >
                <p style="color: red">${error.get("birthday")}</p>
            </div>
            <div class="form-group">
                <label>Giới tính</label>
                <select class="custom-select" name="gender" >
                    <option value="1">Nam</option>
                    <option value="0">Nữ</option>
                </select>
            </div>
            <div class="form-group">
                <label>Số CMND</label>
                <input type="text" class="form-control" name="idCard" value="${customer.idCard}" placeholder="Nhập số CMND" >
                <p style="color: red">${error.get("idCard")}</p>
            </div>
            <div class="form-group">
                <label>Số Điện thoại</label>
                <input type="text" class="form-control" name="phone" value="${customer.phone}" placeholder="Nhập số Điện thoại" >
                <p style="color: red">${error.get("phone")}</p>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control" name="email" value="${customer.email}"  placeholder="Nhập Email" >
                <p style="color: red">${error.get("email")}</p>
            </div>
            <div class="form-group">
                <label>Địa chỉ</label>
                <input type="text" class="form-control" name="address" value="${customer.address}" placeholder="Nhập điện chỉ" >
                <p style="color: red">${error.get("address")}</p>
            </div>
            <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block mb-4">Xác nhận</button>
            </div>
        </form>



    </div>
    <div class="left col-2">
        right
    </div>
</div>
<%@include file="../../form/footer.jsp" %>
</body>
</html>
