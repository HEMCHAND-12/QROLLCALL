package pdfgen;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/edudoc";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "0812";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String checkSql = "SELECT * FROM users WHERE username=?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setString(1, user);
            ResultSet rs = checkStmt.executeQuery();

            PrintWriter out = response.getWriter();
            response.setContentType("text/html");

            if (rs.next()) {
                out.println("<h3>Username already exists. Try another.</h3><a href='register.jsp'>Back to Register</a>");
            } else {
                String insertSql = "INSERT INTO users (username, password) VALUES (?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertSql);
                insertStmt.setString(1, user);
                insertStmt.setString(2, pass);
                insertStmt.executeUpdate();

                out.println("<h3>✅ Registered successfully!</h3><a href='login.jsp'>Login Now</a>");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
