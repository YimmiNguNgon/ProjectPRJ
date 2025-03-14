<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <div class="shopping-cart">
            <div class="px-4 px-lg-0">
                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">Tên Khóa Học</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Giá Tiền</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Số Lượng</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Xóa</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${sessionScope.cart}" var="item">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="p-2">
                                                            <img src="${item.image}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0"> 
                                                                    <a href="#" class="text-dark d-inline-block">${item.name}</a>
                                                                </h5>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="align-middle">
                                                        <strong>
                                                            <fmt:formatNumber value="${item.price}" type="number" groupingUsed="true" maxFractionDigits="0"/>đ
                                                        </strong>
                                                    </td>
                                                    <td class="align-middle">
                                                        <a href="cart?action=decrease&pid=${item.id}">
                                                            <button class="btn btn-sm btn-outline-secondary">-</button>
                                                        </a>
                                                        <strong>${item.quantity}</strong>
                                                        <a href="cart?action=increase&pid=${item.id}">
                                                            <button class="btn btn-sm btn-outline-secondary">+</button>
                                                        </a>
                                                    </td>
                                                    <td class="align-middle">
                                                        <a href="cart?action=remove&pid=${item.id}" class="text-dark">
                                                            <button type="button" class="btn btn-danger btn-sm">Delete</button>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Tổng Số Tiền</div>
                                <div class="p-4">
                                    <ul class="list-unstyled mb-4">
                                        <li class="d-flex justify-content-between py-3 border-bottom">
                                            <strong class="text-muted">Tổng Số Lượng Khóa Học</strong>
                                            <strong>
                                                <fmt:formatNumber value="${sessionScope.totalAmount}" type="number" groupingUsed="true" maxFractionDigits="0"/>đ
                                            </strong>
                                        </li>
                                        <li class="d-flex justify-content-between py-3 border-bottom">
                                            <strong class="text-muted">VAT Tax</strong>
                                            <strong>
                                                <fmt:formatNumber value="${sessionScope.vatAmount}" type="number" groupingUsed="true" maxFractionDigits="0"/>đ
                                            </strong>
                                        </li>
                                        <li class="d-flex justify-content-between py-3 border-bottom">
                                            <strong class="text-muted">Tổng Thanh Toán</strong>
                                            <h5 class="font-weight-bold">
                                                <fmt:formatNumber value="${sessionScope.totalPayment}" type="number" groupingUsed="true" maxFractionDigits="0"/>đ
                                            </h5>
                                        </li>
                                    </ul>
                                    <a href="checkout.jsp" class="btn btn-dark rounded-pill py-2 btn-block">Thanh Toán</a>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
    </body>
</html>