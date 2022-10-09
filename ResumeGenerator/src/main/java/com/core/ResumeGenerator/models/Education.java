package com.core.ResumeGenerator.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name="education")
public class Education {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotBlank(message="Missing School Name")
	private String name;
	@NotBlank(message="Missing City")
	private String city;
	@NotBlank(message="Missing State")
	@Size(max=2, message="Must use State Initials")
	private String state;
	private String degreetype;
	private String major;
	@NotBlank(message="Missing Enrolled Year")
	private String enrolledyear;
	@NotBlank(message="Missing Graduation Year")
	private String graduationyear;
	@Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
	
	@ManyToOne
    @JoinColumn(name="resume_id")
    private Resume resume;
	
	public Education() {
		
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

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDegreetype() {
		return degreetype;
	}

	public void setDegreetype(String degreetype) {
		this.degreetype = degreetype;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getEnrolledyear() {
		return enrolledyear;
	}

	public void setEnrolledyear(String enrolledyear) {
		this.enrolledyear = enrolledyear;
	}

	public String getGraduationyear() {
		return graduationyear;
	}

	public void setGraduationyear(String graduationyear) {
		this.graduationyear = graduationyear;
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

	public void remove(Education education) {
		// TODO Auto-generated method stub
		
	}
}
