package com.core.ResumeGenerator.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.models.Projects;

@Repository
public interface ProjectsRepo extends CrudRepository<Projects, Long>{
	
	List<Projects>findAll();
	List<Projects> findByResume(Resume resume);
	

}