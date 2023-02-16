package com.abccars.cars;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class CarsService {

	@Autowired
	CarsRepository cr;
	
	public void save(Cars car) {
		cr.save(car);
	}
	
	public List<Cars> getAllRecord() {
		return cr.findAll();
	}

	public Optional<Cars> getCarById(Long id) {
		return cr.findById(id);
	}

	public int countCars() {
		return (int) cr.count();
	}

	public List<Cars> carsFilter(String make, String carModel, String name, String price, String registration,
			String year) {
		return cr.carsFilter(make, carModel, name, price, registration, year);
	}

	public void deletecar(Long id) {
		cr.deleteById(id);
	}
}
