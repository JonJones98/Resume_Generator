package com.core.ResumeGenerator.services;

import java.util.List;
import java.util.Optional;

import com.core.ResumeGenerator.models.Education;
import com.core.ResumeGenerator.models.Experiance;
import com.core.ResumeGenerator.models.Headerinfo;
import com.core.ResumeGenerator.models.Honors;
import com.core.ResumeGenerator.models.Projects;
import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.models.Skills;
import com.core.ResumeGenerator.models.User;
import com.core.ResumeGenerator.repositories.Educationrepo;
import com.core.ResumeGenerator.repositories.ExperianceRepo;
import com.core.ResumeGenerator.repositories.HeaderinfoRepo;
import com.core.ResumeGenerator.repositories.HonorsRepo;
import com.core.ResumeGenerator.repositories.ProjectsRepo;
import com.core.ResumeGenerator.repositories.SkillsRepo;

public class SectionofResumeServeice {
	private final Educationrepo edurepo;
	private final ExperianceRepo exprepo;
	private final HeaderinfoRepo hdrrepo;
	private final HonorsRepo hrsrepo;
	private final ProjectsRepo prjrepo;
	private final SkillsRepo sklrepo;
	public SectionofResumeServeice(Educationrepo edurepo, ExperianceRepo exprepo, HeaderinfoRepo hdrrepo,
			HonorsRepo hrsrepo, ProjectsRepo prjrepo, SkillsRepo sklrepo) {
		super();
		this.edurepo = edurepo;
		this.exprepo = exprepo;
		this.hdrrepo = hdrrepo;
		this.hrsrepo = hrsrepo;
		this.prjrepo = prjrepo;
		this.sklrepo = sklrepo;
	}
	
	//Create Sub-fields
		public Education create(Education education) {
			return edurepo.save(education);
		}
		public Experiance create(Experiance experiaence) {
			return exprepo.save(experiaence);
		}
		public Headerinfo create(Headerinfo headerinfo) {
			return hdrrepo.save(headerinfo);
		}
		public Honors create(Honors honors) {
			return hrsrepo.save(honors);
		}
		public Projects create(Projects projects) {
			return prjrepo.save(projects);
		}
		public Skills create(Skills skills) {
			return sklrepo.save(skills);
		}
		
		//View Skills by id
		public Skills find(Long id) {
			Optional<Skills> result = sklrepo.findById(id);
			if(result.isPresent()) {
				return result.get();
			}
			else {
				return null;
			}
		}
		public List<Skills> byResume(Resume resume){
			return sklrepo.findByResume(resume);
		}
		//public Skills update(Resume resume) {
			//return sklrepo.save(resume);
		//}
		public void delete(Long id) {
			sklrepo.deleteById(id);
		}
}