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
import model.Category;
import model.Product;

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
            while(rs.next()) {
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
            while(rs.next()) {
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
        String sql = "select top 5 * from product \n" +
                        "order by quantity asc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
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
        String sql = "select * from product \n" +
                        "where category_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while(rs.next()) {
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
        String sql = "select * from product \n" +
                        "where product_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while(rs.next()) {
                return new Product(rs.getString(1), rs.getString(3), 
                        rs.getDouble(4), rs.getString(5), 
                        rs.getInt(6), rs.getString(7));
            }
        } catch (Exception ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<Product> searchName(String txtSearch) {
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select * from product\n" +
                        "where [product_name] like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+txtSearch+"%");
            rs = ps.executeQuery();
            while(rs.next()) {
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
        String sql = "select * from users\n" +
                        "where [user_name] = ?\n" +
                        "and [user_pass] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while(rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), 
                        rs.getString(3), rs.getString(4), 
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public Account checkAccount(String user) {
        String sql = "select * from users\n" +
                        "where [user_name] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while(rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), 
                        rs.getString(3), rs.getString(4), 
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void signup(String user, String email, String pass) {
        String sql = "insert into [users]\n" +
                        "values (?,?,?,'FALSE')";
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
        String sql = "SELECT * FROM product\n" +
                        "order by product_price desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
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
        String sql = "SELECT * FROM product\n" +
                        "order by product_price asc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
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
    
    
    public List<Product> getListByPage(List<Product> list, int start, int end){
        ArrayList<Product> arr =new ArrayList<>();
        for(int i=start; i<end; i++){
            arr.add(list.get(i));
        }
        return arr;
    }
    
}
