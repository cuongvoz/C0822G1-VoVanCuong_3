<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/12/2022
  Time: 10:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
 <table>
     <tr>
         <td>ID</td>
         <td>Tên</td>
         <td>Giá</td>
         <td>Mô Tả</td>
         <td>Hãng</td>
     </tr>
     <tr>
         <td>${result.id}</td>
         <td>${result.name}</td>
         <td>${result.price}</td>
         <td>${result.description}</td>
         <td>${result.brand}</td>
     </tr>
 </table>
<a href="/product"><button>Quay lại trang chính</button></a>
</body>
</html>
