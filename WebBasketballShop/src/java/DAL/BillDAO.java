/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import model.Account;
import model.Cart;
import model.Item;

/**
 *
 * @author Duc Tran
 */
public class BillDAO extends DBContext {
    Connection connection = null;
    //connection = new DBContext().getConnection();
    public void addorder(Account u, Cart cart, String payment, String address, String phone, String size) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
 
            String sql = "insert into [bill] values(?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getId());
            st.setDouble(2, cart.getTotalMoney());
            st.setString(3, payment);
            st.setString(4, address);
            st.setString(5, date);
            st.setString(6, phone);
            st.executeUpdate();

            String sql1 = "select top 1 bill_id from [bill] order by bill_id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();

            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into [bill_detail] values(?, ?, ?, ?, ?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setString(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setString(4, size);
                    st2.setDouble(5, i.getPrice());
                    st2.executeUpdate();
                }
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
    }
}
