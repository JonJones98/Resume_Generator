package com.core.ResumeGenerator.models;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "honor")
public class Honors {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotBlank(message="Missing Activity/Honor name")
	private String name;
	@NotBlank(message="Missing Year Recieved")
	private String yearawarded;
	@Column(updatable = false)
	private Date createdAt ;
	private Date updatedAt;
	@ManyToOne(fetch = FetchType.LAZY , cascade = CascadeType.REMOVE)
	@JoinColumn(name = "resume_id")
	private Resume resume;

	public Honors() {

	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getYearawarded() {
		return yearawarded;
	}

	public void setYearawarded(String yearawarded) {
		this.yearawarded = yearawarded;
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

	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}
	@PrePersist
	protected void onCreate(){
	    this.createdAt= new Date();
	}
	@PreUpdate
	protected void onUpdate(){
	    this.updatedAt= new Date();
	}

	public void remove(Honors honors) {
		// TODO Auto-generated method stub
		
	}
}
