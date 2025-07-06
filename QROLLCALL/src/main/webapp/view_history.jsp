<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            background-color: #f0f0f0;
        }
        h1 {
            text-align: center;
        }
        table {
            margin: auto;
            border-collapse: collapse;
            width: 80%;
            background-color: white;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
        a {
            color: #007BFF;
            text-decoration: none;
        }
    </style>
</head>
<body>
<h1>Attendance History</h1>
<table>
    <tr>
        <th>#</th>
        <th>Table Name</th>
        <th>View</th>
    </tr>
<%
    int count = 1;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/qrollcall", "root", "0812");
        Statement stmt = conn.createStatement();

        // Query to fetch only attendance tables
        String showTables = "SHOW TABLES LIKE 'att\\_%'";
        ResultSet rs = stmt.executeQuery(showTables);

        List<String> tables = new ArrayList<>();
        while (rs.next()) {
            tables.add(rs.getString(1));
        }

        // Sort in reverse (latest first)
        Collections.sort(tables, Collections.reverseOrder());

        for (String table : tables) {
%>
    <tr>
        <td><%= count++ %></td>
        <td><%= table %></td>
        <td><a href="view_table.jsp?table=<%=table%>">View Entries</a></td>
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
<br><center><a href="home.jsp">Back to Home</a></center>
</body>
</html>
