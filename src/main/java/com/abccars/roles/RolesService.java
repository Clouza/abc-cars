package com.abccars.roles;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class RolesService {

	@Autowired
	RolesRepository rr;

	public List<Roles> getAllRecord() {
		return rr.findAll();
	}
	
}
