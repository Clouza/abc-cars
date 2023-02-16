package com.abccars.core;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abccars.cars.Cars;
import com.abccars.cars.CarsService;
import com.abccars.users.Users;
import com.abccars.users.UsersService;

@Controller
public class CarsController {

	@Autowired
	UsersService us;
	
	@Autowired
	CarsService cs;
	
	@GetMapping("/list-of-cars")
	public ModelAndView listOfCars(Model model) {
		List<Cars> cars = cs.getAllRecord();
		
		model.addAttribute("cars", cars);
		
		if(cars.isEmpty()) {
			model.addAttribute("carsMessage", "Cars Not Available");
		}
		
		return new ModelAndView("user/listofcars");
	}
	
	@GetMapping("/search")
	public ModelAndView search(
			Model model,
			@RequestParam(name = "n") String name,
			@RequestParam(name = "r") String registration,
			@RequestParam(name = "mk") String make,
			@RequestParam(name = "md") String carModel,
			@RequestParam(name = "pr") String price,
			@RequestParam(name = "y") String year
		) {
		
		model.addAttribute("n", name);
		model.addAttribute("r", registration);
		model.addAttribute("mk", make);
		model.addAttribute("md", carModel);
		model.addAttribute("pr", price);
		model.addAttribute("y", year);
		
		List<Cars> listOfCars = cs.carsFilter(make, carModel, name, price, registration, year);
		if(name.equals("") || registration.equals("") || make.equals("") || carModel.equals("") || price.equals("") || year.equals("")) {
			model.addAttribute("cars", listOfCars);
		}
		
		if(listOfCars.isEmpty()) {
			model.addAttribute("carsMessage", "Cars Not Available");
		}
		
		return new ModelAndView("user/search");
	}
	
	@GetMapping("/car/{id}")
	public ModelAndView car(Model model, @PathVariable(name = "id") Long id) {
		Cars car = cs.getCarById(id).get();
		Users user = us.getRecordByUserId(Long.parseLong(car.getUserId())).get();
		model.addAttribute("car", car);
		model.addAttribute("user", user);
		return new ModelAndView("user/cardetails");
	}
	
}
