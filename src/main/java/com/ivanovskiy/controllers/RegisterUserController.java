package com.ivanovskiy.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.Set;

@Controller
public class RegisterUserController{

	@Autowired
	private UserDetailsManager userDetailsService;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String home(final HttpServletRequest request) {
		GrantedAuthority auth = new GrantedAuthority() {
			private static final long serialVersionUID = 1L;

			public String getAuthority() {
				return request.getParameter("role");
			}
		};
		Set<GrantedAuthority> set = new HashSet<>();
		set.add(auth);

		UserDetails details = new User(
				request.getParameter("user"),
				request.getParameter("password"),
				true, true, true, true, set);
		userDetailsService.createUser(details);
		return "login";
	}
}