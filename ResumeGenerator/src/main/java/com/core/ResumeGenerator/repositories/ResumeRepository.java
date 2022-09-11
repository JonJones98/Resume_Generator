package com.core.ResumeGenerator.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.models.User;

@Repository
public interface ResumeRepository extends CrudRepository<Resume, Long> {
	
	List<Resume>findAll();
	List<Resume> findByUser(User user);
	

}
