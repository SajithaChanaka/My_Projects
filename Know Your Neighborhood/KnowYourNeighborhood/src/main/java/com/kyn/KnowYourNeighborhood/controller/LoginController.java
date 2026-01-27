package com.kyn.KnowYourNeighborhood.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kyn.KnowYourNeighborhood.entities.Users;
import com.kyn.KnowYourNeighborhood.service.UserService;

@RestController
public class LoginController {
	
	@Autowired
	UserService us;
	
    private final AuthenticationManager authMan;
    
    @Autowired
    public LoginController(AuthenticationManager authMan) {
    	 this.authMan = authMan;
    }
    
    @PostMapping("/register")
    public String registration(@RequestBody Users user) {
    	us.saveUser(user);
    	
    	return "Hey";
    	
    }
    
    @PostMapping("/sign")
    public String login(@RequestBody Users user) {
    	if (us.login(user.getUserName(), user.getPassword())) {
    		return "Succ";
    	}
    	return "Failure";
    }
    
    @GetMapping("/user")
    public Principal getUser(final Principal user) {
        return user;
    }

}
