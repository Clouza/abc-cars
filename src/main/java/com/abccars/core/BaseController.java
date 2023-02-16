package com.abccars.core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abccars.users.Users;
import com.abccars.users.UsersService;

@Controller
public class BaseController {
	
	@Autowired
	PasswordEncoder pwEncoder;
	
	@Autowired
	UsersService us;
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/register")
	public ModelAndView register(Model model) {
		model.addAttribute("user", new Users());
		return new ModelAndView("register");
	}
	
	@PostMapping("/register")
	public String registerSave(Users user) {
		user.setPassword(pwEncoder.encode(user.getPassword()));
		us.save(user);
		us.saveGeneralUser(us.getUserId());
		return "redirect:/thankyou";
	}
	
	@GetMapping("thankyou")
	public ModelAndView thankyou() {
		return new ModelAndView("thankyou");
	}
	
	@GetMapping("/home")
	public String home() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println(auth.getName());
		return "redirect:/";
	}
	
	@GetMapping("/admin")
	public String admin() {
		return "redirect:/admin/dashboard";
	}
	
	@GetMapping("/user")
	public String user() {
		return "redirect:/user/dashboard";
	}
	
	@GetMapping("/dashboard")
	public String dashboard() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		for(GrantedAuthority role: auth.getAuthorities()) {
			if(role.getAuthority().equals("ADMIN")) {
				return "redirect:/admin/dashboard";
			}
		}
		
		return "redirect:/user/dashboard";
	}
	
	@GetMapping("/about")
	public ModelAndView about() {
		return new ModelAndView("aboutus");
	}
	
	@GetMapping("/contact")
	public ModelAndView contactus() {
		return new ModelAndView("contactus");
	}
	
	@GetMapping("/login-error")
	public ModelAndView logError() {
		return new ModelAndView("loginerror");
	}
	
	@GetMapping("/findemail")
	public ModelAndView fm() {
		return new ModelAndView("findemail");
	}
	
	@PostMapping("/findemail")
	public ModelAndView findemail(Model model, @RequestParam(name = "email") String email) {
		Users user = us.getRecordByEmail(email);
		if(user == null) {
			model.addAttribute("errMsg", "Email not found");
			return new ModelAndView("findemail");
		}
		model.addAttribute("email", email);
		return new ModelAndView("forgotpassword");
	}
	
	@PostMapping("/forgotpassword")
	public ModelAndView forgotpassword(
				Model model,
				@RequestParam(name = "email") String email,
				@RequestParam(name = "password") String password
			) {
		Users user = us.getRecordByEmail(email);
		user.setPassword(pwEncoder.encode(password));
		us.save(user);
		
		model.addAttribute("successMsg", "Password updated");
		return new ModelAndView("login");
	}
	
}
