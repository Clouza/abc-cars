package com.abccars.users;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UsersRepository extends JpaRepository<Users, Long> {
	@Query(value = "SELECT * FROM users ORDER BY user_id DESC LIMIT 1", nativeQuery = true)
	public Users getLastRecordId();
	
//	@Query(value = "SELECT * FROM users"
//			+ " JOIN user_role ON users.user_id = user_role.user_id"
//			+ " JOIN roles ON roles.role_id = user_role.role_id"
//			+ " WHERE username = :u", nativeQuery = true)
//	public Users findByUsername(@Param("u") String username);
	Users findByUsername(String username);

	@Query(value = "SELECT * FROM users WHERE email = :e", nativeQuery = true)
	public Users findByEmail(@Param("e") String email);
}
