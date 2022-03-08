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
import model.Shop;

/**
 *
 * @author Duc Tran
 */

public class ShopDAO extends BaseDAO<Shop> {
        PreparedStatement ps = null;
    @Override
    public ArrayList<Shop> getAll() {
        ArrayList<Shop> Shop = new ArrayList<>();
        try {
            String sql = "select * from [Ballershop]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next()) {
                Shop s = new Shop();
                s.setUsername(rs.getString("username"));
                s.setPassword(rs.getString("password"));
                s.setDisplayname(rs.getString("displayname"));
                Shop.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShopDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Shop;
    }
}   

    
