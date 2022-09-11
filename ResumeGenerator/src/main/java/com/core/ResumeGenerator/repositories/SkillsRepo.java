package com.core.ResumeGenerator.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.models.Skills;

@Repository
public interface SkillsRepo extends CrudRepository<Skills, Long>{
	
	List<Skills>findAll();
	List<Skills> findByResume(Resume resume);
	

}