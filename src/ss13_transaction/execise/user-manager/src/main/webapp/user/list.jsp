<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/12/2022
  Time: 10:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <script src="../bootstrap/js/bootstrap.js"></script>
</head>
<body>
<c:import url="include/header.jsp"></c:import>
<form action="/users?action=find" method="post">
    <input type="text" name="country">
    <button type="submit">Tìm kiếm</button>
</form>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
</center>
<a href="/users?action=sort"><button>Sắp xếp theo tên</button></a>
<div align="center">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Country</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${listUser}" varStatus="status">
            <tr>
                <th scope="row">${status.count}</th>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td>
                    <button class="btn btn-outline-success">Edit</button>
                </td>
                <td>
                    <button class="btn btn-outline-success">Delete</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/users">Back to list</a>
</div>
<form action="/users?action=delete" method="post">
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel1">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input name="id" type="hidden" id="id">
                <span id="name"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Understood</button>
            </div>
        </div>
    </div>
</div>
</form>
<div class="modal fade" id="update" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel2">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                    <form action="/users?action=edit" method="post">
                        <table border="1" cellpadding="5">
                            <caption>
                                <h2>
                                    Edit User
                                </h2>
                            </caption>
                            <c:if test="${user != null}">
                                <input type="hidden" name="id" value="<c:out value='${user.id}' />"/>
                            </c:if>
                            <tr>
                                <th>User Name:</th>
                                <td>
                                    <input type="text" name="name" size="45"
                                           value="<c:out value='${user.name}' />"
                                    />
                                </td>
                            </tr>
                            <tr>
                                <th>User Email:</th>
                                <td>
                                    <input type="text" name="email" size="45"
                                           value="<c:out value='${user.email}' />"
                                    />
                                </td>
                            </tr>
                            <tr>
                                <th>Country:</th>
                                <td>
                                    <input type="text" name="country" size="15"
                                           value="<c:out value='${user.country}' />"
                                    />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="submit" value="Save"/>
                                </td>
                            </tr>
                        </table>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                        <button type="submit" class="btn btn-primary">Sửa</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<c:import url="include/footer.jsp"></c:import>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    function deleteId(id,name) {
        document.getElementById("id").value = id;
        document.getElementById("name").innerText = name;
    }
</script>
</html>