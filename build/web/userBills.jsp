<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="entity.Bill"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Bills</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
            font-size: 24px;
        }

        .bills-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
        }

        .bills-table th {
            background-color: #3498db;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: 500;
        }

        .bills-table td {
            padding: 12px;
            border-bottom: 1px solid #eee;
        }

        .bills-table tr:hover {
            background-color: #f8f9fa;
        }

        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
        }

        .status-pending {
            background-color: #ffeeba;
            color: #856404;
        }

        .status-completed {
            background-color: #d4edda;
            color: #155724;
        }

        .status-cancelled {
            background-color: #f8d7da;
            color: #721c24;
        }

        .payment-icon {
            margin-right: 5px;
        }

        .empty-message {
            text-align: center;
            padding: 40px;
            color: #6c757d;
        }

        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            .bills-table {
                display: block;
                overflow-x: auto;
            }

            .bills-table th,
            .bills-table td {
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-file-invoice"></i> Bills for User</h1>
        
        <c:choose>
            <c:when test="${empty userBills}">
                <div class="empty-message">
                    <i class="fas fa-inbox fa-3x"></i>
                    <p>No bills found</p>
                </div>
            </c:when>
            <c:otherwise>
                <table class="bills-table">
                    <thead>
                        <tr>
                            <th>Bill ID</th>
                            <th>Total</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Payment</th>
                            <th>Date</th>
                            <th>Phone</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="bill" items="${userBills}">
                            <tr>
                                <td>#${bill.billId}</td>
                                <td>$${bill.total}</td>
                                <td>${bill.name}</td>
                                <td>${bill.address}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${bill.payment eq 'Credit Card'}">
                                            <i class="fas fa-credit-card payment-icon"></i>
                                        </c:when>
                                        <c:when test="${bill.payment eq 'Cash'}">
                                            <i class="fas fa-money-bill payment-icon"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fas fa-wallet payment-icon"></i>
                                        </c:otherwise>
                                    </c:choose>
                                    ${bill.payment}
                                </td>
                                <td>${bill.date}</td>
                                <td>${bill.phone}</td>
                                <td>
                                    <span class="status-badge status-${bill.status.toLowerCase()}">
                                        ${bill.status}
                                    </span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>