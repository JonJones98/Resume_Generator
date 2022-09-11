package com.core.ResumeGenerator.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.core.ResumeGenerator.models.Projects;
import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.repositories.ProjectsRepo;

@Service
public class ProjectsService {
	private final ProjectsRepo repo;
	public ProjectsService(ProjectsRepo repo) {
		this.repo =repo;
	}
	
	//All Projectss
	public List<Projects> all(){
		return repo.findAll();
	}
	
	//Create Projects
	public Projects create(Projects projects) {
		return repo.save(projects);
	}
	
	//View projects by id
	public Projects find(Long id) {
		Optional<Projects> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		else {
			return null;
		}
	}
	public List<Projects> byResume(Resume resume){
		return repo.findByResume(resume);
	}
	public Projects update(Projects projects) {
		return repo.save(projects);
	}
	public void delete(Long id) {
		repo.deleteById(id);
	}
	
	
	public Long findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
