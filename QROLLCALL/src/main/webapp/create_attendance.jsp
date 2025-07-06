<!DOCTYPE html>
<html>
<head>
  <title>Create Attendance</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #eef1f5;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    form {
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    input[type="text"], input[type="datetime-local"] {
      width: 100%;
      padding: 10px;
      margin-top: 8px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    input[type="submit"] {
      width: 100%;
      padding: 10px;
      background-color: #007bff;
      color: white;
      font-weight: bold;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    input[type="submit"]:hover {
      background-color: #0069d9;
    }
  </style>
</head>
<body>
  <form method="post" action="CreateAttendanceServlet">
    <h2>Create Attendance</h2>
    Class Name: <input type="text" name="classname" required>
    Date & Time: <input type="datetime-local" name="datetime" required>
    <input type="submit" value="Generate QR">
  </form>
</body>
</html>
