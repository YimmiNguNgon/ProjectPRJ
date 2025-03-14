<%-- 
    Document   : left
    Created on : Oct 21, 2024, 9:32:06 AM
    Author     : Huy
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    
    .card {
        border-radius: 10px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* Hiệu ứng đổ bóng */
        overflow: hidden;
    }

    .card-header {
        font-weight: bold;
        letter-spacing: 1px;
    }

    .list-group-item {
        background-color: #f8f9fa;
        color: #333;
        transition: background-color 0.3s ease, color 0.3s ease; /* Hiệu ứng chuyển đổi */
        padding: 10px 15px; /* Thêm padding để rộng hơn */
        border: none;
    }

    .list-group-item a {
        color: inherit;
        text-decoration: none;
        font-weight: 500;
    }

    .list-group-item:hover, 
    .list-group-item.active {
        background-color: #007bff;
        color: white;
    }

    .card-body img {
        border-radius: 5px;
        margin-bottom: 15px;
        transition: transform 0.3s ease;
    }

    .card-body img:hover {
        transform: scale(1.05); /* Phóng to nhẹ khi hover */
    }

    .card-body .card-title {
        font-size: 1.25rem;
        margin-bottom: 10px;
        color: #343a40;
        font-weight: 600;
    }

    .card-body .bloc_left_price {
        font-size: 1.1rem;
        color: #28a745;
        font-weight: bold;
    }

    .card-body {
        padding: 15px;
    }
</style>

<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i>Mệnh Giá</div>
        <ul class="list-group category_block">
            <c:forEach items="${listC}" var="o">
                <li class="list-group-item text-white ${tag == o.gid ? "active":""}"><a href="genre?gid=${o.gid}">${o.gname}</a></li>
            </c:forEach>

        </ul>
    </div>
    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">Khóa Học Mới</div>
        <div class="card-body">
            <img class="img-fluid" src="${newest.image}" />
            <h5 class="card-title">${newest.name}</h5>
            <p class="bloc_left_price">
                <fmt:formatNumber value="${newest.price}" type="number" groupingUsed="true" maxFractionDigits="0"/>đ
            </p>
        </div>
    </div>
</div>
