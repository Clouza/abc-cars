package com.abccars.users;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abccars.userrole.UserRole;
import com.abccars.userrole.UserRoleRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UsersService {

	@Autowired
	UsersRepository ur;
	
	@Autowired
	UserRoleRepository urr;
	
	public void save(Users user) {
		user.setUsername(user.getUsername());
		user.setPassword(user.getPassword());
		user.setEmail(user.getEmail());
		user.setActive(false);
		ur.save(user);
	}
	
	public void saveGeneralUser(Long id) {
		UserRole userRole = new UserRole();
		userRole.setUserId(String.valueOf(id));
		userRole.setRoleId("1");
		urr.save(userRole);
	}
	
	public Long getUserId() {
		return ur.getLastRecordId().getUserId();
	}
	
	public Users getRecordByUsername(String username) {
		return ur.findByUsername(username);
	}

	public Optional<Users> getRecordByUserId(Long id) {
		return ur.findById(id);
	}

	public List<Users> getAllRecords() {
		return ur.findAll();
	}

	public Users getRecordByEmail(String email) {
		return ur.findByEmail(email);
	}

	public void deleteRecordById(Long id) {
		ur.deleteById(id);
	}
}
