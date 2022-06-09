<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý dịch vụ</title>
</head>
<body>
<%@include file="../../form/header.jsp" %>
<%@include file="../../form/nav-bar.jsp" %>
<!-- body service-->
<div class="container-fluid d-flex m-2">
    <div class="left col-12">
        <div class="d-flex m-2">
            <div class="col-8">
                <h1>Danh sách dịch vụ</h1>
            </div>
            <div class="col-4 m-2">
                <form action="/service?action=search" method="post">

                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Tìm kiếm dịch vụ" name="search-service"
                               aria-label="Tìm kiếm dịch vụ"
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
                        data-target="#addNew">Thêm mới dịch vụ
                </button>
            </div>
        </div>
        <table id="tables" class="table table-striped table-bordered" style="width:100%">
            <thead>
            <tr>
                <th>STT</th>
                <th>Mã dịch vụ</th>
                <th>Tên dịch vụ</th>
                <th>Diện tích</th>
                <th>Tối đa</th>
                <th>Kiểu thuê</th>
                <th>Loại dịch vụ</th>
                <th>Loại phòng</th>
                <th>Hồ bơi</th>
                <th>Tầng</th>
                <th>Chi phí</th>
                <th>Mô tả</th>
                <th>Tuỳ chọn</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${serviceList}" var="service" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${service.code}</td>
                <td>${service.name}</td>
                <td>${service.area}m²</td>
                <td>${service.maxPeople} người</td>
                <td>${service.rentTypeValue}</td>
                <td>${service.serviceTypeValue}</td>
                <td>${service.standardRoom}</td>
                <td><c:if test="${service.poolArea == 0}"><p style="color: red">không</p></c:if><c:if test="${service.poolArea !=0}">${service.poolArea}m²</c:if></td>
                <td><c:if test="${service.numberFloors ==0}"><p style="color: red">không</p></c:if><c:if test="${service.numberFloors !=0}">${service.numberFloors}</c:if></td>
                <td>${service.serviceCost}</td>
                <td>${service.description}</td>

                <td>
                    <div class="d-flex">
                        <button type="button" class="btn btn-outline-primary" style="margin-right: 2px"
                                data-toggle="modal" data-target="#edit"
                                onclick="editService('${service.id}','${service.name}','${service.area}',
                                        '${service.maxPeople}','${service.rentTypeId}','${service.serviceTypeId}','${service.standardRoom}','${service.poolArea}',
                                        '${service.numberFloors}','${service.serviceCost}','${service.description}')">
                            Sửa
                        </button>
                        <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#delete"
                                onclick="deleteService('${service.id}','${service.name}');">Xoá
                        </button>
                    </div>
                </td>

            </tr>
            </c:forEach>
        </table>


    </div>
