package qrollcall;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.google.zxing.*;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

import java.nio.file.*;

@WebServlet("/CreateAttendanceServlet")
public class CreateAttendanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            
            String className = request.getParameter("classname").replaceAll("\\s+", "_").toLowerCase();
            String datetimeInput = request.getParameter("datetime"); // e.g., 2025-07-06T11:28

            
            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            LocalDateTime dt = LocalDateTime.parse(datetimeInput, inputFormatter);

           
            DateTimeFormatter tableFormatter = DateTimeFormatter.ofPattern("yyyyMMdd_HHmm");
            String formattedDT = dt.format(tableFormatter);

         
            String tableName = "att_" + className + "_" + formattedDT;

            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/qrollcall", "root", "0812");

            String sql = "CREATE TABLE `" + tableName + "` (roll_no VARCHAR(20), name VARCHAR(100))";
            con.createStatement().executeUpdate(sql);


            String ipAddress = "192.168.29.201";
            String qrContent = "http://" + ipAddress + ":8081/QROLLCALL2/student_form.jsp?table=" + tableName;

            
            String qrFileName = tableName + ".png";
            String qrFolderPath = getServletContext().getRealPath("/QR");

            File qrFolder = new File(qrFolderPath);
            if (!qrFolder.exists()) qrFolder.mkdirs();

            String qrFullPath = qrFolderPath + File.separator + qrFileName;
            generateQRCode(qrContent, qrFullPath);

            
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>QR Code</title></head><body>");
            out.println("<center><h2>QR Code Generated for Attendance</h2></center>");
            out.println("<center><img src='QR/" + qrFileName + "' width='300' height='300'></center><br><br>");
            out.println("<center><a href='create_attendance.jsp'>Back</a></center>");
            out.println("</body></html>");

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h2 style='color:red;'>Error Occurred:</h2><pre>");
            e.printStackTrace(out);
            out.println("</pre>");
        }
    }

    private void generateQRCode(String data, String path) throws Exception {
        BitMatrix matrix = new MultiFormatWriter().encode(data, BarcodeFormat.QR_CODE, 300, 300);
        MatrixToImageWriter.writeToPath(matrix, "PNG", Paths.get(path));
    }
}
