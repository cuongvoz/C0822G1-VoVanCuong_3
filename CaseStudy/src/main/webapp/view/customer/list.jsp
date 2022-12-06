<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/12/2022
  Time: 10:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/css/bootstrap.css">
    <script src="bootstrap-5.1.3-dist/js/bootstrap.bundle.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/css/style.css">
</head>
<body>
<table>



</table>
<div class="row">
    <ul class="nav justify-content-center">
        <li class="nav-item">
            <img src="https://furamavietnam.com/wp-content/uploads/2018/08/logo.png">
        </li>
        <li class="nav-item">
            <div class="card" style="width: 8rem;height: 6rem">
                <img src="https://truevaluevietnam.com/wp-content/uploads/2015/10/TA_brand_logo.png" height="55"
                     class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                </div>
            </div>
        </li>
        <li class="nav-item">
            <p style="display: inline">
                103 - 105 Vo Nguyen Giap Street, Khue <br>
                My Ward, Ngu Hanh Son District, Danang <br>
                City, Vietnam <br>
                7,0 km from Danang Airport
            </p>
        </li>
        <li class="nav-item" style="margin-top: 30px">
            <p>84-236-3847 333/888 <br>
                reservation@furamavietnam.com</p>
        </li>
    </ul>
</div>
<div class="row">
    <nav class="navbar navbar-light" style="background-color: teal">
        <div class="container-fluid" style="position: relative">
            <a class="navbar-brand"
               href="http://localhost:63342/module_3/case_study/Case_study/furama_web/furama_web.html?_ijt=m6b5ul3uno31tpfcv8t97msmvu">Home</a>

            <button class="btn btn-light" style="position: absolute;left: 100px" data-bs-toggle="modal" data-bs-target="#addmodal">Thêm Khách Hàng</button>
            <form action="/customer?action=find" method="post" style="position:absolute ;top: 1px;right: 30px" class="d-flex">
                <input class="form-control me-2" type="search" name="name" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-light" type="submit">Tìm</button>
            </form>
        </div>
    </nav>
</div>
<c:if test="${list.size() == 0}">
    <br> <br>
    <center>
        <h3 >Không tìm thấy khách hàng tên: " ${find} " <i class="fa-sharp fa-solid fa-magnifying-glass"></i></h3>
    </center>

</c:if>
<c:if test="${list.size() != 0}">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Họ Tên</th>
            <th scope="col">Ngày Sinh</th>
            <th scope="col">Giới Tính</th>
            <th scope="col">CMND</th>
            <th scope="col">Số Điện Thoại</th>
            <th scope="col">Email</th>
            <th scope="col">Địa Chỉ</th>
            <th scope="col">Kiểu Khách</th>
            <th scope="col">Sửa</th>
            <th scope="col">Xóa</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${list}" varStatus="status">
            <tr scope="row">
                <td>${status.count}</td>
                <td>${customer.name}</td>
                <td>${customer.dateOfBirth}</td>
                <c:if test="${customer.gender}">
                    <td>Nam</td>
                </c:if>
                <c:if test="${!customer.gender}">
                    <td>Nữ</td>
                </c:if>
                <td>${customer.iDCard}</td>
                <td>${customer.phoneNumber}</td>
                <td>${customer.email}</td>
                <td>${customer.address}</td>
                <td>${customer.customerType.name}</td>
                <td>
                        <%--                                                             id,name,birthday,idCard,phoneNumber,email,address--%>
                    <button class="btn btn-success" onclick="update('${customer.id}','${customer.name}','${customer.dateOfBirth}','${customer.iDCard}','${customer.phoneNumber}','${customer.email}','${customer.address}')"  data-bs-toggle="modal" data-bs-target="#editmodal"><i class="fa-sharp fa-solid fa-pen"></i></button>
                </td>
                <td>
                    <button class="btn btn-success " onclick="deleteCustomer('${customer.id}','${customer.name}')"  data-bs-toggle="modal" data-bs-target="#deletemodal"><i class="fa-sharp fa-solid fa-user-slash"></i></button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
<br> <br>
 <center>
    <h3>
        <a href="/customer"><button class="btn btn-outline-success">Quay Lại Trang</button></a>
    </h3>
 </center>
