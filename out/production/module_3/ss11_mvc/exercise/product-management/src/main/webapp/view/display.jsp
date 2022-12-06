<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/12/2022
  Time: 10:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Chi tiết sản phẩm : ${product.name}</h3>
 <table border="1">
     <tr>
         <th>ID</th>
         <th>Tên Sản Phẩm</th>
         <th>Đơn giá</th>
         <th>Mô Tả</th>
         <th>Hãng</th>
     </tr>
     <tr>
         <th>${product.id}</th>
         <th>${product.name}</th>
         <th>${product.price}</th>
         <th>${product.description}</th>
         <th>${product.brand}</th>
     </tr>
 </table>
<a href="/product"><button>Quay lại trang chủ</button></a>
</body>
</html>
