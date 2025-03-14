package control;

import dao.DAO;
import entity.CartItem;
import entity.Course;
import entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        int pid = Integer.parseInt(request.getParameter("pid"));
        String courseId = request.getParameter("pid");
        DAO dao = new DAO();

        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart");
        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }

        switch (action) {
            case "add":
                Course courses = dao.getCourseID(courseId);
                boolean itemExists = false;

                for (CartItem item : cartItems) {
                    if (item.getId() == pid) {
                        item.setQuantity(item.getQuantity() + 1);
                        itemExists = true;
                        break;
                    }
                }

                if (!itemExists) {
                    CartItem newItem = new CartItem();
                    newItem.setId(courses.getId());
                    newItem.setName(courses.getName());
                    newItem.setImage(courses.getImage());
                    newItem.setPrice(courses.getPrice());
                    newItem.setQuantity(1);
                    cartItems.add(newItem);
                }

                session.setAttribute("cart", cartItems);
                response.sendRedirect("cart.jsp");
                break;

            case "remove":
                cartItems.removeIf(item -> item.getId() == pid);
                session.setAttribute("cart", cartItems);
                response.sendRedirect("cart.jsp");
                break;

            case "increase":
                for (CartItem item : cartItems) {
                    if (item.getId() == pid) {
                        item.setQuantity(item.getQuantity() + 1);
                        break;
                    }
                }
                session.setAttribute("cart", cartItems);
                response.sendRedirect("cart.jsp");
                break;

            case "decrease":
                for (CartItem item : cartItems) {
                    if (item.getId() == pid) {
                        if (item.getQuantity() > 1) {
                            item.setQuantity(item.getQuantity() - 1);
                        } else {
                            cartItems.remove(item);
                        }
                        break;
                    }
                }
                session.setAttribute("cart", cartItems);
                response.sendRedirect("cart.jsp");
                break;

            default:
                response.sendRedirect("home");
                break;
        }

        // Tính tổng số tiền, VAT và tổng thanh toán
        double totalAmount = 0;
        for (CartItem item : cartItems) {
            totalAmount += item.getPrice() * item.getQuantity();
        }

        // Tính VAT (giả sử 10%)
        double vatAmount = totalAmount * 0.10;

        // Tính tổng tiền thanh toán
        double totalPayment = totalAmount + vatAmount;

        // Lưu các giá trị vào session để chuyển sang JSP
        session.setAttribute("totalAmount", totalAmount);
        session.setAttribute("vatAmount", vatAmount);
        session.setAttribute("totalPayment", totalPayment);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
