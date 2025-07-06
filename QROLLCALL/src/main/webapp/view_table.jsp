<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            background-color: #f9f9f9;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            margin: auto;
            border-collapse: collapse;
            width: 70%;
            background-color: #fff;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
        .button {
            display: inline-block;
            margin: 20px 10px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            border: none;
            font-size: 14px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .button-container {
            text-align: center;
        }
    </style>
</head>
<body>
<%
    String table = request.getParameter("table");
%>
<h1>Attendance Data: <%= table %></h1>

<table>
    <tr>
        <th>#</th>
        <th>Roll Number</th>
        <th>Name</th>
    </tr>
<%
    int count = 1;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/qrollcall", "root", "0812");
        Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery("SELECT roll_no, name FROM `" + table + "`");

        while (rs.next()) {
%>
    <tr>
        <td><%= count++ %></td>
        <td><%= rs.getString("roll_no") %></td>
        <td><%= rs.getString("name") %></td>
    </tr>
<%
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>");
    }
%>
</table>

<div class="button-container">
    <form method="get" action="DownloadPdfServlet" style="display:inline;">
        <input type="hidden" name="table" value="<%=table%>">
        <button class="button" type="submit">Download PDF</button>
    </form>

    <a href="view_history.jsp" class="button">Back to History</a>
</div>
</body>
</html>
