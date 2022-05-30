<%--
  Created by IntelliJ IDEA.
  User: huynhhoang
  Date: 30/05/2022
  Time: 09:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/view/add-new-product.jsp">Thêm mới </a>
<form action="products?action=search" method="post">
    <input type="text" name="searchProduct" placeholder="Nhập id hoặc tên sản phẩm">
    <input type="submit" value="Tìm kiếm">
</form>
<table border="1" style="border-collapse:  collapse;text-align: center">
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Giá sản phẩm</th>
        <th>Mô tả</th>
        <th>Nhà sản xuất</th>
        <th>Tuỳ chọn</th>
    </tr>

    <c:forEach items="${listProduct}" var="products" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${products.id}</td>
            <td><a href="/products?action=view&id=${products.id}">${products.name}</a></td>
            <td>${products.price}</td>
            <td>${products.decription}</td>
            <td>${products.producer}</td>
            <td>
                <a href="/products?action=edit&id=${products.id}">Sửa</a>
                <a  href="/products?action=remove&id=${products.id}" onclick="return confirm('Chắc chắn xoá ${products.name} chứ ?')">Xoá</a>
            </td>
        </tr>

    </c:forEach>
</table>
</body>
</html>
