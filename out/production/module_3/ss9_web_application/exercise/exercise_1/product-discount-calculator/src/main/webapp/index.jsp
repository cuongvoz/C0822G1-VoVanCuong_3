<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/11/2022
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>Product Discount Calculator</h1>
  <form action="/caculator" method="post" style="border: 1px solid black;width: 150px">
     <br>
  <input type="text" name="discription" placeholder="Mô tả của sản phẩm">
    <br>
    <input type="number" name="price" placeholder="Giá niêm yết của sản phẩm">
    <br>
    <input type="number" name="percent" placeholder="Tỷ lệ chiết khấu (phần trăm)"> <br>
    <button type="submit">Submit</button>
  </form>
  </body>
</html>
