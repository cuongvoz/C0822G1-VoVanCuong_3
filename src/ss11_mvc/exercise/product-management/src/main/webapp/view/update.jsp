<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/12/2022
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Sửa thông tin sản phẩm ${product.name}</h3>
<form action="/product?action=update" method="post">
    <input type="hidden" name="oldid" value="${product.id}">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="number" name="id" value="${product.id}"></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name" value="${product.name}"></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><input type="number" name="price" value="${product.price}"></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><input type="text" name="description" value="${product.description}"></td>
        </tr>
        <tr>
            <td>Brand</td>
            <td><input type="text" name="brand" value="${product.brand}"></td>
        </tr>
    </table>
     <button type="submit">Update</button>
</form>
</body>
</html>
