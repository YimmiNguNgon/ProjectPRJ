<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<style>
    /* CSS cho navbar */
    .navbar {
        background-color: #61E65E; /* Màu nền navbar */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Đổ bóng */
    }

    .navbar-brand {
        font-weight: bold;
        font-size: 1.5rem;
        color: #fff !important;
    }

    .navbar-nav .nav-item .nav-link {
        color: #fff !important;
        padding: 0.75rem 1.25rem;
        font-weight: 500;
        font-size: 1.1rem;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .navbar-nav .nav-item .nav-link:hover {
        background-color: #4bc94b;
        color: #fff;
    }

    .navbar-toggler {
        border: none;
    }

    .navbar-toggler-icon {
        background-color: #fff;
    }

    .form-inline .form-control {
        border-radius: 20px;
        border: none;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .form-inline .btn-number {
        border-radius: 50%;
        background-color: #007bff;
        color: white;
        border: none;
        padding: 0.5rem 0.75rem;
        transition: background-color 0.3s ease;
    }

    .form-inline .btn-number:hover {
        background-color: #0056b3;
    }

    .btn-success {
        border-radius: 20px;
        background-color: #28a745;
        border: none;
        transition: background-color 0.3s ease;
    }

    .btn-success:hover {
        background-color: #218838;
    }

    .badge {
        background-color: #ffc107;
        color: black;
    }

    /* CSS cho jumbotron */
    .jumbotron {
        background: #95EE93;
        color: white;
        padding: 2rem 1rem;
        border-radius: 5px;
        margin-top: 20px;
    }

    .jumbotron-heading {
        font-size: 3rem;
        font-weight: bold;
        letter-spacing: 2px;
    }
</style>
<nav class="navbar navbar-expand-md navbar-dark" style="background-color: #61E65E;">
                <div class="container"> <!-- Updated background color -->
                <a class="navbar-brand" href="home">ALL COURSE </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <form action="Search" method="post" class="form-inline my-2 my-lg-0" style="margin-left: 300px;">
                    <div class="input-group input-group-sm">
                        <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search Course">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary btn-number">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                    <a class="btn btn-success btn-sm ml-3" href="cart.jsp">
                        <i class="fa fa-shopping-cart"></i> Cart
                        <span class="badge badge-light">${sessionScope.cart.size()}</span>
                    </a>
                    <li class="nav-item">
                            <a class="nav-link" href="UserBillsServlet" style="color:#FFFFFF;">View Your Order</a>
                        </li>
                </form>
                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <c:if test="${sessionScope.acc.isAdmin == 1}">
                        <li class="nav-item">
                            <a class="nav-link" href="listaccount" style="color:#FFFFFF;">Manager Account</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="managerpro" style="color:#FFFFFF;">Manager Course</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ManagerBillServlet" style="color:#FFFFFF;">Manager Oder</a>
                        </li>

                        </c:if>
                        <c:if test="${sessionScope.acc != null}">
                            <li class="nav-item">
                                <a class="nav-link" href="" style="color:#FFFFFF;">Hello ${sessionScope.acc.user}</a>
                            </li>    
                            <li class="nav-item">
                                <a class="nav-link" href="logout" style="color:#FFFFFF;">Logout</a>
                            </li>    
                        </c:if>
                        <c:if test="${sessionScope.acc == null}">
                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">Login</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>

</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">HDH.CODE</h1>
    </div>
</section>
<!--end of menu-->
