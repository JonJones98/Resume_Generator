package com.core.ResumeGenerator.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.core.ResumeGenerator.models.Honors;
import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.repositories.HonorsRepo;

@Service
public class HonorsService {
	private final HonorsRepo repo;
	public HonorsService(HonorsRepo repo) {
		this.repo =repo;
	}
	
	//All Honorss
	public List<Honors> all(){
		return repo.findAll();
	}
	
	//Create Honors
	public Honors create(Honors honors) {
		return repo.save(honors);
	}
	
	//View honors by id
	public Honors find(Long id) {
		Optional<Honors> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		else {
			return null;
		}
	}
	public List<Honors> byResume(Resume resume){
		return repo.findByResume(resume);
	}
	public Honors update(Honors honors) {
		return repo.save(honors);
	}
	public void delete(Long id) {
		repo.deleteById(id);
	}
	
	
	public Long findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
