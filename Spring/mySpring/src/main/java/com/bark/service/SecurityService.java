package com.bark.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class SecurityService {
	public boolean hasRole(int role, HttpSession session) {
		if(session.getAttribute("userType") == null) {
			return false;
		}
		return role == (int)session.getAttribute("userType");
	}
}
