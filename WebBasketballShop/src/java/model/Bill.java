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
public class Bill {
    private int id;
    private int aid;
    private double total;
    private String payment;
    private String address;
    private String date;
    private String phone;

    public Bill() {
    }

    public Bill(int id, int aid, double total, String payment, String address, String date, String phone) {
        this.id = id;
        this.aid = aid;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.date = date;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Bill{" + "id=" + id + ", aid=" + aid + ", total=" + total + ", payment=" + payment + ", address=" + address + ", date=" + date + ", phone=" + phone + '}';
    }
    
}
