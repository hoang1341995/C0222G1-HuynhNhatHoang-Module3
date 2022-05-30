<%--
  Created by IntelliJ IDEA.
  User: huynhhoang
  Date: 30/05/2022
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/products">Quay lại danh sách</a>
<h3>Thông tin sảm phẩm ${product.getName()}</h3>
<table  border="1" style="border-collapse:  collapse;text-align: center">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Decription</th>
        <th>Producer</th>
    </tr>
    <tr>
        <td>${product.getId()}</td>
        <td>${product.getName()}</td>
        <td>${product.getPrice()}</td>
        <td>${product.getDecription()}</td>
        <td>${product.getProducer()}</td>
    </tr>
</table>
</body>
</html>
