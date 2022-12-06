<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/11/2022
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<center>
    <h3 >Simple Calculator</h3>
</center>
<form action="/calculator" class="form-control d-flex justify-content-center" method="post">
    <fieldset >
        <legend style="width: 500px">Calulator</legend>
        <table class="table table-striped">
            <tr>
                <td><label>First operand</label></td>
                <td><input type="number" name="first"></td>
            </tr>
            <tr>
                <td><label>Operator</label></td>
                <td><select name="select">
                    <option value="+">Addition</option>
                    <option value="-">Subtraction</option>
                    <option value="x">Multiplication</option>
                    <option value="/">Division</option>
                </select> </td>
            </tr>
            <tr>
                <td> <label>Second operand</label></td>
                <td><input type="number" name="second"></td>
            </tr>
        </table>
        <button class="btn btn-success" type="submit"><i class="fa-sharp fa-solid fa-pen-nib"></i></button>
    </fieldset>
</form>
</body>
</html>
