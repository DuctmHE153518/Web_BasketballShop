
import DAL.ShopDAO;
import java.util.ArrayList;
import model.Account;

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
        dao.insertAccount("11", "ahihi", "haiahi@gmail.com", "a123", "TRUE");
//        ArrayList<Account> list = dao.getAllAccount();
//        for (Account o : list) {
//            System.out.println(o);
//        }
    }
}