<div style="background: cadetblue;margin-top: 80px" class="row">
    <div class="col-1" style="background: cadetblue"></div>
    <div class="col-3" style="background: #bcbebf">
        <h1 style="color: darkkhaki;text-align: center;margin-top: 30px">How to Get to Us</h1>
        <p style="text-align: center;text-align: left">Furama is a premier base for exploring one of<br> Asia's most
            exciting new destinations. Just a<br> short drive
            from Danang lay four UNESCO-listed<br> World Heritage Sites:</p>
        <h1><a href="#" class="btn" style="color: white;background: teal"><i class="fa-sharp fa-solid fa-location-dot"> &ensp;View On Map</i></a>
        </h1>
        <h2 style="color: darkkhaki">Local Places</h2>
        <br>
        <p><b>1. The former imperial city of HUE &ensp;&ensp;&ensp;&ensp;&ensp;&nbsp;&nbsp;2 hours</b></p>
        <hr>
        <p><b>2. The ancient Hoi An &ensp;&ensp;&ensp; &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&nbsp;&nbsp;30
            minutes</b></p>
        <hr>
        <p><b>3. Champa civilization, My Son &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;90 minutes</b></p>
        <hr>
        <p><b>4. Phong Nha Caves &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
            3 hours</b></p>
    </div>
    <div class="col-3" style="margin-top: 30px;text-align: center">
        <a style="color: #5c636a;text-decoration: none" href="">News</a>
        <br>
        <br>
        <a style="color: #5c636a;text-decoration: none" href="">Rack rate</a>
        <br>
        <br>
        <a style="color: #5c636a;text-decoration: none" href="">Lifestyle Bog</a>
        <br>
        <br>
        <a style="color: #5c636a;text-decoration: none" href="">Work with us</a>
        <br>
        <br>
        <a style="color: #5c636a;text-decoration: none" href="">Contact us</a>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div style="margin-left: 130px"><img
                src="https://furamavietnam.com/wp-content/uploads/2019/02/Ariyana-Tourism-Complex-02-2.png"
                width="760" height="90"></div>
    </div>
    <div class="col-4" style="margin-top: 40px">
        <h5 style="color: darkkhaki;">Contact US</h5>
        <br>
        <p style="font-size: 17px">
            <i class="fa-sharp fa-solid fa-location-dot"></i>
            103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son<br> District, Danang City, Vietnam<br>
            Tel.: 84-236-3847 333/888 * Fax: 84-236-3847 666<br>
            Email: reservation@furamavietnam.com *<a href="https://furamavietnam.com/undefined/" style="color: black;text-decoration: none">www.furamavietnam.com</a> <br> GDS Codes: Amadeus-GD DADFUR,
            Galileo/Apollo-GD 16236<br>, Sabre-GD 032771, Worldspan- GD DADFU
        </p>
        <hr>
        <a href="https://www.facebook.com/furamaresort/"><img
                src="https://furamavietnam.com/wp-content/uploads/2019/06/incon-Facbook-1.png"></a>
        <a href="https://www.instagram.com/furama_resort_and_villas/?hl=vi"><img src="https://furamavietnam.com/wp-content/uploads/2019/06/social-ins.png"></a>
        <a href="https://www.youtube.com/user/furamaresortvietnam/featured"><img src="https://furamavietnam.com/wp-content/uploads/2021/10/social-youtube.png"></a>
        <br>
        <br>
        <br>
        <br>
        <p style="margin-left: 300px">© 2018 Furama Resort Danang </p>
    </div>
</div>
<div class="modal" tabindex="-1" id="addmodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thêm mới khách hàng <i class="fa-sharp fa-solid fa-user"></i></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/customer?action=add" method="post">
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Nhập Tên</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="name">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Ngày Sinh</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" name="birthday">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Giới Tính</label>
                        <div class="col-sm-10">
                            <input type="radio"  class="radio" checked name="gender" value="true"> Nam &nbsp;&nbsp;&nbsp;
                            <input type="radio" class="radio" name="gender" value="false"> Nữ
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Mã CMND</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="idcard">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Số Điện Thoại</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="phonenumber">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label  class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label  class="col-sm-2 col-form-label">Địa Chỉ</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="address">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label  class="col-sm-2 col-form-label">Chọn Kiểu</label>
                        <div class="col-sm-10">
                            <select  class="form-select" name="typeid">
                                <c:forEach var="type" items="${typeList}">
                                    <option value="${type.id}">${type.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-primary">Xác Nhận</button>
            </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal" tabindex="-1" id="editmodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chỉnh sửa thông tin khách hàng <span id="nameForm"></span></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/customer?action=edit" method="post">
                    <div class="mb-3 row">
                        <input type="hidden" name="id" id="idEdit">
                        <label class="col-sm-2 col-form-label">Họ Tên</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="nameEdit" name="name">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Ngày Sinh</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="birthdayEdit" name="birthday">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Giới Tính</label>
                        <div class="col-sm-10">
                            <input type="radio"  class="radio" checked name="gender" value="true"> Nam &nbsp;&nbsp;&nbsp;
                            <input type="radio" class="radio" name="gender" value="false"> Nữ
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Mã CMND</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="idcardEdit" name="idcard">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Số Điện Thoại</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="phoneNumberEdit" name="phonenumber">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label  class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="emailEdit" name="email">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label  class="col-sm-2 col-form-label">Địa Chỉ</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addressEdit" name="address">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label  class="col-sm-2 col-form-label">Chọn Kiểu</label>
                        <div class="col-sm-10">
                            <select  class="form-select" name="typeid">
                                <c:forEach var="type" items="${typeList}">
                                    <option value="${type.id}">${type.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="submit" class="btn btn-primary">Xác Nhận</button>
                    </div>
                </form>
            </div>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Quit</button>--%>
<%--                <button type="button" class="btn btn-primary">Change</button>--%>
<%--            </div>--%>
        </div>
    </div>
</div>
<div class="modal" tabindex="-1" id="deletemodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Xác Nhận Xóa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/customer?action=delete" method="post">
                <div class="modal-body">
                    <p>Bạn có chắc chắn muốn xóa <span id="nameDelete"></span> ?</p>
                </div>
                <input type="hidden" name="id" id="idDelete">
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </div>
            </form>

        </div>
    </div>
</div>

</body>
<script>
    function update(id,name,birthday,idCard,phoneNumber,email,address) {
         document.getElementById("idEdit").value = id;
         document.getElementById("nameEdit").value = name;
         document.getElementById("birthdayEdit").value = birthday;
         document.getElementById("idcardEdit").value = idCard;
         document.getElementById("phoneNumberEdit").value = phoneNumber;
         document.getElementById("emailEdit").value = email;
         document.getElementById("addressEdit").value = address;
         document.getElementById("nameForm").innerText = name;
    }

    function  deleteCustomer(id,name) {
         document.getElementById("idDelete").value = id;
         document.getElementById("nameDelete").innerText = name;
    }
</script>
</html>
