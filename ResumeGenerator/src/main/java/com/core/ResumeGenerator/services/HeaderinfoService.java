package com.core.ResumeGenerator.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.core.ResumeGenerator.repositories.HeaderinfoRepo;
import com.core.ResumeGenerator.models.Headerinfo;
import com.core.ResumeGenerator.models.Resume;

@Service
public class HeaderinfoService {
	private final HeaderinfoRepo repo;
	public HeaderinfoService(HeaderinfoRepo repo) {
		this.repo =repo;
	}
	
	//All Headerinfos
	public List<Headerinfo> all(){
		return repo.findAll();
	}
	
	//Create Headerinfo
	public Headerinfo create(Headerinfo headerinfo) {
		return repo.save(headerinfo);
	}
	
	//View resume by id
	public Headerinfo find(Long id) {
		Optional<Headerinfo> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		else {
			return null;
		}
	}
	public List<Headerinfo> byResume(Resume resume){
		return repo.findByResume(resume);
	}
	public Headerinfo update(Headerinfo headerinfo) {
		return repo.save(headerinfo);
	}
	public void delete(Long id) {
		repo.deleteById(id);
	}
	
	
	public Long findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
