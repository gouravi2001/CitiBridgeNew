package com.example.springprojectciti.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.springprojectciti.controller.bean.User;
import com.example.springprojectciti.dao.UserDao;
import com.example.springprojectciti.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao userDao;
	
	@Override
	public User getUserByUserId(String userId) {
		User user=userDao.getUserById(userId);
		return user;
	}

	@Override
	public int UserUpdateStock(User user) {
	
		return userDao.UserUpdateStock(user);
	}

	@Override
	public String setUSER(String userId) {
		return userDao.setUSER(userId);
		// TODO Auto-generated method stub
		
	}
	
}
