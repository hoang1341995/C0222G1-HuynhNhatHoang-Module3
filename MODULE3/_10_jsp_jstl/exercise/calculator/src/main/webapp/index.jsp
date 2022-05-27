<%--
  Created by IntelliJ IDEA.
  User: huynhhoang
  Date: 27/05/2022
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Calculator</title>
    <style>
        input[type=number], select {
            width: 30%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit] {
            width: 30%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body>
<h1>Simple Calculator</h1>
<div>
    <form action="/calculator" method="post">
        <input type="number" name="number1" placeholder="First Operand"><br>
        <select name="operator">
            <option value="+">addition(+)</option>
            <option value="-">subtraction(-)</option>
            <option value="*">multiplication(*)</option>
            <option value="/">division(/)</option>
        </select><br>
        <input type="number" name="number2" placeholder="Second Operand"><br>
        <input type="submit" name="Submit">
        <p>${total}</p>
    </form>
</div>

</body>
</html>
