<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Welcome Email</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .email-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            max-width: 600px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .header {
            text-align: center;
            background-color: #4CAF50;
            padding: 20px;
            border-radius: 10px 10px 0 0;
            color: white;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        .content {
            padding: 20px;
            color: #333;
        }

        .content h2 {
            color: #4CAF50;
        }

        .footer {
            padding: 10px;
            text-align: center;
            font-size: 12px;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <div class="header">
            <h1>Welcome to Our Platform!</h1>
        </div>
        <div class="content">
            <h2>Hello, <span th:text="${name}">User</span>!</h2>
            <p>Thanks for signing up. We're thrilled to have you on board!</p>
            <p>If you have any questions, feel free to reach out at any time.</p>
            <p>Best regards,<br/>The Team</p>
        </div>
        <div class="footer">
            &copy; 2025 Our Company. All rights reserved.
        </div>
    </div>
</body>
</html>
