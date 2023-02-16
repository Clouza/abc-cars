package com.abccars.cars;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CarsRepository extends JpaRepository<Cars, Long> {

	@Query(value = "SELECT * FROM cars WHERE make LIKE '%' :mk '%'"
			+ " OR model LIKE '%' :md '%'"
			+ " OR name LIKE '%' :n '%'"
			+ " OR price LIKE '%' :pr '%'"
			+ " OR registration LIKE '%' :r '%'"
			+ " OR year LIKE '%' :y '%'", nativeQuery = true)
	List<Cars> carsFilter(
			@Param("mk") String make, 
			@Param("md") String carModel,
			@Param("n") String name, 
			@Param("pr") String price,
			@Param("r") String registration,
			@Param("y") String year
			);

}
