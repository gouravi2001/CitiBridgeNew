package com.example.springprojectciti.controller.bean;

import java.util.ArrayList;

import org.springframework.stereotype.Service;


public class User {
	private String userId;
	private String password;
	private int quantity;
	private double totalprice;
	private String stockname;
	private ArrayList<String> users;
	
	
	public ArrayList<String> getUsers() {
		return users;
	}
	public void setUsers(ArrayList<String> users) {
		this.users = users;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}
	public String getStockname() {
		return stockname;
	}
	public void setStockname(String stockname) {
		this.stockname = stockname;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", quantity=" + quantity + ", totalprice="
				+ totalprice + ", stockname=" + stockname + "]";
	}
	
	
}
