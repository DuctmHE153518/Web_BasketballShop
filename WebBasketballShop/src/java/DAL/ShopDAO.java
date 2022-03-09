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
}