<%-- 
    Document   : footer
    Created on : Oct 19, 2024, 10:16:06 AM
    Author     : Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            footer {
                background-color: #61E65E; /* Màu xám than */
                padding: 30px 0;
            }
            footer p, footer ul {
                color: #f8f9fa; /* Màu trắng nhạt */
                 font-size: 1.1em;
            }
            footer ul li a {
                color: #17a2b8; /* Màu xanh nhẹ */
                text-decoration: none;
                font-size: 1.1em;
            }
            footer ul li a:hover {
                color: #007bff; /* Màu xanh sáng khi hover */
                text-decoration: underline;
            }
        </style>
    </head>
    <footer class="py-5">
        <div class="row">
            <div class="container col-md-3">
                <p class="m-0 text-center">Copyright &copy; Your Website 2024</p>
                <ul class="m-0 text-center" style="list-style-type: none; padding: 0;">
                    <li><a href="https://www.facebook.com/DvFB.HuyDucHa.no1">Facebook</a></li>
                    <li><a href="#">YouTube</a></li>
                    <li><a href="#">Twitter</a></li>
                </ul>
            </div>
            <div class="container col-md-3">
                <p class="m-0 text-center">Contact</p>
                <ul class="m-0 text-center" style="list-style-type: none; padding: 0;">
                    <li>HaDucHuy</li>
                    <li>Hahuy3011@gmail.com</li>
                    <li>+84 336143011</li>
                </ul>
            </div>
        </div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</html>