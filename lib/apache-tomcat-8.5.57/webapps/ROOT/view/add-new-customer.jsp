<%--
  Created by IntelliJ IDEA.
  User: huynhhoang
  Date: 02/06/2022
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<%@include file="../form/header.jsp" %>
<%@include file="../form/nav-bar.jsp" %>
<div class="container-fluid d-flex m-2">
    <div class="left col-2">
        left
    </div>
    <div class="left col-8">
        <h1>Thêm mới khách hàng</h1>
        <form>
            <div class="form-group">
                <label>Tên khách hàng</label>
                <input type="text" class="form-control" name="name" placeholder="Nhập tên khách hàng">
            </div>
            <div class="form-group">
                <label>Loại khách hàng</label>
                <select class="custom-select" name="customer-type" required>
                    <c:forEach var="type" items="${customerList}">
                        <option value="${type.key}">${type.value}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>Ngày Sinh</label>
                <input placeholder="Selected date" type="date" name="birthday" class="form-control datepicker">
            </div>
            <div class="form-group">
                <label>Giới tính</label>
                <select class="custom-select" name="gender" required>
                    <option value="1">Nam</option>
                    <option value="0">Nữ</option>
                </select>
            </div>
            <div class="form-group">
                <label>Số CMND</label>
                <input type="text" class="form-control" name="cmnd" placeholder="Nhập số CMND">
            </div>
            <div class="form-group">
                <label>Số Điện thoại</label>
                <input type="text" class="form-control" name="phone" placeholder="Nhập số Điện thoại">
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control" name="email" placeholder="Nhập Email">
            </div>
            <div class="form-group">
                <label>Địa chỉ</label>
                <input type="text" class="form-control" name="address" placeholder="Nhập điện chỉ">
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary btn-lg">Xác nhận</button>
            </div>
        </form>


    </div>
    <div class="left col-2">
        right
    </div>
</div>
<%@include file="../form/footer.jsp" %>
</body>
</html>
