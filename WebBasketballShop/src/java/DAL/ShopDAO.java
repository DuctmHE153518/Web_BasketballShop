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
import model.Product;

/**
 *
 * @author Duc Tran
 */

public class ShopDAO extends BaseDAO<Product> {
        PreparedStatement ps = null;
    @Override
    public ArrayList<Product> getAll() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select * from [product]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next()) {
                Product s = new Product();
                s.setId(rs.getString("product_id"));
                s.setName(rs.getString("product_name"));
                s.setPrice(rs.getDouble("product_price"));
                s.setDescribe(rs.getString("product_describe"));
                s.setQuantity(rs.getInt("quantity"));
                s.setImg(rs.getString("product_img"));
                products.add(s);
//                product.add(new Product(rs.getString(1), rs.getString(3), 
//                                        rs.getDouble(4), rs.getString(5), 
//                                        rs.getInt(6), rs.getString(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
}   

    
