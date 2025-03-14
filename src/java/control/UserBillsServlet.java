package control;

import dao.DAO;
import entity.Bill;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet for displaying bills for a specific user.
 */
public class UserBillsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the user ID from the request (e.g., from session or request parameter)
        Integer userId = (Integer) request.getSession().getAttribute("user_id");

//        int billId = ThreadLocalRandom.current().nextInt(100000, 999999);
        if (userId == null) {
            // Handle the case where the user is not logged in or the session has expired
            response.sendRedirect("login.jsp");
            return;
        }

        // Get the list of bills for the user
        DAO dao = new DAO();
        List<Bill> userBills = dao.getBillByUserId(userId);

        // Set the bills attribute to be accessed in the JSP
        request.setAttribute("userBills", userBills);

        // Forward the request to the JSP page
        request.getRequestDispatcher("userBills.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for displaying bills for a specific user";
    }
}
