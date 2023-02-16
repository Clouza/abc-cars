package com.abccars.userrole;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abccars.users.Users;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRole, Long>{

	@Query(value = "SELECT * FROM user_role WHERE user_id = :u", nativeQuery = true)
	public UserRole findByUserId(@Param("u") Long userId);
}
