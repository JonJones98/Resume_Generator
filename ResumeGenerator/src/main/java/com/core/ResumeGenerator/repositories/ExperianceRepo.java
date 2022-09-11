package com.core.ResumeGenerator.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.models.Experiance;

@Repository
public interface ExperianceRepo extends CrudRepository<Experiance, Long>{
	
	List<Experiance>findAll();
	List<Experiance> findByResume(Resume resume);
	

}