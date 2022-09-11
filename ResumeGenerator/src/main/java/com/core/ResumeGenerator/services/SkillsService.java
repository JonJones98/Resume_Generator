package com.core.ResumeGenerator.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.models.Skills;
import com.core.ResumeGenerator.repositories.SkillsRepo;

@Service
public class SkillsService {
	private final SkillsRepo repo;
	public SkillsService(SkillsRepo repo) {
		this.repo =repo;
	}
	
	//All Skillss
	public List<Skills> all(){
		return repo.findAll();
	}
	
	//Create Skills
	public Skills create(Skills skills) {
		return repo.save(skills);
	}
	
	//View skills by id
	public Skills find(Long id) {
		Optional<Skills> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		else {
			return null;
		}
	}
	public List<Skills> byResume(Resume resume){
		return repo.findByResume(resume);
	}
	public Skills update(Skills skills) {
		return repo.save(skills);
	}
	public void delete(Long id) {
		repo.deleteById(id);
	}
	
	
	public Long findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
