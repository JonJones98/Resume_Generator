package com.core.ResumeGenerator.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.core.ResumeGenerator.models.Experiance;
import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.repositories.ExperianceRepo;

@Service
public class ExperianceService {
	private final ExperianceRepo repo;
	public ExperianceService(ExperianceRepo repo) {
		this.repo =repo;
	}
	
	//All Resumes
	public List<Experiance> all(){
		return repo.findAll();
	}
	
	//Create Experiance
	public Experiance create(Experiance experiance) {
		return repo.save(experiance);
	}
	
	//View experiance by id
	public Experiance find(Long id) {
		Optional<Experiance> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		else {
			return null;
		}
	}
	public List<Experiance> byResume(Resume resume){
		return repo.findByResume(resume);
	}
	public Experiance update(Experiance experiance) {
		return repo.save(experiance);
	}
	public void delete(Long id) {
		repo.deleteById(id);
	}
	
	
	public Long findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
