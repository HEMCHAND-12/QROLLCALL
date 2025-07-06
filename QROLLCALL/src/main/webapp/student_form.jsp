<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Attendance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 500px;
            margin: auto;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            margin-top: 20px;
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <h2>Submit Attendance</h2>

    <form id="attendanceForm" method="post" action="SubmitAttendanceServlet">
        Roll Number:
        <input type="text" name="rollno" required placeholder="Enter Roll Number">
        Name:
        <input type="text" name="name" required placeholder="Enter Name">
        <input type="hidden" name="table" value="<%= request.getParameter("table") %>">
        <input type="submit" value="Submit Attendance">
    </form>

    <script>
        document.getElementById("attendanceForm").onsubmit = function(e) {
            var rollno = document.querySelector('input[name="rollno"]').value.trim();
            var name = document.querySelector('input[name="name"]').value.trim();
            var confirmed = confirm("Please confirm your details:\n\nRoll No: " + rollno + "\nName: " + name);
            if (!confirmed) e.preventDefault();
        };
    </script>

</body>
</html>
