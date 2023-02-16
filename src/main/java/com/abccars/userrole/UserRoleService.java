package com.abccars.userrole;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserRoleService {
	@Autowired
	UserRoleRepository urr;

	public List<UserRole> getAllRecord() {
		return urr.findAll();
	}

	public UserRole getRecordByUserId(Long userId) {
		return urr.findByUserId(userId);
	}

	public void save(UserRole userRole) {
		urr.save(userRole);
	}
}
