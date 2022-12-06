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
<form class="d-flex" action="/users?action=find" method="post">
    <input width="10" class="form-control me-2" type="search" placeholder="Search" name="country">
    <button class="btn btn-outline-success" type="submit">Tìm kiếm</button>
</form>
<center>
    <h1>User Management</h1>
    <h2>
       <button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#addModal">Thêm User</button>
    </h2>
</center>
<a href="/users?action=sort"><button type="button" class="bth btn-outline-danger">Sắp xếp theo tên</button></a>
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

                       <button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModalz" onclick="editForm('${user.id}','${user.name}','${user.email}','${user.country}')" class="btn btn-outline-success">Edit</button>

                </td>
                <td>
                    <button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="deleteId('${user.id}','${user.name}')">Delete</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/users">Back to list</a>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/users?action=delete" method="post" >
                    <div class="modal-body">
                        <input type="hidden" name="id" id="idz">
                        Bạn có muốn xóa <span id="name"></span> không ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Xóa</button>
                    </div>
                </form>

            </div>
        </div>
    </div>


    <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/users?action=create" method="post">
                        <table border="1" cellpadding="5">
                            <caption>
                                <h2>Add New User</h2>
                            </caption>
                            <tr>
                                <th>User Name:</th>
                                <td>
                                    <input type="text" name="name" id="namec" size="45"/>
                                </td>
                            </tr>
                            <tr>
                                <th>User Email:</th>
                                <td>
                                    <input type="text" name="email" id="emailc" size="45"/>
                                </td>
                            </tr>
                            <tr>
                                <th>Country:</th>
                                <td>
                                    <input type="text" name="country" id="countryc" size="15"/>
                                </td>
                            </tr>
                            <tr>

                            </tr>
                        </table>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Thêm</button>
                </div>
                    </form>
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="exampleModalz" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="title">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form class="form-control" action="/users?action=edit" method="post">

                   <table class="form-control">
                       <input class="form-control" type="hidden" name="id" id="id">
                       <tr>
                           <td>Name</td>
                           <td> <input class="form-input" type="text" name="name" id="namez"> </td>
                       </tr>
                       <tr>
                           <td>Email</td>
                           <td> <input type="text" name="email" id="emailz"> </td>
                       </tr>
                       <tr><td>Country</td>
                           <td> <input type="text" name="country" id="countryz"> </td></tr>
                   </table>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
                </form>
            </div>
        </div>
    </div>


<c:import url="include/footer.jsp"></c:import>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

    function editForm(id,name,email,country) {
       document.getElementById("id").value = id;
       document.getElementById("namez").value = name;
       document.getElementById("emailz").value = email;
       document.getElementById("countryz").value = country;

    }

    function deleteId(id,name) {
        document.getElementById("idz").value = id;
        document.getElementById("name").innerText = name;
    }
</script>
</html>