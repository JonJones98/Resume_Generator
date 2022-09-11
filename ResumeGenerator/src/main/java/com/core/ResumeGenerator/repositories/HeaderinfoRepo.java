package com.core.ResumeGenerator.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.models.Headerinfo;

@Repository
public interface HeaderinfoRepo extends CrudRepository<Headerinfo, Long>{
	
	List<Headerinfo>findAll();
	List<Headerinfo> findByResume(Resume resume);
	

}