<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <style>
      #customers {
        font-family: Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
      }

      #customers td, #customers th {
        border: 1px solid #ddd;
        padding: 8px;
      }

      #customers tr:nth-child(even){background-color: #f2f2f2;}

      #customers tr:hover {background-color: #ddd;}

      #customers th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: left;
        background-color: #04AA6D;
        color: white;
      }
      th,tr,td{
       text-align: center;
      }
    </style>
  </head>
  <body>
    <table id="customers" >
      <tr>
        <th>TÊN</th>
        <th>NGÀY SINH</th>
        <th>ĐỊA CHỈ</th>
        <th>ẢNH</th>
      </tr>
      <c:forEach items="${CustomerList}" var="customer">
        <tr>
          <td>${customer.name}</td>
          <td>${customer.dayOfBirth}</td>
          <td>${customer.address}</td>
          <td><img src="${customer.image}" alt="" width="100" height="100"></td>
        </tr>
      </c:forEach>
    </table>
  </body>
</html>
