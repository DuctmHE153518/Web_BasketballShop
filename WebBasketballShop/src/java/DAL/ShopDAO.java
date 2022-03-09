/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;

/**
 *
 * @author Duc Tran
 */

public class ShopDAO extends BaseDAO<Product> {
        PreparedStatement ps = null;
    @Override
    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select * from product";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("product_id"));
                p.setName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("product_price"));
                p.setDescribe(rs.getString("product_describe"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImg(rs.getString("product_img"));
                products.add(p);
//                product.add(new Product(rs.getString(1), rs.getString(3), 
//                                        rs.getDouble(4), rs.getString(5), 
//                                        rs.getInt(6), rs.getString(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> categorys = new ArrayList<>();
        try {
            String sql = "select * from category";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("product_id"));
                c.setName(rs.getString("product_name"));

                categorys.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categorys;
    }
}   

    
