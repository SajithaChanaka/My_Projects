package com.kyn.KnowYourNeighborhood.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kyn.KnowYourNeighborhood.entities.Facilities;
import com.kyn.KnowYourNeighborhood.repository.FacilityRepository;

import java.util.List;

@Service
@Transactional
public class FacilityService {
	
	@Autowired
	private FacilityRepository fr;
	
	public void addFac(Facilities fac) {
		fr.save(fac);
	}
	
	public List<Facilities> listFacilities(){
		List<Facilities> facilities = fr.findAll();
		
		return facilities;
	}

}
