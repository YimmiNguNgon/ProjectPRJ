<%-- 
    Document   : checkout
    Created on : Oct 26, 2024, 10:28:32 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
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
            .form-container {
                width: 60%;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            label {
                font-weight: bold;
                margin-top: 10px;
                display: block;
            }
            input[type="text"], input[type="date"], input[type="tel"], select {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 12px 20px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
                width: 100%;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            .readonly-input {
                background-color: #f2f2f2;
            }
            .form-group {
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <h1>Bill Checkout</h1>
        <div class="form-container">
            <form action="CreateBillServlet" method="post"> 
                <div class="form-group">
                    <!-- Field for total -->
                    <label for="total">Total Amount:</label>
                    <fmt:formatNumber value="${sessionScope.totalPayment}" var="formattedTotal" pattern="#,###.###"/>
                    <input type="text" name="total" id="total" value="${formattedTotal}" readonly="true" class="readonly-input">
                </div>
                
                <div class="form-group">
                    <!-- Field for name -->
                    <label for="name">Name:</label>
                    <input type="text" name="name" id="name" required>
                </div>

                <div class="form-group">
                    <!-- Field for address -->
                    <label for="address">Address:</label>
                    <input type="text" name="address" id="address" required>
                </div>

                <div class="form-group">
                    <!-- Field for payment -->
                    <label for="payment">Payment Method:</label>
                    <select name="payment" id="payment" required>
                        <option value="Credit Card">Credit Card</option>
                        <option value="Debit Card">Debit Card</option>
                        <option value="PayPal">PayPal</option>
                        <option value="Cash on Delivery">Cash on Delivery</option>
                    </select>
                </div>

                <div class="form-group">
                    <!-- Field for date -->
                    <label for="date">Date:</label>
                    <input type="date" name="date" id="date" required>
                </div>

                <div class="form-group">
                    <!-- Field for phone -->
                    <label for="phone">Phone:</label>
                    <input type="tel" name="phone" id="phone" required pattern="[0-9]{10}">
                </div>

                <!-- Submit button -->
                <input type="submit" value="Submit Bill">
            </form>
        </div>
    </body>
</html>
