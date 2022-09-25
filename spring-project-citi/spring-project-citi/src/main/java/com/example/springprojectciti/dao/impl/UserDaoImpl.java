package com.example.springprojectciti.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.example.springprojectciti.controller.bean.User;
import com.example.springprojectciti.dao.UserDao;



@Repository
public class UserDaoImpl extends JdbcDaoSupport implements UserDao{
	
	@Autowired
	DataSource dataSource;
	
	@PostConstruct
	private void intializer() {
		setDataSource(dataSource);
	}
	
	public static String USERID;
	@SuppressWarnings("deprecation")
	@Override
	public User getUserById(String userId) {
		String sql="select cast(aes_decrypt(unhex(user_pswd), 'secret') as char(50)) from user where user_id=?";
		try {
		return getJdbcTemplate().queryForObject(sql, new Object[] { userId },new RowMapper<User>() {
			
			@Override
			public User mapRow(ResultSet rs,int rowNum) throws SQLException{
				User user=new User();
				user.setUserId(userId);
				user.setPassword(rs.getString(1));
				return user;
			}
		});
		}catch(EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public int UserUpdateStock(User user) {
		// TODO Auto-generated method stub
		String sql="insert into userhistory(user_id,user_pswd,quantity,totalprice,stockname) values (?,hex(aes_encrypt(?,'secret')),?,?,?)";
		return getJdbcTemplate().update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1, user.getUserId());
				ps.setString(2,user.getPassword());
				ps.setInt(3, user.getQuantity());
				ps.setDouble(4, user.getTotalprice());
				ps.setString(5, user.getStockname());
				
				return ps;
			}
			
		});
	}

	@Override
	public String setUSER(String userId) {
		// TODO Auto-generated method stub
		USERID=userId;
		return USERID;
	}

	
	
}
