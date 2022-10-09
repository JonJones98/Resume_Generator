package com.core.ResumeGenerator.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.models.Education;

@Repository
public interface EducationRepository extends CrudRepository<Education, Long>{
	
	List<Education>findAll();
	List<Education> findByResume(Resume resume);
	

}