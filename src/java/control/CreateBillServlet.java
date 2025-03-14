/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.concurrent.ThreadLocalRandom;

/**
 *
 * @author ADMIN
 */
public class CreateBillServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateBillServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateBillServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String totalStr = request.getParameter("total");

        totalStr = totalStr.replace(".", "").replace(",", "");
        double total = Double.parseDouble(totalStr);

        String name = request.getParameter("name");

        String address = request.getParameter("address");

        String payment = request.getParameter("payment");

        String date = request.getParameter("date");

        String phone = request.getParameter("phone");

        String status = "Process";

        // Get the userId from the session
        Integer userId = (Integer) request.getSession().getAttribute("user_id");

//        int billId = ThreadLocalRandom.current().nextInt(100000, 999999);
        if (userId == null) {
            // Handle the case where the user is not logged in or the session has expired
            response.sendRedirect("login.jsp");
            return;
        }

        // Create a new DAO instance and call the createBill method
        DAO dao = new DAO();
        dao.createBill(userId, total, name, address, payment, date, phone, status);
        dao.clearCart(userId);
        // Redirect to a success page or display a success message
        response.sendRedirect("billSuccess.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
