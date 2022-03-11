
import DAL.ShopDAO;
import java.util.ArrayList;
import model.Category;
import model.Product;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Duc Tran
 */
public class test {

    public static void main(String[] args) {
        ShopDAO dao = new ShopDAO();
        ArrayList<Product> list = dao.getTrend();
        for (Product o : list) {
            System.out.println(o);
        }
    }
}
