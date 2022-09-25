package com.example.springprojectciti.service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Service;

import com.example.springprojectciti.dao.StockDao;

import yahoofinance.Stock;
import yahoofinance.YahooFinance;
import yahoofinance.histquotes.HistoricalQuote;
import yahoofinance.histquotes.Interval;
import yahoofinance.histquotes2.HistoricalDividend;
import yahoofinance.histquotes2.HistoricalSplit;



@Service
@Configurable
public class StockService {
	
	
	public ArrayList<StockDao> PassToGetStock(String sector) throws IOException {
		String path="C://Users//DeLL//OneDrive//Desktop//nifty50.csv";
		String line="";
		ArrayList<StockDao> ls=new ArrayList<StockDao>();
		BufferedReader br=new BufferedReader(new FileReader(path));
		while((line=br.readLine()) != null) {
			String [] values=line.split(",");
			if(values[1].equals(sector)) {
				StockDao dto=null;
				Calendar cal=Calendar.getInstance();
				Calendar cal1=Calendar.getInstance();
				cal.add(Calendar.DATE, -14);
				Stock stock=YahooFinance.get(values[2].toUpperCase(),cal,cal1,Interval.DAILY);
				//List<HistoricalDividend> his=stock.getDividendHistory();
				List<HistoricalQuote> st=stock.getHistory();
				BigDecimal avg=BigDecimal.ZERO;
				for(HistoricalQuote s:st) {
					System.out.println(s);
					avg=avg.add(s.getClose().subtract(s.getOpen()));
					System.out.println(avg);
				}
				BigDecimal a=new BigDecimal(14);
				avg.divide(a,2, RoundingMode.HALF_UP);
				
//				
				
				dto=new StockDao(stock.getName(),stock.getQuote().getPrice(),stock.getQuote().getChange(),stock.getCurrency(),avg,stock.getQuote().getChangeInPercent(),stock.getQuote().getAvgVolume());
				ls.add(dto);
			}
		}
		
		Collections.sort(ls,new StockDao());
		return ls;
	}
	
	
	

}
