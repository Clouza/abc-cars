package com.abccars.core;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ErrorController implements org.springframework.boot.web.servlet.error.ErrorController {
	
	@GetMapping("/error")
	public ModelAndView handleError(HttpServletRequest req, Model model) {
		String status = req.getAttribute(RequestDispatcher.ERROR_STATUS_CODE).toString();
		
		for(HttpStatus code: HttpStatus.values()) {
			if(status.equals(String.valueOf(code.value()))) {
				model.addAttribute("code", code.value());
				model.addAttribute("msg", code.getReasonPhrase());
			}
		}
		
		return new ModelAndView("error");
	}
	
}
