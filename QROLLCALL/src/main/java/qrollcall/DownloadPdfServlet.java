package qrollcall;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

@WebServlet("/DownloadPdfServlet")
public class DownloadPdfServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String table = request.getParameter("table");

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + table + ".pdf\"");

        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/qrollcall", "root", "0812");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT roll_no, name FROM `" + table + "`");

            
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

           
            Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
            Paragraph title = new Paragraph("Attendance Report: " + table, titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            title.setSpacingAfter(20);
            document.add(title);

            
            PdfPTable pdfTable = new PdfPTable(3); // #, Roll, Name
            pdfTable.setWidthPercentage(100);
            pdfTable.setWidths(new float[]{1, 3, 5});

            pdfTable.addCell("S.No");
            pdfTable.addCell("Roll No");
            pdfTable.addCell("Name");

            int count = 1;
            while (rs.next()) {
                pdfTable.addCell(String.valueOf(count++));
                pdfTable.addCell(rs.getString("roll_no"));
                pdfTable.addCell(rs.getString("name"));
            }

            document.add(pdfTable);
            document.close();

            conn.close();
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.println("Error: " + e.getMessage());
        }
    }
}
