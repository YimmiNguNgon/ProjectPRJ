<%-- 
    Document   : billSuccess
    Created on : Oct 26, 2024, 11:12:44 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Submission Successful</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f2f5;
                margin: 0;
                padding: 20px;
                text-align: center;
            }
            .container {
                background-color: #fff;
                padding: 30px;
                margin: 0 auto;
                width: 50%;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            h1 {
                color: #4CAF50;
            }
            p {
                font-size: 18px;
                color: #333;
            }
            .button-container {
                margin-top: 20px;
            }
            .button-container a {
                text-decoration: none;
                background-color: #4CAF50;
                color: white;
                padding: 12px 24px;
                border-radius: 5px;
                font-size: 16px;
                transition: background-color 0.3s;
            }
            .button-container a:hover {
                background-color: #45a049;
            }
            .icon {
                font-size: 48px;
                color: #4CAF50;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="icon">✔️</div>
            <h1>Bill Submitted Successfully!</h1>
            <p>Thank you for your payment. Your bill has been successfully processed.</p>
            <p>You will receive a confirmation email shortly with the details of your transaction.</p>
            <div class="button-container">
                <a href="home">Return to Home</a>
                <a href="UserBillsServlet">View My Bills</a>
            </div>
        </div>
    </body>
</html>
