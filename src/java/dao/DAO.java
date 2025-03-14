/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static com.oracle.wls.shaded.org.apache.xalan.lib.ExsltDatetime.date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import context.DBContext;
import entity.Account;
import entity.Bill;
import entity.CartItem;
import entity.Denomination;
import entity.Course;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.swing.ListCellRenderer;

/**
 *
 * @author ADMIN
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Course> getAllCourse() {
        List<Course> list = new ArrayList<>();
        String query = "select * from Course";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Course> getCourseDenomination(String id) {
        List<Course> list = new ArrayList<>();
        String query = "select * from Course M\n"
                + "join Course_Genre MG on M.Course_id=MG.Course_id\n"
                + "where MG.genre_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void changePassword(String username, String password) {
        String query = "update Account set password= ? WHERE username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Course> searchByName(String txtSearch) {
        List<Course> list = new ArrayList<>();
        String query = "select * from Course \n"
                + "where [name] like ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Course getCourseID(String id) {
        String query = "select * from Course\n"
                + "where course_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public Account getAccountID(String id) {
        String query = "select * from Account\n"
                + "where user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    
    
    public List<Denomination> getAllDenomination() {
        List<Denomination> list = new ArrayList<>();
        String query = "select * from Genre";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Denomination(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query = "select * from Account";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    
    public Account login(String user, String pass) {
        String query = "select * from Account\n"
                + "where username = ?\n"
                + "and password = ? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkAccountExist(String user) {
        String query = "select * from Account\n"
                + "where username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signup(String user, String pass) {
        String query = "insert into Account\n"
                + "values(?,?,0)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleteAccount(String id) {
        String query = "delete from Account where user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCourse(String did) {
        String query2 = "delete from Course where Course_id = ?";
        String query1 = "delete from Course_Genre where Course_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query1);
            ps.setString(1, did);
            ps.executeUpdate();

            ps = conn.prepareStatement(query2);
            ps.setString(1, did);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void insertAcc(int id, String user, String pass, int isAdmin) {
        
        String query = "INSERT INTO Account (id, username, password, isAdmin) VALUES (?, ?, ?, ?)";

        try {
            conn = new DBContext().getConnection();

            // Chuẩn bị câu lệnh chèn dữ liệu vào bảng Account
            ps = conn.prepareStatement(query);
            ps.setInt(1, id); // Gán giá trị cho cột id
            ps.setString(2, user); // Gán giá trị cho cột username
            ps.setString(3, pass); // Gán giá trị cho cột password
            ps.setInt(4, isAdmin); // Gán giá trị cho cột isAdmin (1 cho admin, 0 cho user thông thường)

            // Thực thi câu lệnh
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace(); // In lỗi để dễ dàng debug
        } finally {
            try {
                // Đóng các kết nối nếu chúng đã được mở
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    public void insertPro(String name, String image, String price, String description, String[] genres) {
    // Đúng với số lượng cột và giá trị
        String query1 = "INSERT INTO Course (name, image_url, price, description) VALUES (?, ?, ?, ?)";
        String query2 = "INSERT INTO Course_Genre (Course_id, genre_id) VALUES (?, ?)";

        try {
            conn = new DBContext().getConnection();

            // Chuẩn bị câu lệnh cho bảng Course
            ps = conn.prepareStatement(query1, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setInt(3, Integer.parseInt(price)); // Kiểm tra chắc chắn cột price là INT
            ps.setString(4, description);
            ps.executeUpdate();

            // Lấy ID tự động tăng của Course vừa được thêm
            rs = ps.getGeneratedKeys();
            int courseId = 0;
            if (rs.next()) {
                courseId = rs.getInt(1); // Lấy ID tự tăng từ kết quả
            }

            // Nếu có các thể loại (genres) được chọn
            if (genres != null && genres.length > 0) {
                ps = conn.prepareStatement(query2);
                for (String genreId : genres) {
                    ps.setInt(1, courseId); // Gán Course_id
                    ps.setInt(2, Integer.parseInt(genreId)); // Gán genre_id
                    ps.addBatch(); // Thêm vào batch
                }
                ps.executeBatch(); // Thực hiện batch insert
            }

        } catch (Exception e) {
            e.printStackTrace(); // In lỗi để dễ dàng debug
        } finally {
            try {
                // Đóng các kết nối nếu chúng đã được mở
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    public int getTotalCourse() {
        String query = "select count(*) from Course";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Course> pagingCourse(int index) {
        List<Course> list = new ArrayList<>();
        String query = "select * from Course \n"
                + "order by Course_id \n"
                + "offset ? rows fetch next 6 rows only";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 6);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalAccount() {
        String query = "select count(*) from Account";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Account> pagingAcount(int index) {
        List<Account> list = new ArrayList<>();
        String query = "select * from Account \n"
                + "order by user_id \n"
                + "offset ? rows fetch next 3 rows only";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 3);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void editPro(String pid, String name, String image, String price, String description, String[] genres) {
    // Thêm `price` vào câu lệnh UPDATE
        String query1 = "UPDATE Course SET name=?, image_url=?, price=?, description=? WHERE Course_id=?";
        String query2 = "DELETE FROM Course_Genre WHERE Course_id=?";
        String query3 = "INSERT INTO Course_Genre (Course_id, genre_id) VALUES (?, ?)";

        try {
            conn = new DBContext().getConnection();

            // Chuẩn bị câu lệnh UPDATE
            ps = conn.prepareStatement(query1);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setInt(3, Integer.parseInt(price)); // Giá trị của cột price
            ps.setString(4, description);
            ps.setString(5, pid); // Đúng vị trí cho Course_id
            ps.executeUpdate();

            // Xóa các thể loại (genres) hiện có liên kết với Course
            ps = conn.prepareStatement(query2);
            ps.setString(1, pid);
            ps.executeUpdate();

            // Thêm lại các thể loại mới nếu có
            if (genres != null && genres.length > 0) {
                ps = conn.prepareStatement(query3);
                for (String genreId : genres) {
                    ps.setString(1, pid); // Gán Course_id
                    ps.setInt(2, Integer.parseInt(genreId)); // Gán genre_id
                    ps.addBatch(); // Thêm vào batch
                }
                ps.executeBatch(); // Thực hiện batch insert
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra để dễ debug
        } finally {
            try {
                // Đóng các kết nối nếu mở
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
}

    public Course getNewest() {
        String query = "select top 1 * from Course\n"
                + "order by Course_id desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public void addToCart(int userId, int courseId) {
        int quantity = 1;

        try {
            conn = new DBContext().getConnection();
            String sql = "SELECT quantity FROM Cart WHERE user_id = ? AND course_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, courseId);
            rs = ps.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity") + 1;
                sql = "UPDATE Cart SET quantity = ? WHERE user_id = ? AND course_id = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, quantity);
                ps.setInt(2, userId);
                ps.setInt(3, courseId);
                ps.executeUpdate();
            } else {
                sql = "INSERT INTO Cart (user_id, course_id, quantity) VALUES (?, ?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setInt(2, courseId);
                ps.setInt(3, quantity);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateCart(int userId, int courseId, String action) {
        int quantity = 0;

        try {
            conn = new DBContext().getConnection();
            String sql = "SELECT quantity FROM Cart WHERE user_id = ? AND course_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, courseId);
            rs = ps.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
                if ("increase".equals(action)) {
                    quantity++;
                } else if ("decrease".equals(action)) {
                    quantity--;
                }

                if (quantity > 0) {
                    sql = "UPDATE Cart SET quantity = ? WHERE user_id = ? AND course_id = ?";
                    ps = conn.prepareStatement(sql);
                    ps.setInt(1, quantity);
                    ps.setInt(2, userId);
                    ps.setInt(3, courseId);
                    ps.executeUpdate();
                } else {
                    removeFromCart(userId, courseId);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<CartItem> getCartItems(int userId) {
        List<CartItem> cartItems = new ArrayList<>();

        try {
            conn = new DBContext().getConnection();
            String sql = "SELECT c.course_id, m.name, m.image_url, m.price, c.quantity "
                    + "FROM Cart c JOIN Course m ON c.course_id = m.course_id "
                    + "WHERE c.user_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                int courseId = rs.getInt("course_id");
                String name = rs.getString("name");
                String imageUrl = rs.getString("image_url");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");

                CartItem item = new CartItem(courseId, name, imageUrl, price, quantity);
                cartItems.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cartItems;
    }
    
    public void removeFromCart(int userId, int courseId) {

        try {
            conn = new DBContext().getConnection();
            String sql = "DELETE FROM Cart WHERE user_id = ? AND course_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, courseId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void createBill(int userId, double total, String name, String address, String payment, String date, String phone, String status) {
        String query = "INSERT INTO Bill (user_id, total, name, address, payment, date, phone, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId); // Set the user_id
            ps.setDouble(2, total); // Set the total amount
            ps.setString(3, name); // Set the name
            ps.setString(4, address); // Set the address
            ps.setString(5, payment); // Set the payment method
            ps.setString(6, date); // Set the date
            ps.setString(7, phone); // Set the phone number
            ps.setString(8, status); // Set the status
            ps.executeUpdate(); // Execute the insert statement
        } catch (Exception e) {
            e.printStackTrace(); // Print the error for debugging
        } finally {
            try {
                // Close the resources if they were opened
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    public void clearCart(int userId) {
        String query = "DELETE FROM Cart WHERE user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // Print the error for debugging
        } finally {
            try {
                // Close the resources if they were opened
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    public void addOrder(Account a, CartItem item, String address, String payment, int phone) {
    try {
            conn = new DBContext().getConnection();
            double totalMoney = item.getPrice() * item.getQuantity(); // Calculate total for the single CartItem
            String date = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

            // Insert into bill table
            String query = "INSERT INTO [bill] (user_id, total_money, payment, address, date, phone) VALUES (?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setInt(1, a.getId());
            ps.setDouble(2, totalMoney);
            ps.setString(3, payment);
            ps.setString(4, address);
            ps.setString(5, date);
            ps.setInt(6, phone);
            ps.executeUpdate();

            // Retrieve the last inserted bill_id
            String query1 = "SELECT TOP 1 bill_id FROM [bill] ORDER BY bill_id DESC";
            ps = conn.prepareStatement(query1);
            rs = ps.executeQuery();

            if (rs.next()) {
                int bill_id = rs.getInt(1);

                // Insert into bill_detail table for the single item
                String sql2 = "INSERT INTO [bill_detail] (bill_id, product_id, quantity, total) VALUES (?, ?, ?, ?)";
                ps = conn.prepareStatement(sql2);
                ps.setInt(1, bill_id);
                ps.setInt(2, item.getId());  // Using item id as product_id
                ps.setInt(3, item.getQuantity());
                ps.setDouble(4, totalMoney); // Use the previously calculated total
                ps.executeUpdate();
            }
            } catch (Exception e) {
                e.printStackTrace();
            }
    }
    public List<Bill> getAllBill() {
        List<Bill> list = new ArrayList<>();
        String query = "SELECT * FROM Bill";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(
                        rs.getInt("bill_id"),
                        rs.getInt("user_id"),
                        rs.getDouble("total"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("payment"),
                        rs.getString("date"),
                        rs.getString("phone"),
                        rs.getString("status")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print the error for debugging
        } finally {
            try {
                // Close the resources if they were opened
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public void updateStatusBill(int billId, String newStatus) {
        String query = "UPDATE Bill SET status = ? WHERE bill_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newStatus); // Set the new status
            ps.setInt(2, billId); // Set the bill_id
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // Print the error for debugging
        } finally {
            try {
                // Close the resources if they were opened
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public List<Bill> getBillByUserId(int userId) {
        List<Bill> list = new ArrayList<>();
        String query = "SELECT * FROM Bill WHERE user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId); // Set the user_id parameter
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(
                        rs.getInt("bill_id"),
                        rs.getInt("user_id"),
                        rs.getDouble("total"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("payment"),
                        rs.getString("date"),
                        rs.getString("phone"),
                        rs.getString("status")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Print the error for debugging
        } finally {
            try {
                // Close the resources if they were opened
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public static void main(String[] args) {
        DAO sd = new DAO();
        List<Account> li = sd.getAllAccount();
        System.out.println(li);
    }

}
    
    

    
 
