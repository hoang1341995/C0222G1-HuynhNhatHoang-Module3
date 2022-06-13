<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý bệnh án</title>
</head>
<body>
<%@include file="../../form/header.jsp" %>
<%@include file="../../form/nav-bar.jsp" %>
<!-- body service-->
<div class="container-fluid d-flex m-2">
    <div class="left col-12">
        <div class="d-flex m-2">
            <div class="col-8">
                <h1>Danh sách bệnh án</h1>
            </div>
            <div class="col-4 m-2">
                <form action="/service?action=search" method="post">

                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Tìm kiếm bệnh án" name="search-service"
                               aria-label="Tìm kiếm bệnh án"
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
                        data-target="#addNew">Thêm mới bệnh án
                </button>
            </div>
        </div>
        <table id="tables" class="table table-striped table-bordered" style="width:100%">
            <thead>
            <tr>
                <th>STT</th>
                <th>Mã bệnh án</th>
                <th>Mã bệnh nhân</th>
                <th>Tên bệnh nhân</th>
                <th>Ngày nhập viện</th>
                <th>Ngày ra viện</th>
                <th>Lý do nhập viện</th>
                <th>Tuỳ chọn</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${hospitalList}" var="hospital" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${hospital.maBenhAn}</td>
                <td>${hospital.maBenhNhan}</td>
                <td>${hospital.tenBenhNhan}</td>
                <td>${hospital.ngayNhapVien}</td>
                <td>${hospital.ngayRaVien}</td>
                <td>${hospital.lyDoNhapVien}</td>
                <td>
                    <div class="d-flex">
                        <button type="button" class="btn btn-outline-primary" style="margin-right: 2px"
                                data-toggle="modal" data-target="#edit"
                                onclick="editHospital('${hospital.idBenhAn}','${hospital.maBenhAn}','${hospital.idBenhNhan}',
                                        '${hospital.maBenhNhan}','${hospital.tenBenhNhan}','${hospital.ngayNhapVien}','${hospital.ngayRaVien}','${hospital.lyDoNhapVien}')">
                            Sửa
                        </button>
                        <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#delete"
                                onclick="deleteHospital('${hospital.idBenhNhan}','${hospital.tenBenhNhan}');">Xoá
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
                <h5 class="modal-title" id="exampleModalLabeldelete">Xoá bệnh án</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="bodyDelete">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <form action="/danh-sach?action=delete" method="post">
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
                <h5 class="modal-title" id="exampleModalLabeladdNew">Thêm bệnh án</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/service?action=add">
                    <div class="d-flex">
                        <div class="col-6">
                            <div class="form-group">
                                <label>Mã bệnh án</label>
                                <input type="text" class="form-control" name="code" value="${service.code}"
                                       placeholder="Nhập mã bệnh án" required>
                                <p style="color: red">${errorAdd.get("code")}</p>
                            </div>
                            <div class="form-group">
                                <label>Tên bệnh án</label>
                                <input type="text" class="form-control" name="name" value="${service.name}"
                                       placeholder="Nhập tên bệnh án" required>
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
                                <label>Loại bệnh án</label>
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
                <h5 class="modal-title" id="exampleModalLabel">Sửa thông tin bệnh án</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/danh-sach?action=edit">
                    <input hidden type="text" class="form-control" name="idBenhNhan" id="idBenhNhan" value="${hospital.idBenhNhan}"
                           placeholder="">
                    <input hidden type="text" class="form-control" name="maBenhAn" id="maBenhAn" value="${hospital.maBenhAn}">
                    <input hidden  type="text" class="form-control" name="maBenhNhan" id="maBenhNhan" value="${hospital.maBenhNhan}">
                    <div class="form-group">
                        <label>Mã bệnh án</label>
                        <input type="text" class="form-control" name="maBenhAn2" id="maBenhAn2" value="${hospital.maBenhAn}"
                               placeholder="Nhập mã bệnh án" disabled>
                    </div>
                    <div class="form-group">
                        <label>Mã bệnh nhân</label>
                        <input type="text" class="form-control" name="maBenhNhan2" id="maBenhNhan2" value="${hospital.maBenhNhan}"
                               placeholder="Nhập mã bệnh nhân" disabled>
                    </div>
                    <div class="form-group">
                        <label>Tên bệnh nhân</label>
                        <input type="text" class="form-control" name="tenBenhNhan" id="tenBenhNhan" value="${hospital.tenBenhNhan}"
                               placeholder="Nhập tên bệnh nhân">
                        <p style="color: red">${errorEdit.get("TenBenhNhan")}</p>
                    </div>
                    <div class="form-group">
                        <label>Ngày nhập viện</label>
                        <input placeholder="Selected date" type="date" id="ngayNhapVien" name="ngayNhapVien" value="${hospital.ngayNhapVien}"
                               class="form-control datepicker">
                        <p style="color: red">${errorEdit.get("ngayNhapVien")}</p>
                    </div>
                    <div class="form-group">
                        <label>Ngày ra viện</label>
                        <input placeholder="Selected date" type="date" id="ngayRaVien" name="ngayRaVien" value="${hospital.ngayRaVien}"
                               class="form-control datepicker">
                        <p style="color: red">${errorEdit.get("ngayRaVien")}</p>
                    </div>
                    <div class="form-group">
                        <label>Lý do nhập viện</label>
                        <input type="text" class="form-control" name="lyDoNhapVien" id="lyDoNhapVien" value="${hospital.lyDoNhapVien}"
                               placeholder="Nhập tên bệnh nhân">
                        <p style="color: red">${errorEdit.get("lyDoNhapVien")}</p>
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

    function editHospital(idBenhAn, maBenhAn, idBenhNhan, maBenhNhan, tenBenhNhan, ngayNhapVien, ngayRaVien, lyDoNhapVien) {
        document.getElementById("idBenhNhan").value = idBenhNhan;
        document.getElementById("maBenhAn").value = maBenhAn;
        document.getElementById("maBenhNhan").value = maBenhNhan;
        document.getElementById("maBenhAn2").value = maBenhAn;
        document.getElementById("maBenhNhan2").value = maBenhNhan;
        document.getElementById("tenBenhNhan").value = tenBenhNhan;
        document.getElementById("ngayNhapVien").value = ngayNhapVien;
        document.getElementById("ngayRaVien").value = ngayRaVien;
        document.getElementById("lyDoNhapVien").value = lyDoNhapVien;
        // changeServiceType();
    }

    function deleteHospital(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("bodyDelete").innerHTML = "Chắc chắn xoá thông tin bệnh án của <b style='color: #005cbf'>" + name + "</b> chứ ?";
    }
</script>
</body>
</html>
