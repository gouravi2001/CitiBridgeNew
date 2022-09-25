package com.example.springprojectciti.service;

import com.example.springprojectciti.controller.bean.User;

public interface UserService {
	User getUserByUserId(String userId);
	String setUSER(String userId);
	int UserUpdateStock(User user);
}
