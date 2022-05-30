<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Sửa sản phẩm</h2>
<a href="/products">Quay lại danh sách</a>
<c:if test="${message!=null}">
    <p>${message}</p>
</c:if>
<form action="/products?action=save" method="post">
    <table>
        <tr>
            <td><input type="text" name="id" placeholder="Nhập id" value="${productEdit.getId()}"></td>
        </tr>
        <tr>
            <td><input type="text" name="name" placeholder="Nhập tên sản phẩm" value="${productEdit.getName()}"></td>
        </tr>
        <tr>
            <td><input type="text" name="price" placeholder="Nhập giá" value="${productEdit.getPrice()}"></td>
        </tr>
        <tr>
            <td><input type="text" name="decription" placeholder="Nhập mô tả" value="${productEdit.getDecription()}"></td>
        </tr>
        <tr>
            <td><input type="text" name="producer" placeholder="Nhập nhà sản xuất" value="${productEdit.getProducer()}"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Xác nhận"></td>
        </tr>
    </table>
</form>
</body>
</html>
