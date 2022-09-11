package com.core.ResumeGenerator.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.models.Honors;

@Repository
public interface HonorsRepo extends CrudRepository<Honors, Long>{
	
	List<Honors>findAll();
	List<Honors> findByResume(Resume resume);
	

}