<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    String table = request.getParameter("table");
%>
<!DOCTYPE html>
<html>
<head>
    <title>QR Code</title>
    <meta http-equiv="refresh" content="30">
</head>
<body><center>
    <h1>QR Code for Attendance (refreshes every 30 seconds)</h1>
    <img src="GenerateQRServlet?table=<%=table%>" width="300" height="300" />
    <br><br>
    <a href="create_attendance.jsp">Back</a></center>
</body>
</html>
