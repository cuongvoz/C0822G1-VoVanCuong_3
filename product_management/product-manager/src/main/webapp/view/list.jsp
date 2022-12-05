<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/12/2022
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product?action=add"><button>Thêm Sản phẩm</button></a>
<table border="1">
    <tr>
        <th>#</th>
        <th>Tên Sản Phẩm</th>
        <th>Trạng thái</th>
        <th>Đơn giá</th>
        <th>Mô Tả</th>
        <th>Sửa</th>
        <th>Xóa</th>
    </tr>
    <c:forEach var="product" items="${list}" varStatus="status">
        <tr>
           <td>${status.count}</td>
           <td>${product.name}</td>
            <c:if test="${product.status}">
                <td>Vẫn còn</td>
            </c:if>
            <c:if test="${!product.status}">
                <td>Đã hết</td>
            </c:if>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td><a href="/product?action=edit&id=${product.id}"><button>Sửa</button></a></td>
            <td><a href="/product"><button>Xóa</button></a></td>

        </tr>
    </c:forEach>
  
    
    
</table>


</body>
</html>
