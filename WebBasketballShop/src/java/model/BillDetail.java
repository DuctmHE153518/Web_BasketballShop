/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Duc Tran
 */
public class BillDetail {
    private int id;
    private int bid;
    private String pid;
    private int quantity;
    private String size;
    private int price; 

    public BillDetail() {
    }

    public BillDetail(int id, int bid, String pid, int quantity, String size, int price) {
        this.id = id;
        this.bid = bid;
        this.pid = pid;
        this.quantity = quantity;
        this.size = size;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "BillDetail{" + "id=" + id + ", bid=" + bid + ", pid=" + pid + ", quantity=" + quantity + ", size=" + size + ", price=" + price + '}';
    }
    
    
    
}
