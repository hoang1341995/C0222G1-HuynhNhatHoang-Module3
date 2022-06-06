<%--
  Created by IntelliJ IDEA.
  User: huynhhoang
  Date: 02/06/2022
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
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
    <div class="left col-12">
        <div class="d-flex m-2">
            <div class="col-8">
                <h1>Danh sách khách hàng</h1>
                <p style="color: cornflowerblue">${message}</p>
                <p style="color: red">${error}</p>
            </div>
            <div class="col-4 m-2">
                <form action="/customer?action=search" method="post">

                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Tìm kiếm khách hàng" name="search-customer" aria-label="Tìm kiếm khách hàng" value="${search}" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit">Tìm kiếm</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <table id="tables" class="table table-striped table-bordered" style="width:100%">
            <thead>
            <tr>
                <th>STT</th>
                <th>ID</th>
                <th>Mã</th>
                <th>Tên khách hàng</th>
                <th>Ngày sinh</th>
                <th>Giới tính</th>
                <th>Số CMND</th>
                <th>Điện thoại</th>
                <th>Email</th>
                <th>Địa chỉ</th>
                <th>Loại khách hàng</th>
                <th>Tuỳ chọn</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${customerList}" var="customer" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${customer.id}</td>
                <td>${customer.code}</td>
                <td>${customer.name}</td>
                <td>${customer.birthday}</td>
                <td><c:if test="${customer.gender == 1}">Nam</c:if><c:if test="${customer.gender == 0}">Nữ</c:if></td>
                <td>${customer.idCard}</td>
                <td>${customer.phone}</td>
                <td>${customer.email}</td>
                <td>${customer.address}</td>
                <td>
                    ${customerTypeList.get(customer.customerTypeId)}
                </td>
                <td>
                    <div class="d-flex">
                        <button type="button" class="btn btn-outline-primary" style="margin-right: 2px" data-toggle="modal" data-target="#exampleModal"
                        onclick="editCustomer('${customer.id}','${customer.code}','${customer.name}','${customer.birthday}','<c:if test="${customer.gender == 1}">Nam</c:if><c:if test="${customer.gender == 0}">Nữ</c:if>',
                                '${customer.idCard}','${customer.phone}','${customer.email}','${customer.address}','${customer.customerTypeId}')">Sửa</button>
                        <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#delete" onclick="deleteCustomer('${customer.id}','${customer.name}');">Xoá</button>
                    </div>
                </td>

            </tr>
            </c:forEach>
        </table>


    </div>
</div>

<!-- Modal delete -->
<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabeldelete" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabeldelete">Xoá Khách hàng</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="bodyDeleteCustomer">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <form action="/customer?action=delete" method="post">
                    <input hidden type="text" name="idDelete" id="idDelete">
                    <button type="submit" class="btn btn-primary">Đồng ý</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal delete -->
<!-- Modal edit -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Sửa khách hàng</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/customer?action=update">
                        <input hidden type="text" class="form-control" name="id" id="id" value="" placeholder="">
                    <div class="form-group">
                        <label>Mã khách hàng</label>
                        <input type="text" class="form-control" name="code" id="code" value="" placeholder="Nhập mã khách hàng">
                        <p style="color: red"></p>
                    </div>
                    <div class="form-group">
                        <label>Tên khách hàng</label>
                        <input type="text" class="form-control" name="name"  id="name" value="" placeholder="Nhập tên khách hàng">
                        <p style="color: red"></p>
                    </div>
                    <div class="form-group">
                        <label>Loại khách hàng</label>
                        <select class="custom-select" name="customerTypeId"  id="customerTypeId" required="">

                            <option value="1">Diamond</option>

                            <option value="2">Platinium</option>

                            <option value="3">Gold</option>

                            <option value="4">Silver</option>

                            <option value="5">Member</option>

                        </select>
                    </div>
                    <div class="form-group">
                        <label>Ngày Sinh</label>
                        <input placeholder="Selected date" type="date" name="birthday" id="birthday" value="" class="form-control datepicker">
                        <p style="color: red"></p>
                    </div>
                    <div class="form-group">
                        <label>Giới tính</label>
                        <select class="custom-select" name="gender" id="gender">
                            <option value="1">Nam</option>
                            <option value="0">Nữ</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Số CMND</label>
                        <input type="text" class="form-control" name="idCard"  id="idCard" value="" placeholder="Nhập số CMND">
                        <p style="color: red"></p>
                    </div>
                    <div class="form-group">
                        <label>Số Điện thoại</label>
                        <input type="text" class="form-control" name="phone" id="phone" value="" placeholder="Nhập số Điện thoại">
                        <p style="color: red"></p>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" name="email" id="email" value="" placeholder="Nhập Email">
                        <p style="color: red"></p>
                    </div>
                    <div class="form-group">
                        <label>Địa chỉ</label>
                        <input type="text" class="form-control" name="address" id="address" value="" placeholder="Nhập điện chỉ">
                        <p style="color: red"></p>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block mb-4">Xác nhận</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="../../form/footer.jsp" %>
<script>
    function editCustomer(id,code,name,birthday,gender,idCard,phone,email,address,customerTypeId){
        document.getElementById("id").value = id;
        document.getElementById("code").value = code;
        document.getElementById("name").value = name;
        document.getElementById("birthday").value = birthday;
        if (gender === "Nam"){
            document.getElementById("gender").selectedIndex = "0";
        }else{
            document.getElementById("gender").selectedIndex = "1";
        }
        document.getElementById("idCard").value = idCard;
        document.getElementById("phone").value = phone;
        document.getElementById("email").value = email;
        document.getElementById("address").value = address;
        document.getElementById("customerTypeId").value = customerTypeId;

    }

    function deleteCustomer(id,name){
        document.getElementById("idDelete").value = id;
        document.getElementById("bodyDeleteCustomer").innerHTML = "Chắc chắn xoá khách hàng <b style='color: #005cbf'>" + name + "</b> chứ ?";
    }
</script>
</body>
</html>
