package com.kyn.KnowYourNeighborhood.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kyn.KnowYourNeighborhood.entities.Facilities;
import com.kyn.KnowYourNeighborhood.service.FacilityService;

@RestController
public class FacController {
	
	@Autowired
	public FacilityService fs;
	
	@PostMapping("/save")
	public String addFac(@RequestBody Facilities fac) {
		fs.addFac(fac);
		
		return "Building Saved";
	}
	
	@GetMapping("/list")
	public List<Facilities> listFac(){
		return fs.listFacilities();
	}

}
