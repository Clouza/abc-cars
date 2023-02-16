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
import com.abccars.roles.Roles;
import com.abccars.roles.RolesService;
import com.abccars.userrole.UserRole;
import com.abccars.userrole.UserRoleRepository;
import com.abccars.userrole.UserRoleService;
import com.abccars.users.Users;
import com.abccars.users.UsersService;

@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	UsersService us;
	
	@Autowired
	CarsService cs;
	
	@Autowired
	UserRoleService urs;
	
	@Autowired
	RolesService rs;
	
	@Autowired
	PasswordEncoder pwEnc;
	
	@GetMapping("/dashboard")
	public ModelAndView adminDashboard(Model model) {
		model.addAttribute("active", "active");
		return new ModelAndView("admin/dashboard");
	}
	
	@GetMapping("/userlist")
	public ModelAndView userList(Model model) {
		List<Users> users = us.getAllRecords();
		List<Cars> cars = cs.getAllRecord();
		
		model.addAttribute("users", users);
		model.addAttribute("cars", cars);
		model.addAttribute("activeUserList", "active");
		return new ModelAndView("admin/userlist");
	}
	
	@GetMapping("/user/{id}")
	public ModelAndView editUser(Model model, @PathVariable(name = "id") Long id) {
		Users user = us.getRecordByUserId(id).get();
		List<Roles> _roles = rs.getAllRecord();
		List<Roles> roles = user.getRoles();
		UserRole ure = urs.getRecordByUserId(user.getUserId());
		String userRoles = ure.getRoleId();
		
		System.out.println(userRoles);

		model.addAttribute("user", user);
		model.addAttribute("roles", _roles);
		model.addAttribute("userRole", userRoles);
		return new ModelAndView("admin/edituser");
	}
	
	@PostMapping("/user/{id}")
	public String updateUser(
			@RequestParam(name = "username") String username,
			@RequestParam(name = "email") String email,
			@RequestParam(name = "role") String role,
			@PathVariable(name = "id") Long id) {
		Users user = us.getRecordByUserId(id).get();
		UserRole userRole = urs.getRecordByUserId(id);
		
		user.setUsername(username);
		user.setEmail(email);
		us.save(user);
		
		userRole.setRoleId(role);
		urs.save(userRole);
		return "redirect:/admin/userlist";
	}
	
	@GetMapping("/user/delete/{id}")
	public String deleteUser(@PathVariable(name = "id") Long id) {
		us.deleteRecordById(id);
		return "redirect:/admin/userlist";
	}
	
	@GetMapping("/carlist")
	public ModelAndView carList(Model model) {
		List<Cars> cars = cs.getAllRecord();
		model.addAttribute("cars", cars);
		model.addAttribute("activeCarList", "active");
		return new ModelAndView("admin/carlist");
	}
	
	@GetMapping("/settings")
	public ModelAndView settings(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = us.getRecordByUsername(auth.getName());
		model.addAttribute("user", user);
		model.addAttribute("activeSettings", "active");
		model.addAttribute("activeUrlSettings", "settings");
		return new ModelAndView("admin/settings");
	}
	
	@PostMapping("/settings")
	public String updateSettings(@RequestParam(name = "email") String email) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = us.getRecordByUsername(auth.getName());
		user.setEmail(email);
		us.save(user);
		return "redirect:/admin/dashboard";
	}
	
	@GetMapping("/updatecar")
	public ModelAndView ucar(Model model, @RequestParam(name = "carId") Long id) {
		if(id == null || id.equals("")) {
			return new ModelAndView("user/mycars");
		}
		Cars car = cs.getCarById(id).get();
		model.addAttribute("car", car);
		return new ModelAndView("admin/updatecar");
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
		return "redirect:carlist";
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
