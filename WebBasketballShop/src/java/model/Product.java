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
public class Product {
    private String id;
    private String name;
    private double price;
    private String describe;
    private int quantity;
    private String img;

    public Product() {
    }

    public Product(String id, String name, double price, String describe, int quantity, String img) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.describe = describe;
        this.quantity = quantity;
        this.img = img;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + ", describe=" + describe + ", quantity=" + quantity + ", img=" + img + '}';
    }
    
    
}
