<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Thêm mới sản phẩm</h2>
<a href="/products">Quay lại danh sách</a>
<c:if test="${message!=null}">
    <p>${message}</p>
</c:if>
<form action="/products?action=add" method="post">
<table>
    <tr>
        <td><input type="text" name="id" placeholder="Nhập id"></td>
    </tr>
    <tr>
        <td><input type="text" name="name" placeholder="Nhập tên sản phẩm"></td>
    </tr>
    <tr>
        <td><input type="text" name="price" placeholder="Nhập giá"></td>
    </tr>
    <tr>
        <td><input type="text" name="decription" placeholder="Nhập mô tả"></td>
    </tr>
    <tr>
        <td><input type="text" name="producer" placeholder="Nhập nhà sản xuất"></td>
    </tr>
    <tr>
        <td><input type="submit" value="Thêm mới"></td>
    </tr>
</table>
</form>
</body>
</html>
