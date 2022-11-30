<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/11/2022
  Time: 10:29 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
      <style>
          p {
              width: 100px;
          }
      </style>
  </head>
  <body>
  <h3>Simple Calculator</h3>
  <form action="/calculator" method="post">
    <fieldset>
      <legend>Calculator</legend>
      <label>First Operand</label>
     <input type="number" name="first"> <br>
      <label>Operator</label>
      <select name="select">
           <option value="add">Addition</option>
           <option value="sub">Subtraction</option>
           <option value="mul">Multiplication</option>
           <option value="div">Division</option>
      </select> <br>
      <label>Second Operand</label>
     <input type="number" name="second"> <br>
      <input type="submit" value="submit">
    </fieldset>
  </form>
  <%!int y = 5;%>
  </body>
</html>
