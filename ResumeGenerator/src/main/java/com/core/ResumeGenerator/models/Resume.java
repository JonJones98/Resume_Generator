package com.core.ResumeGenerator.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

@Entity
@Table(name="resume")
public class Resume {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@OneToMany(mappedBy="resume",fetch=FetchType.LAZY,orphanRemoval = true, cascade = CascadeType.ALL)
    private List<Headerinfo> headerinfo;
	@OneToMany(mappedBy="resume",fetch=FetchType.LAZY,orphanRemoval = true, cascade = CascadeType.ALL)
    private List<Experiance> experiance;
	@OneToMany(mappedBy="resume",fetch=FetchType.LAZY,orphanRemoval = true, cascade = CascadeType.ALL)
    private List<Education> education;
	@OneToMany(mappedBy="resume",fetch=FetchType.LAZY,orphanRemoval = true, cascade = CascadeType.ALL)
    private List<Skills> skills;
	@OneToMany(mappedBy="resume",fetch=FetchType.LAZY,orphanRemoval = true, cascade = CascadeType.ALL)
    private List<Projects> projects;
	@OneToMany(mappedBy="resume",fetch=FetchType.LAZY,orphanRemoval = true, cascade = CascadeType.ALL)
    private List<Honors> honors;
	@Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
	
    private User user;
	public Resume() {
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public List<Headerinfo> getHeaderinfo() {
		return headerinfo;
	}
	public void setHeaderinfo(List<Headerinfo> headerinfo) {
		this.headerinfo = headerinfo;
	}
	public List<Experiance> getExperiance() {
		return experiance;
	}
	public void setExperiance(List<Experiance> experiance) {
		this.experiance = experiance;
	}
	public List<Education> getEducation() {
		return education;
	}
	public void setEducation(List<Education> education) {
		this.education = education;
	}
	public List<Skills> getSkills() {
		return skills;
	}
	public void setSkills(List<Skills> skills) {
		this.skills = skills;
	}
	public List<Projects> getProjects() {
		return projects;
	}
	public void setProjects(List<Projects> projects) {
		this.projects = projects;
	}
	public List<Honors> getHonors() {
		return honors;
	}
	public void setHonors(List<Honors> honors) {
		this.honors = honors;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@PrePersist
	protected void onCreate(){
	    this.createdAt= new Date();
	}
	@PreUpdate
	protected void onUpdate(){
	    this.updatedAt= new Date();
	}
	public Resume removeHeaderinfo(Headerinfo headerinfo) {
		headerinfo.remove(headerinfo);
		headerinfo.setResume(null);
		return this;
	}
	public Resume removeExperiance(Experiance experiance) {
		experiance.remove(experiance);
		experiance.setResume(null);
		return this;
	}
	public Resume removeEducation(Education education) {
		education.remove(education);
		education.setResume(null);
		return this;
	}
	public Resume removeProjects(Projects projects) {
		projects.remove(projects);
		projects.setResume(null);
		return this;
	}
	public Resume removeSkills(Skills skills) {
		skills.remove(skills);
		skills.setResume(null);
		return this;
	}
	public Resume removeHonors(Honors honors) {
		honors.remove(honors);
		honors.setResume(null);
		return this;
	}
	
	
}
