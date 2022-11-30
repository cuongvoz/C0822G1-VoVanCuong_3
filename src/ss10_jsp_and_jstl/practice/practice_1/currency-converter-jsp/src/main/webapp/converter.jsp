<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/11/2022
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
 <%
 float rate = Float.parseFloat(request.getParameter("rate"));
 float usd = Float.parseFloat(request.getParameter("usd"));
 float vnd = rate * usd;
 %>
 <h2>Rate: <%=rate%></h2>
 <h2>USD: <%=usd%></h2>
<h2>Tổng số tiền VND là: <%=vnd%></h2>
</body>
</html>
