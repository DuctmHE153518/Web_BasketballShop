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
import java.util.logging.Level;
import java.util.logging.Logger;
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
    
}
