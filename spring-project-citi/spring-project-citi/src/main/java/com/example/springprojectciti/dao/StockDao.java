package com.example.springprojectciti.dao;

import java.math.BigDecimal;
import java.util.Comparator;



public class StockDao implements Comparator<StockDao>{
	private String name;
	private BigDecimal price;
	private BigDecimal change;
	private String currency;
	private BigDecimal Avg2week;
	private BigDecimal changeper;
	private long AvgVolume;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public BigDecimal getChange() {
		return change;
	}
	public void setChange(BigDecimal change) {
		this.change = change;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	
	public BigDecimal getChangeper() {
		return changeper;
	}
	public void setChangeper(BigDecimal changeper) {
		this.changeper = changeper;
	}
	
	
	
	
	
	
	public long getAvgVolume() {
		return AvgVolume;
	}
	public void setAvgVolume(long avgVolume) {
		AvgVolume = avgVolume;
	}
	public BigDecimal getAvg2week() {
		return Avg2week;
	}
	public void setAvg2week(BigDecimal avg2week) {
		Avg2week = avg2week;
	}
	public StockDao(String name, BigDecimal price, BigDecimal change, String currency, BigDecimal Avg2week,
			BigDecimal changeper, long AvgVolume) {
		super();
		this.name = name;
		this.price = price;
		this.change = change;
		this.currency = currency;
		this.Avg2week = Avg2week;
		this.changeper = changeper;
		this.AvgVolume = AvgVolume;
	}
	public StockDao() {
		
	}
//	@Override
//	public String toString() {
//		return "name=" + name + ", price=" + price + ", change=" + change + ", currency=" + currency
//				+ ", Dividend of 2 week=" + Avg2week + ", changeper=" + changeper + ", Avg price of 2 weeks=" + avgPrice50;
//	}
//	
//	
	
	
	@Override
	public int compare(StockDao o1, StockDao o2) {
		// TODO Auto-generated method stub
		if(o1.getAvg2week().compareTo(o2.getAvg2week())==-1) {
			return 1;
		}
		else if(o1.getAvg2week().compareTo(o2.getAvg2week())==1) {
			return -1;
		}
		return 0;
	}
}
