<%-- 
    Document   : managerbill
    Created on : Oct 26, 2024, 11:27:06 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="entity.Bill"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Management</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f2f5;
                margin: 0;
                padding: 20px;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            .table-container {
                width: 90%;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                text-align: left;
                padding: 12px;
            }
            th {
                background-color: #4CAF50;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            .action-form {
                display: flex;
                gap: 8px;
            }
            select {
                padding: 4px;
                border-radius: 4px;
                border: 1px solid #ccc;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 6px 12px;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <h1>Bill Management</h1>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Bill ID</th>
                        <th>User ID</th>
                        <th>Total</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Payment</th>
                        <th>Date</th>
                        <th>Phone</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="bill" items="${bills}">
                        <tr>
                            <td>${bill.billId}</td>
                            <td>${bill.userId}</td>
                            <td>${bill.total}</td>
                            <td>${bill.name}</td>
                            <td>${bill.address}</td>
                            <td>${bill.payment}</td>
                            <td>${bill.date}</td>
                            <td>${bill.phone}</td>
                            <td>${bill.status}</td>
                            <td>
                                <form action="UpdateBillStatusServlet" method="post" class="action-form">
                                    <input type="hidden" name="billId" value="${bill.billId}">
                                    <select name="newStatus">
                                        <option value="Pending" <c:if test="${bill.status == 'Pending'}">selected</c:if>>Pending</option>
                                        <option value="Paid" <c:if test="${bill.status == 'Paid'}">selected</c:if>>Paid</option>
                                        <option value="Cancelled" <c:if test="${bill.status == 'Cancelled'}">selected</c:if>>Cancelled</option>
                                    </select>
                                    <input type="submit" value="Update">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
