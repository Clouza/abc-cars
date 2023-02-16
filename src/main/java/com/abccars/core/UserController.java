package com.abccars.core;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.abccars.cars.Cars;
import com.abccars.cars.CarsService;
import com.abccars.users.Users;
import com.abccars.users.UsersService;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@Autowired
	UsersService us;
	
	@Autowired
	CarsService cs;
	
	@Autowired
	PasswordEncoder pwEnc;
	
	@GetMapping("/dashboard")
	public ModelAndView userDashboard(Model model) {
		model.addAttribute("active", "active");
		return new ModelAndView("user/dashboard");
	}
	
	@GetMapping("/mycars")
	public ModelAndView myCars(Model model) {
		List<Cars> cars = cs.getAllRecord();
		model.addAttribute("cars", cars);
		model.addAttribute("activeMyCars", "active");
		model.addAttribute("activeUrlMyCars", "mycars");
		return new ModelAndView("user/mycars");
	}
	
	@GetMapping("/postcar")
	public ModelAndView postCar(Model model) {
		model.addAttribute("car", new Cars());
		model.addAttribute("activeMyCars", "active");
		model.addAttribute("activeUrlMyCars", "mycars");
		return new ModelAndView("user/addcar");
	}
	
	@PostMapping("/postcar")
	public String postCarPost(Cars car, @RequestParam(name = "image") MultipartFile image) throws IOException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = us.getRecordByUsername(auth.getName());
		
		String fileName = StringUtils.cleanPath(user.getUserId() + "-" + image.getOriginalFilename());
		String dir = "src/main/resources/static/userImages/";
		new FileHandler(fileName, image, dir);
		
		car.setUserId(String.valueOf(user.getUserId()));
		car.setBanner(fileName);
		cs.save(car);
		
		return "redirect:mycars";
	}
	
	@GetMapping("/updatecar")
	public ModelAndView ucar(Model model, @RequestParam(name = "carId") Long id) {
		if(id == null || id.equals("")) {
			return new ModelAndView("user/mycars");
		}
		Cars car = cs.getCarById(id).get();
		model.addAttribute("car", car);
		return new ModelAndView("user/updatecar");
	}
	
	@PostMapping("/updatecar")
	public String updateCar(Cars car, @RequestParam(name = "image") MultipartFile image, @RequestParam(name = "carId") Long id) throws IOException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = us.getRecordByUsername(auth.getName());
		String banner = cs.getCarById(id).get().getBanner();
		
		if(image.getSize() != 0) {
			String fileName = StringUtils.cleanPath(user.getUserId() + "-" + image.getOriginalFilename());
			String dir = "src/main/resources/static/userImages/";
			new FileHandler(fileName, image, dir);
			
			car.setBanner(fileName);
		} else {
			car.setBanner(banner);
		}
		car.setUserId(String.valueOf(user.getUserId()));
		cs.save(car);
		return "redirect:mycars";
	}
	
	@GetMapping("/settings")
	public ModelAndView settings(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = us.getRecordByUsername(auth.getName());
		model.addAttribute("user", user);
		model.addAttribute("activeSettings", "active");
		model.addAttribute("activeUrlSettings", "settings");
		return new ModelAndView("user/settings");
	}
	
	@PostMapping("/settings")
	public String updateSettings(@RequestParam(name = "email") String email) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = us.getRecordByUsername(auth.getName());
		user.setEmail(email);
		us.save(user);
		return "redirect:/user/dashboard";
	}
	
	@GetMapping("/deletecar/{id}")
	public String deleteCar(@PathVariable(name = "id") Long id) {
		cs.deletecar(id);
		return "redirect:/user/mycars";
	}
	
	@GetMapping("/updatepassword")
	public ModelAndView up() {
		return new ModelAndView("admin/updatepassword");
	}
	
	@PostMapping("/updatepassword")
	public ModelAndView updatePassword(@RequestParam(name = "password") String password) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = us.getRecordByUsername(auth.getName());
		
		user.setPassword(pwEnc.encode(password));
		us.save(user);
		return new ModelAndView("redirect:settings");
	}
}
