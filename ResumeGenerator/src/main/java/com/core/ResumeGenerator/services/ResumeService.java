package com.core.ResumeGenerator.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.models.User;
import com.core.ResumeGenerator.repositories.ResumeRepository;

@Service
public class ResumeService {
	private final ResumeRepository repo;
	public ResumeService(ResumeRepository repo) {
		this.repo =repo;
	}
	
	//All Resumes
	public List<Resume> all(){
		return repo.findAll();
	}
	
	//Create Resume
	public Resume create(Resume resume) {
		return repo.save(resume);
	}
	
	//View resume by id
	public Resume find(Long id) {
		Optional<Resume> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		else {
			return null;
		}
	}
	public List<Resume> byUser(User user){
		return repo.findByUser(user);
	}
	
	public Resume update(Resume resume) {
		return repo.save(resume);
	}
	public void delete(Long id) {
		repo.deleteById(id);
	}
	public Resume findById(Long id) {
		Optional<Resume> potentialResume = repo.findById(id);
		if (potentialResume.isPresent()) {
			return potentialResume.get();
		}
		return null;
	}
	
	public Long findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
