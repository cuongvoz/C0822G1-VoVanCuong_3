<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/12/2022
  Time: 7:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product?action=add">
    <button>
        Thêm Sản Phẩm
    </button>
</a>


<table border="1">
        <tr>
            <th>Tên Sản Phẩm</th>
            <th>Đơn Giá</th>
            <th>Sửa</th>
            <th>Xóa</th>
        </tr>
        <c:forEach var="product" items="${list}">
            <tr>
                <th><a href="/product?action=display&id=${product.id}">${product.getName()}</a></th>
                <th>${product.getPrice()}</th>
                <th>
                    <a href="/product?action=update&id=${product.id}">
                        <button>Sửa</button>
                    </a>
                </th>
                <th>
                 <a href="/product?action=remove&id=${product.id}"><button>Xóa</button></a>
                </th>
            </tr>
        </c:forEach>

  <form action="/product?action=find" method="post">
      Tên Sản Phẩm: <input type="text" name="name">
      <button type="submit">Tìm Kiếm</button>
  </form>
</table>
</body>
</html>
