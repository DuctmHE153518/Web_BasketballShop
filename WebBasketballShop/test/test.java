
import DAL.ShopDAO;
import java.util.ArrayList;
import model.Account;
import model.BillDetail;
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
//        dao.insertAccount("11", "khongadmin", "khong@gmail.com", "112233", "TRUE");
//        Account list = dao.getAccountId("11");
        dao.insertBillDetail("14", "21", "P003", "1", "37", "1000000");
        BillDetail list = dao.getBillDetailId("14");
        System.out.println(list);
//        ArrayList<Account> list = dao.getAllAccount();
//        for (Product o : list) {
//            System.out.println(o);
//        }
    }
}
