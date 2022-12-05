<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/12/2022
  Time: 12:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product?action=edit&id=${product.id}" method="post">
    <fieldset>
        <legend>Chỉnh sửa thông tin ${product.name}</legend>
        <table>
            <tr>
                <td>Nhập Tên</td>
                <td><input type="text" name="name" value="${product.name}"></td>
            </tr>
            <tr>
                <td>Trạng thái</td>
                <td>
                    <input type="radio" checked name="status" value=true> Vẫn còn
                    <input type="radio" name="status" value=false> Đã hết
                </td>
            </tr>
            <tr>
                <td>Đơn giá</td>
                <td>
                    <input type="number" name="price" value="${product.price}">
                </td>
            </tr>
            <tr>
                <td>Mô tả</td>
                <td><input type="text" name="description" value="${product.description}"></td>
            </tr>
        </table>
        <center>
            <button type="submit">Create</button>
        </center>
    </fieldset>
</form>
</body>
</html>
