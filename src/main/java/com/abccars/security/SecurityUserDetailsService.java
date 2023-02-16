package com.abccars.security;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.abccars.users.Users;
import com.abccars.users.UsersRepository;

@Component
public class SecurityUserDetailsService implements UserDetailsService {

	@Autowired
	UsersRepository ur;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Users user = ur.findByUsername(username);
		
//		this.authorities = user.getRoles().stream().map(role -> new SimpleGrantedAuthority(role.getRoleName())).collect(Collectors.toList());
		if(user == null) {
			throw new UsernameNotFoundException("User not found");
		}
		
		return new SecurityUserDetails(user);
	}

}
