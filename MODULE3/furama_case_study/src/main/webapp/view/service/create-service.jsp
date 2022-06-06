<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới dịch vụ</title>
</head>

<body>
<%@include file="../../form/header.jsp" %>
<%@include file="../../form/nav-bar.jsp" %>
<div class="container-fluid d-flex m-2">
    <div class="left col-2">
        left
    </div>
    <div class="left col-8">
        <h1>Thêm mới dịch vụ</h1>
        <form method="post">
            <p style="color: cornflowerblue">${message}</p>
            <div class="form-group">
                <label>Mã dịch vụ</label>
                <input type="text" class="form-control" name="code" value="${service.code}" placeholder="Nhập mã dịch vụ" required>
                <p style="color: red">${error.get("code")}</p>
            </div>
            <div class="form-group">
                <label>Tên dịch vụ</label>
                <input type="text" class="form-control" name="name" value="${service.name}" placeholder="Nhập tên dịch vụ" required>
                <p style="color: red">${error.get("name")}</p>
            </div>
            <div class="form-group">
                <label>Chi phí dịch vụ</label>
                <input type="number" class="form-control" name="cost" value="${service.cost}" placeholder="Nhập chi phí dịch vụ" required>
                <p style="color: red">${error.get("cost")}</p>
            </div>
            <div class="form-group">
                <label>Số người tối đa</label>
                <input type="number" class="form-control" name="maxPeople" value="${service.maxPeople}" placeholder="Nhập số người tối đa" required>
                <p style="color: red">${error.get("maxPeople")}</p>
            </div>
            <div class="form-group">
                <label>Kiểu thuê</label>
                <select class="custom-select" name="rent_type_id" required>
                    <c:forEach var="type" items="${rentTypeList}">
                        <option value="${type.key}">${type.value}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>Chọn loại dịch vụ</label>
                <select class="custom-select" name="service_type_id" required>
                    <c:forEach var="type" items="${serviceTypeList}">
                        <option value="${type.key}">${type.value}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>Chọn loại phòng</label>
                <select class="custom-select" name="standardRoom" required>
                    <option value="VIP">VIP</option>
                    <option value="thường">Thường</option>
                </select>
            </div>
            <div class="form-group">
                <label>Chọn loại phòng</label>
                <select class="custom-select" name="standardRoom" required>
                    <option value="VIP">VIP</option>
                    <option value="thường">Thường</option>
                </select>
            </div>
            <div class="form-group">
                <label>Mô tả dịch vụ</label>
                <select class="custom-select" name="descriptionOtherConvenience" required>
                    <option value="Có hồ bơi">Có hồ bơi</option>
                    <option value="Có ban công">Có ban công</option>
                    <option value="Có bếp nướng">Có bếp nướng</option>
                    <option value="Có tivi,tủ lạnh">Có tivi,tủ lạnh</option>
                </select>
            </div>
            <div class="form-group">
                <label>Diện tích hồ bơi</label>
                <input type="number" class="form-control" name="poolArea" value="${service.poolArea}" placeholder="Nhập diện tích hồ bơi" required>
                <p style="color: red">${error.get("poolArea")}</p>
            </div>
            <div class="form-group">
                <label>Nhập số tầng</label>
                <input type="number" class="form-control" name="numberFloors" value="${service.numberFloors}" placeholder="Nhập số tầng" required>
                <p style="color: red">${error.get("numberFloors")}</p>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block mb-4">Thêm dịch vụ</button>
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