</div>
<!-- body service-->
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
<!-- Modal delete -->
<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabeldelete"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabeldelete">Xoá dịch vụ</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="bodyDelete">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <form action="/service?action=delete" method="post">
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
                <h5 class="modal-title" id="exampleModalLabeladdNew">Thêm dịch vụ</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/service?action=add">
                    <div class="d-flex">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Mã dịch vụ</label>
                                <input type="text" class="form-control" name="code" value="${service.code}"
                                       placeholder="Nhập mã dịch vụ" required>
                                <p style="color: red">${errorAdd.get("code")}</p>
                            </div>
                            <div class="form-group">
                                <label>Tên dịch vụ</label>
                                <input type="text" class="form-control" name="name" value="${service.name}"
                                       placeholder="Nhập tên dịch vụ" required>
                                <p style="color: red">${errorAdd.get("name")}</p>
                            </div>
                            <div class="form-group">
                                <label>Diện tích</label>
                                <input type="number" name="area"
                                       value="${service.area}" class="form-control datepicker" placeholder="Nhập diện tích" required>
                                <p style="color: red">${errorAdd.get("area")}</p>
                            </div>
                            <div class="form-group">
                                <label>Số người tối đa</label>
                                <input type="number" class="form-control" name="maxPeople" value="${service.maxPeople}"
                                       placeholder="Nhập số người tối đa" required>
                                <p style="color: red">${errorAdd.get("maxPeople")}</p>
                            </div>
                            <div class="form-group">
                                <label>Kiểu thuê</label>
                                <select class="custom-select" name="rentTypeId" >
                                    <c:forEach var="type" items="${rentTypeMap}">
                                        <option value="${type.key}">${type.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Loại dịch vụ</label>
                                <select class="custom-select" name="serviceTypeId"  id="serviceTypeIdAddNew" onchange="changeServiceTypeAddNew()" >
                                    <c:forEach var="type" items="${serviceTypeMap}">
                                        <option value="${type.key}">${type.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Loại phòng</label>
                                <select class="custom-select" name="standardRoom"  >
                                    <option value="Thường">Thường</option>
                                    <option value="VIP">VIP</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Diện tích hồ bơi</label>
                                <input type="number" class="form-control" name="poolArea" id="poolAreaAddNew" value="${service.poolArea}"
                                       placeholder="Nhập diện tích hồ bơi" required>
                                <p style="color: red">${errorAdd.get("poolArea")}</p>
                            </div>
                            <div class="form-group">
                                <label>Tầng</label>
                                <input type="number" class="form-control" name="numberFloors" id="numberFloorsAddNew" value="${service.numberFloors}"
                                       placeholder="Nhập tầng" required>
                                <p style="color: red">${errorAdd.get("numberFloors")}</p>
                            </div>
                            <div class="form-group">
                                <label>Chi phí</label>
                                <input type="number" class="form-control" name="serviceCost" value="${service.serviceCost}"
                                       placeholder="Nhập chi phí" required>
                                <p style="color: red">${errorAdd.get("serviceCost")}</p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Mô tả</label>
                        <textarea class="form-control" name="description" rows="3" placeholder="Nhập mô tả" required>${service.description}</textarea>
                        <p style="color: red">${errorAdd.get("description")}</p>
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
                <h5 class="modal-title" id="exampleModalLabel">Sửa dịch vụ</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/service?action=update">
                    <input hidden type="text" class="form-control" name="id" id="id" value="${service.id}"
                           placeholder="">
                    <div class="d-flex">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Tên dịch vụ</label>
                                <input type="text" class="form-control" name="name" id="name" value="${service.name}"
                                       placeholder="Nhập tên dịch vụ" required>
                                <p style="color: red">${errorEdit.get("name")}</p>
                            </div>
                            <div class="form-group">
                                <label>Diện tích</label>
                                <input type="number" name="area" id="area"
                                       value="${service.area}" class="form-control datepicker" placeholder="Nhập diện tích" required>
                                <p style="color: red">${errorEdit.get("area")}</p>
                            </div>
                            <div class="form-group">
                                <label>Số người tối đa</label>
                                <input type="number" class="form-control" name="maxPeople" id="maxPeople" value="${service.maxPeople}"
                                       placeholder="Nhập số người tối đa" required>
                                <p style="color: red">${errorEdit.get("maxPeople")}</p>
                            </div>
                            <div class="form-group">
                                <label>Kiểu thuê</label>
                                <select class="custom-select" name="rentTypeId"  id="rentTypeId" >
                                    <c:forEach var="type" items="${rentTypeMap}">
                                        <option value="${type.key}">${type.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Loại dịch vụ</label>
                                <select class="custom-select" name="serviceTypeId"  id="serviceTypeId" onchange="changeServiceType()" >
                                    <c:forEach var="type" items="${serviceTypeMap}">
                                        <option value="${type.key}">${type.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label>Loại phòng</label>
                                <select class="custom-select" name="standardRoom"  id="standardRoom" >
                                    <option value="Thường">Thường</option>
                                    <option value="VIP">VIP</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Diện tích hồ bơi</label>
                                <input type="number" class="form-control" name="poolArea" id="poolArea" value="${service.poolArea}"
                                       placeholder="Nhập diện tích hồ bơi" required>
                                <p style="color: red">${errorEdit.get("poolArea")}</p>
                            </div>
                            <div class="form-group">
                                <label>Tầng</label>
                                <input type="number" class="form-control" name="numberFloors" id="numberFloors" value="${service.numberFloors}"
                                       placeholder="Nhập tầng" required>
                                <p style="color: red">${errorEdit.get("numberFloors")}</p>
                            </div>
                            <div class="form-group">
                                <label>Chi phí</label>
                                <input type="number" class="form-control" name="serviceCost" id="serviceCost" value="${service.serviceCost}"
                                       placeholder="Nhập chi phí" required>
                                <p style="color: red">${errorEdit.get("serviceCost")}</p>
                            </div>
                            <div class="form-group">
                                <label>Mô tả</label>
                                <input type="text" class="form-control" name="description" id="description" value="${service.description}"
                                       placeholder="Nhập mô tả" required>
                                <p style="color: red">${errorEdit.get("description")}</p>
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
    function changeServiceTypeAddNew(){

        if (document.getElementById("serviceTypeIdAddNew").value == "1"){
            document.getElementById("poolAreaAddNew").placeholder = "Nhập diện tích hồ bơi"
            document.getElementById("numberFloorsAddNew").placeholder = "Nhập số tầng"
            document.getElementById("poolAreaAddNew").disabled = false;
            document.getElementById("numberFloorsAddNew").disabled = false;
        }else if (document.getElementById("serviceTypeIdAddNew").value == "2"){
            document.getElementById("poolAreaAddNew").value = "";
            document.getElementById("poolAreaAddNew").placeholder = "House không có hồ bơi"
            document.getElementById("numberFloorsAddNew").placeholder = "Nhập số tầng"
            document.getElementById("poolAreaAddNew").disabled = true;
            document.getElementById("numberFloorsAddNew").disabled = false;
        }else {
            document.getElementById("poolAreaAddNew").value = "";
            document.getElementById("poolAreaAddNew").placeholder = "Room không có hồ bơi"
            document.getElementById("numberFloorsAddNew").value = "";
            document.getElementById("numberFloorsAddNew").placeholder = "Room không có tầng"
            document.getElementById("poolAreaAddNew").disabled = true;
            document.getElementById("numberFloorsAddNew").disabled = true;
        }
    }

    function changeServiceType(){
        if (document.getElementById("serviceTypeId").value == "1"){
            document.getElementById("poolArea").placeholder = "Nhập diện tích hồ bơi"
            document.getElementById("numberFloors").placeholder = "Nhập số tầng"
            document.getElementById("poolArea").disabled = false;
            document.getElementById("numberFloors").disabled = false;
        }else if (document.getElementById("serviceTypeId").value == "2"){
            document.getElementById("poolArea").value = "";
            document.getElementById("poolArea").placeholder = "House không có hồ bơi"
            document.getElementById("numberFloors").placeholder = "Nhập số tầng"
            document.getElementById("poolArea").disabled = true;
            document.getElementById("numberFloors").disabled = false;
        }else {
            document.getElementById("poolArea").value = "";
            document.getElementById("poolArea").placeholder = "Room không có hồ bơi"
            document.getElementById("numberFloors").value = "";
            document.getElementById("numberFloors").placeholder = "Room không có tầng"
            document.getElementById("poolArea").disabled = true;
            document.getElementById("numberFloors").disabled = true;
        }
    }

    function editService(id, name, area, maxPeople, rentTypeId, serviceTypeId, standardRoom, poolArea, numberFloors, serviceCost, description) {
        document.getElementById("id").value = id;
        document.getElementById("name").value = name;
        document.getElementById("area").value = area;
        document.getElementById("maxPeople").value = maxPeople;
        document.getElementById("rentTypeId").value = rentTypeId;
        document.getElementById("serviceTypeId").value = serviceTypeId;
        document.getElementById("standardRoom").value = standardRoom;
        document.getElementById("poolArea").value = poolArea;
        document.getElementById("numberFloors").value = numberFloors;
        document.getElementById("serviceCost").value = serviceCost;
        document.getElementById("description").value = description;
        changeServiceType();
    }

    function deleteService(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("bodyDelete").innerHTML = "Chắc chắn xoá dịch vụ <b style='color: #005cbf'>" + name + "</b> chứ ?";
    }
</script>
</body>
</html>
