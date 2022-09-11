package com.core.ResumeGenerator.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.core.ResumeGenerator.models.Education;
import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.repositories.Educationrepo;

@Service
public class EducationService {
	private final Educationrepo repo;
	public EducationService(Educationrepo repo) {
		this.repo =repo;
	}
	
	//All Educations
	public List<Education> all(){
		return repo.findAll();
	}
	
	//Create Education
	public Education create(Education Education) {
		return repo.save(Education);
	}
	
	//View Education by id
	public Education find(Long id) {
		Optional<Education> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		else {
			return null;
		}
	}
	public List<Education> byResume(Resume resume){
		return repo.findByResume(resume);
	}
	public Education update(Education Education) {
		return repo.save(Education);
	}
	public void delete(Long id) {
		repo.deleteById(id);
	}
	
	
	public Long findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
