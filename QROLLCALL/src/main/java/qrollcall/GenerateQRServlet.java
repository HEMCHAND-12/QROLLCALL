package qrollcall;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.zxing.*;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

@WebServlet("/GenerateQRServlet")
public class GenerateQRServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String table = request.getParameter("table");
        if (table == null || table.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing table parameter");
            return;
        }

        String ip = request.getLocalAddr();  
        String url = "http://" + ip + ":8081/QROLLCALL2/student_form.jsp?table=" + table;

        try {
            BitMatrix matrix = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, 300, 300);
            response.setContentType("image/png");
            MatrixToImageWriter.writeToStream(matrix, "PNG", response.getOutputStream());
        } catch (Exception e) {
            response.setContentType("text/plain");
            response.getWriter().println("QR Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
