package com.kyn.KnowYourNeighborhood.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kyn.KnowYourNeighborhood.entities.Facilities;

public interface FacilityRepository extends JpaRepository<Facilities, Long> {

}
