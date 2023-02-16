package com.abccars.security;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomPasswordEncoder implements PasswordEncoder {

	@Override
	public String encode(CharSequence rawPassword) {
		 return BCrypt.hashpw(rawPassword.toString(), BCrypt.gensalt(8));
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		System.out.println("pw" + encodedPassword);
		return BCrypt.checkpw(rawPassword.toString(), "$2a$10$atel3MmHx97X3fxW/rafSeoYPV.l.5skhEC.CWPyA70TMZNRQWFf6");
	}

}
