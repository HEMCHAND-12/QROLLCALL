<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>QRollCall - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding-top: 100px;
            background-color: #f5f5f5;
        }
        h1 {
            color: #333;
        }
        .button-container {
            margin-top: 40px;
        }
        .btn {
            padding: 12px 30px;
            margin: 20px;
            font-size: 16px;
            border: none;
            background-color: #007BFF;
            color: white;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Welcome to QRollCall</h1>
    <div class="button-container">
        <form action="create_attendance.jsp">
            <button class="btn" type="submit">Take Attendance</button>
        </form>
        <form action="view_history.jsp">
            <button class="btn" type="submit">View History</button>
        </form>
    </div>
</body>
</html>
