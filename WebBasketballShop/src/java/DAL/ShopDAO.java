/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.BillDetail;
import model.Category;
import model.Product;
import model.Size;

/**
 *
 * @author Duc Tran
 */
public class ShopDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select * from product";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("product_price"));
                p.setDescribe(rs.getString("product_describe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImg(rs.getString("product_img"));
                products.add(p);
            }
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> categorys = new ArrayList<>();
        String sql = "select * from Category";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("category_id"));
                c.setName(rs.getString("category_name"));
                categorys.add(c);
            }
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categorys;
    }

    public ArrayList<Product> getTrend() {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select top 5 * from product \n"
                + "order by quantity asc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("product_price"));
                p.setDescribe(rs.getString("product_describe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImg(rs.getString("product_img"));
                products.add(p);
            }
        } catch (Exception e) {
        }
        return products;
    }

    public ArrayList<Product> getProductCateId(String id) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select * from product \n"
                + "where category_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("product_price"));
                p.setDescribe(rs.getString("product_describe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImg(rs.getString("product_img"));
                products.add(p);
            }
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public Product getProductId(String id) {
        String sql = "select * from product \n"
                + "where product_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getString(1), rs.getString(3),
                        rs.getDouble(4), rs.getString(5),
                        rs.getInt(6), rs.getString(7));
            }
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Size> getProductSizeId(String id) {
        ArrayList<Size> sizes = new ArrayList<>();
        String sql = "select * from product_size\n"
                + "where product_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Size s = new Size();
                s.setId(rs.getString("product_id"));
                s.setSize(rs.getString("size"));
                sizes.add(s);
            }
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sizes;
    }

    public ArrayList<Product> searchName(String txtSearch) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select * from product\n"
                + "where [product_name] like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("product_price"));
                p.setDescribe(rs.getString("product_describe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImg(rs.getString("product_img"));
                products.add(p);
            }
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public Account login(String user, String pass) {
        String sql = "select * from users\n"
                + "where [user_name] = ?\n"
                + "and [user_pass] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkAccount(String user) {
        String sql = "select * from users\n"
                + "where [user_name] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signup(String user, String email, String pass) {
        String sql = "insert into [users]\n"
                + "values (?,?,?,'FALSE')";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Product> getArrangePriceDesc() {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product\n"
                + "order by product_price desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("product_price"));
                p.setDescribe(rs.getString("product_describe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImg(rs.getString("product_img"));
                products.add(p);
            }
        } catch (Exception e) {
        }
        return products;
    }

    public ArrayList<Product> getArrangePriceAsc() {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product\n"
                + "order by product_price asc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("product_price"));
                p.setDescribe(rs.getString("product_describe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImg(rs.getString("product_img"));
                products.add(p);
            }
        } catch (Exception e) {
        }
        return products;
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void deleteProduct(String id) {
        String sql = "delete from product \n"
                + "where product_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertProduct(String id, String name, String img, String price,
            String describe, String quantity, String category) {
        String sql = "INSERT [product] ([product_id], [category_id], [product_name], \n"
                + "[product_price], [product_describe], [quantity], [product_img]) \n"
                + "VALUES(?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, category);
            ps.setString(3, name);
            ps.setString(4, price);
            ps.setString(5, describe);
            ps.setString(6, quantity);
            ps.setString(7, img);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editProduct(String id, String name, String img, String price,
            String describe, String quantity) {
        String sql = "update product\n"
                + "set product_name = ?, product_price = ?, \n"
                + "product_describe = ?, quantity = ?, product_img = ?\n"
                + "where product_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, describe);
            ps.setString(4, quantity);
            ps.setString(5, img);
            ps.setString(6, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> accounts = new ArrayList<>();
        String sql = "select * from users";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt("user_id"));
                a.setName(rs.getString("user_name"));
                a.setEmail(rs.getString("user_email"));
                a.setPass(rs.getString("user_pass"));
                a.setIsAdmin(rs.getString("isAdmin"));
                accounts.add(a);
            }
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }

    public Account getAccountId(String id) {
        String sql = "select * from users\n"
                + "where user_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5));
            }
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void deleteAccount(String id) {
        String sql = "delete from users \n"
                + "where user_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertAccount(String id, String name, String email,
            String pass, String isadmin) {
        String sql = "INSERT [users] ([user_id], [user_name], \n"
                + "[user_email], [user_pass], [isAdmin]) \n"
                + "VALUES(?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, pass);
            ps.setString(5, isadmin);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editAccount(String id, String name, String email,
            String pass, String isadmin) {
        String sql = "update users\n"
                + "set user_name = ?, user_email = ?, \n"
                + "user_pass = ?, isAdmin = ?\n"
                + "where user_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.setString(4, isadmin);
            ps.setString(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<BillDetail> getAllBillDetail() {
        ArrayList<BillDetail> billdetails = new ArrayList<>();
        String sql = "select * from bill_detail";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BillDetail bd = new BillDetail();
                bd.setId(rs.getInt("detail_id"));
                bd.setBid(rs.getInt("bill_id"));
                bd.setPid(rs.getString("product_id"));
                bd.setQuantity(rs.getInt("quantity"));
                bd.setSize(rs.getString("size"));
                bd.setPrice(rs.getInt("price"));
                billdetails.add(bd);
            }
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return billdetails;
    }

    public BillDetail getBillDetailId(String id) {
        String sql = "select * from bill_detail\n"
                + "where detail_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new BillDetail(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6));
            }
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void deleteBillDetail(String id) {
        String sql = "delete from users \n"
                + "where user_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertBillDetail(String id, String name, String email,
            String pass, String isadmin) {
        String sql = "INSERT [users] ([user_id], [user_name], \n"
                + "[user_email], [user_pass], [isAdmin]) \n"
                + "VALUES(?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, pass);
            ps.setString(5, isadmin);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editBillDetail(String id, String bid, String pid,
            String quantity, String size, String price) {
        String sql = "update bill_detail \n"
                + "set bill_id = ?, product_id = ?, \n"
                + "quantity = ?, size = ?, price = ?\n"
                + "where detail_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, bid);
            ps.setString(2, pid);
            ps.setString(3, quantity);
            ps.setString(4, size);
            ps.setString(5, price);
            ps.setString(6, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
