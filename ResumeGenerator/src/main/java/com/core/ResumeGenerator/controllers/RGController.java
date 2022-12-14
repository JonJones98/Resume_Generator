package com.core.ResumeGenerator.controllers;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Dictionary;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.core.ResumeGenerator.models.Education;
import com.core.ResumeGenerator.models.Experiance;
import com.core.ResumeGenerator.models.Headerinfo;
import com.core.ResumeGenerator.models.Honors;
import com.core.ResumeGenerator.models.LoginUser;
import com.core.ResumeGenerator.models.Projects;
import com.core.ResumeGenerator.models.Resume;
import com.core.ResumeGenerator.models.Skills;
import com.core.ResumeGenerator.models.User;
import com.core.ResumeGenerator.services.EducationService;
import com.core.ResumeGenerator.services.ExperianceService;
import com.core.ResumeGenerator.services.HeaderinfoService;
import com.core.ResumeGenerator.services.HonorsService;
import com.core.ResumeGenerator.services.ProjectsService;
import com.core.ResumeGenerator.services.ResumeService;
import com.core.ResumeGenerator.services.SkillsService;
import com.core.ResumeGenerator.services.UserService;

@Controller
public class RGController {
	// Services
	@Autowired
	private ResumeService resumes;
	@Autowired
	private EducationService educations;
	@Autowired
	private ExperianceService experiances;
	@Autowired
	private HeaderinfoService headerinfos;
	@Autowired
	private ProjectsService projects;
	@Autowired
	private HonorsService honors;
	@Autowired
	private SkillsService skills;
	@Autowired
	private UserService users;
	private Object thisSection;

	

	// GET Routes
	@GetMapping("/welcome")
	public String welcome(Model model) {
		return "Welcome2.jsp";
	}
	@GetMapping("/login_user")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}

	@GetMapping("/")
	public String dashboard(HttpSession session, Model model) {
		
		List<Resume> resumeId = resumes.all();
		try {
			Long userId = (Long) session.getAttribute("userId");
			model.addAttribute("user", users.findById(userId));
			model.addAttribute("allresumes", resumeId);
			return "dashboard.jsp";
		} catch (Exception e) {
			model.addAttribute("allresumes", resumeId);
			return "dashboard.jsp";
		}

	}
	
	@GetMapping("/preview/{id}")
	public String preview(@PathVariable("id") Long id,HttpSession session, Model model) {
		// userId not found
		// if(session.getAttribute("userId")==null) {
		// return "redirect:/logout";
		// }
		Resume resume = resumes.findById(id);
		List<Education> educationId = educations.byResume(resume);
		List<Experiance> experianceId = experiances.byResume(resume);
		List<Headerinfo> headerinfoId = headerinfos.byResume(resume);
		List<Honors> honorsId = honors.byResume(resume);
		List<Projects> projectsId = projects.byResume(resume);
		List<Skills> skillsId = skills.byResume(resume);
		try {
			Long userId = (Long) session.getAttribute("userId");
			model.addAttribute("user", users.findById(userId));
			model.addAttribute("alleducations", educationId);
			model.addAttribute("allexperiances", experianceId);
			model.addAttribute("allheaderinfos", headerinfoId);
			model.addAttribute("allhonors", honorsId);
			model.addAttribute("allprojects", projectsId);
			model.addAttribute("allskills", skillsId);
			model.addAttribute("resume", resume);
			return "resumeTemplate.jsp";
		} catch (Exception e) {
			model.addAttribute("allresumes", educationId);
			return "dashboard.jsp";
		}

	}
	@GetMapping("/export/{id}")
	public String export(@PathVariable("id") Long id,HttpSession session, Model model) {
		// userId not found
		// if(session.getAttribute("userId")==null) {
		// return "redirect:/logout";
		// }
		Resume resume = resumes.findById(id);
		List<Education> educationId = educations.byResume(resume);
		List<Experiance> experianceId = experiances.byResume(resume);
		List<Headerinfo> headerinfoId = headerinfos.byResume(resume);
		List<Honors> honorsId = honors.byResume(resume);
		List<Projects> projectsId = projects.byResume(resume);
		List<Skills> skillsId = skills.byResume(resume);
		List<String> years = new ArrayList<String>();
		int endYear = Calendar.getInstance().get(Calendar.YEAR);
		String currentyear=String.valueOf(endYear);
		for(int year=endYear-100;year<= endYear+100; year++) {
			String y=String.valueOf(year);
			years.add(y);
		}
		try {
			Long userId = (Long) session.getAttribute("userId");
			model.addAttribute("user", users.findById(userId));
			model.addAttribute("alleducations", educationId);
			model.addAttribute("allexperiances", experianceId);
			model.addAttribute("allheaderinfos", headerinfoId);
			model.addAttribute("allhonors", honorsId);
			model.addAttribute("allprojects", projectsId);
			model.addAttribute("allskills", skillsId);
			model.addAttribute("resume", resume);
			model.addAttribute("allyears", years);
			return "resumeTemplate2.jsp";
		} catch (Exception e) {
			model.addAttribute("allresumes", educationId);
			return "dashboard.jsp";
		}

	}
	@GetMapping("/create")
	public String newresume(@ModelAttribute("resume") Resume resume,Model model,HttpSession session ) {
		try {
		User user = users.findById((Long)session.getAttribute("userId"));
			model.addAttribute("resume", new Resume());
			model.addAttribute("user", user);
			return "createresume_id.jsp";
		}
		catch(Exception e){
			return "redirect:/login_user";
		}
	}
	@GetMapping("/resume/{id}/edit/{secID}")
	public String editshow(Model model,@PathVariable("id") Long id,@PathVariable("secID") Long secID,@ModelAttribute("education") Education education,@ModelAttribute("experiance") Experiance experiance,@ModelAttribute("headerinfo") Headerinfo headerinfo,@ModelAttribute("honor") Honors honor,@ModelAttribute("skill") Skills skill,@ModelAttribute("project") Projects project, HttpSession session) {
		List<String> years = new ArrayList<String>();
		int endYear = Calendar.getInstance().get(Calendar.YEAR);
		String currentyear=String.valueOf(endYear);
		for(int year=endYear-100;year<= endYear+100; year++) {
			String y=String.valueOf(year);
			years.add(y);
		}
		Resume resume = resumes.findById(id);
		List<Education> educationId = educations.byResume(resume);
		List<Experiance> experianceId = experiances.byResume(resume);
		List<Headerinfo> headerinfoId = headerinfos.byResume(resume);
		List<Honors> honorsId = honors.byResume(resume);
		List<Projects> projectsId = projects.byResume(resume);
		List<Skills> skillsId = skills.byResume(resume);
		try {
			Long userId = (Long) session.getAttribute("userId");
			model.addAttribute("user", users.findById(userId));
			model.addAttribute("resume", resume);
			model.addAttribute("alleducations", educationId);
			model.addAttribute("allexperiances", experianceId);
			model.addAttribute("allheaderinfos", headerinfoId);
			model.addAttribute("allhonors", honorsId);
			model.addAttribute("allprojects", projectsId);
			model.addAttribute("allskills", skillsId);
			model.addAttribute("allyears", years);
			
			if(secID==1) {
				return "headerinfo_edit.jsp";
			}
			if(secID==2) {
				return "education_edit.jsp";
			}
			if(secID==3) {
				return "skill_edit.jsp";
			}
			if(secID==4) {
				return "experiance_edit.jsp";
			}
			if(secID==5) {
				return "project_edit.jsp";
			}
			if(secID==6) {
				return "honor_edit.jsp";
			}
			else {
				return "dashboard.jsp"; 
			}
		} catch (Exception e) {
			model.addAttribute("allresumes", educationId);
			return "dashboard.jsp";
		}
	}
	
	@GetMapping("/add/education/{id}")
	public String newresume(@PathVariable("id") Long id,@ModelAttribute("education") Education education,Model model,HttpSession session,BindingResult result ) {
		try {
			List<String> years = new ArrayList<String>();
			int endYear = Calendar.getInstance().get(Calendar.YEAR);
			String currentyear=String.valueOf(endYear);
			for(int year=endYear-100;year<= endYear+100; year++) {
				String y=String.valueOf(year);
				years.add(y);
			}
				Resume resume = resumes.findById(id);
				List<Education> educationId = educations.byResume(resume);
				model.addAttribute("education", new Education());
				model.addAttribute("alleducations", educationId);
				model.addAttribute("currentyear", currentyear);
				model.addAttribute("allyears", years);
				model.addAttribute("resume", resume);
				return "education.jsp";	
		}
		catch(Exception e){
			return "redirect:/login_user";
		}
	}
	@GetMapping("/add/experience/{id}")
	public String newresume(@PathVariable("id") Long id,@ModelAttribute("experiance") Experiance experiance,Model model,HttpSession session,BindingResult result) {
		try {
			List<String> years = new ArrayList<String>();
			int endYear = Calendar.getInstance().get(Calendar.YEAR);
			String currentyear=String.valueOf(endYear);
			for(int year=endYear-100;year<= endYear+100; year++) {
				String y=String.valueOf(year);
				years.add(y);
			}
			Resume resume = resumes.findById(id);
			List<Experiance> experianceId = experiances.byResume(resume);
			if (result.hasErrors()) {
				return "experiance.jsp";
			}
			else {
			model.addAttribute("allexperiances", experianceId);
			model.addAttribute("experiance", new Experiance());
			model.addAttribute("allyears", years);
			model.addAttribute("currentyear", currentyear);
			model.addAttribute("resume", resume);
			return "experiance.jsp";
			}
		}
		catch(Exception e){
			return "redirect:/login_user";
		}
	}
	@GetMapping("/add/headerinfo/{id}")
	public String newresume(@PathVariable("id") Long id,@ModelAttribute("headerinfo") Headerinfo headerinfo,Model model,HttpSession session ) {
		try {
			Resume resume = resumes.findById(id);
			User user = users.findById((Long)session.getAttribute("userId"));
			model.addAttribute("headerinfo", new Headerinfo());
			model.addAttribute("resume", resume);
			model.addAttribute("user", user);
			return "headerinfo.jsp";
		}
		catch(Exception e){
			return "redirect:/login_user";
		}
	}
	@GetMapping("/add/honors/{id}")
	public String newresume(@PathVariable("id") Long id,@ModelAttribute("honor") Honors honor,Model model,HttpSession session ) {
		try {
			List<String> years = new ArrayList<String>();
			int endYear = Calendar.getInstance().get(Calendar.YEAR);
			String currentyear=String.valueOf(endYear);
			for(int year=endYear-100;year<= endYear+100; year++) {
				String y=String.valueOf(year);
				years.add(y);
			}
			Resume resume = resumes.findById(id);
			List<Honors> honorsId = honors.byResume(resume);
			model.addAttribute("allhonors", honorsId);
			model.addAttribute("honor", new Honors());
			model.addAttribute("allyears", years);
			model.addAttribute("currentyear", currentyear);
			model.addAttribute("resume", resume);
			return "honor.jsp";
		}
		catch(Exception e){
			return "redirect:/login_user";
		}
	}
	@GetMapping("/add/projects/{id}")
	public String newresume(@PathVariable("id") Long id,@ModelAttribute("project") Projects project,Model model,HttpSession session ) {
		try {
			List<String> years = new ArrayList<String>();
			int endYear = Calendar.getInstance().get(Calendar.YEAR);
			String currentyear=String.valueOf(endYear);
			for(int year=endYear-100;year<= endYear+100; year++) {
				String y=String.valueOf(year);
				
				years.add(y);
			}
			Resume resume = resumes.findById(id);
			List<Projects> projectsId = projects.byResume(resume);
			model.addAttribute("allprojects", projectsId);
			model.addAttribute("project", new Projects());
			model.addAttribute("allyears", years);
			model.addAttribute("currentyear", currentyear);
			model.addAttribute("resume", resume);
			return "project.jsp";
		}
		catch(Exception e){
			return "redirect:/login_user";
		}
	}
	@GetMapping("/add/skill/{id}")
	public String newresume(@PathVariable("id") Long id,@ModelAttribute("skill") Skills skill,Model model,HttpSession session ) {
		try {
			
			Resume resume = resumes.findById(id);
			List<Skills> skillsId = skills.byResume(resume);
			model.addAttribute("allskills", skillsId);
			model.addAttribute("skill", new Skills());
			model.addAttribute("resume", resume);
			return "skill.jsp";
		}
		catch(Exception e){
			return "redirect:/login_user";
		}
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("userId", null);
		return "redirect:/";
	}

	// POST Routes
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {
		User user = users.login(newLogin, result);
		if (result.hasErrors() || user == null) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/create";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {
		User user = users.register(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/";
	}
	@PostMapping("/resume/new")
	public String creatingresume(@Valid @ModelAttribute("resume") Resume resume, BindingResult result,HttpSession session) {
		
			if(result.hasErrors()) {
				return "resumeinfoform.jsp";
			}
			Resume resume1 = resumes.create(resume);
			session.setAttribute("resumeId", resume1.getId());
			return "redirect:/add/headerinfo/"+resume1.getId();
	}
	@PostMapping("/edu/new/{id}")
	public String creatingeducation(@PathVariable("id") Long id,@Valid @ModelAttribute("education") Education education, BindingResult result,Model model) {
		if (result.hasErrors()) {
			List<String> years = new ArrayList<String>();
			int endYear = Calendar.getInstance().get(Calendar.YEAR);
			String currentyear=String.valueOf(endYear);
			for(int year=endYear-100;year<= endYear+100; year++) {
				String y=String.valueOf(year);
				years.add(y);
			}
			model.addAttribute("allyears", years);
			model.addAttribute("currentyear", currentyear);
			return "education.jsp";
		}
		educations.create(education);
			return "redirect:/add/education/"+ id;
	}

	@PostMapping("/exp/new/{id}")
	public String creatingexperiance(@PathVariable("id") Long id,@Valid @ModelAttribute("experiance") Experiance experiance, BindingResult result,Model model) {
		if (result.hasErrors()) {
			List<String> years = new ArrayList<String>();
			int endYear = Calendar.getInstance().get(Calendar.YEAR);
			String currentyear=String.valueOf(endYear);
			for(int year=endYear-100;year<= endYear+100; year++) {
				String y=String.valueOf(year);
				years.add(y);
			}
			model.addAttribute("currentyear", currentyear);
			model.addAttribute("allyears", years);
			return "experiance.jsp";
		}
		experiances.create(experiance);
		return "redirect:/add/experience/"+ id;
	}
	@PostMapping("/hdr/new/{id}")
	public String creatingheaderinfo(@PathVariable("id") Long id,@Valid @ModelAttribute("headerinfo") Headerinfo headerinfo, BindingResult result,HttpSession session) {
		headerinfos.create(headerinfo);
		return "redirect:/add/education/"+ id;
	}
	@PostMapping("/hrs/new/{id}")
	public String creatinghonor(@PathVariable("id") Long id,@Valid 	@ModelAttribute("honor") Honors honor, BindingResult result,Model model,HttpSession session) {
		if (result.hasErrors()) {
			List<String> years = new ArrayList<String>();
			int endYear = Calendar.getInstance().get(Calendar.YEAR);
			String currentyear=String.valueOf(endYear);
			for(int year=endYear-100;year<= endYear+100; year++) {
				String y=String.valueOf(year);
				years.add(y);
			}
			model.addAttribute("currentyear", currentyear);
			model.addAttribute("allyears", years);
			return "honor.jsp";
		}
		honors.create(honor);
		return "redirect:/add/honors/"+ id;
	}
	@PostMapping("/prj/new/{id}")
	public String creatingproject(@PathVariable("id") Long id,@Valid @ModelAttribute("project") Projects project, BindingResult result,Model model) {
		if (result.hasErrors()) {
			List<String> years = new ArrayList<String>();
			int endYear = Calendar.getInstance().get(Calendar.YEAR);
			String currentyear=String.valueOf(endYear);
			for(int year=endYear-100;year<= endYear+100; year++) {
				String y=String.valueOf(year);
				years.add(y);
			}
			model.addAttribute("currentyear", currentyear);
			model.addAttribute("allyears", years);
			return "project.jsp";
		}
		projects.create(project);
		return "redirect:/add/projects/"+ id;
	}
	@PostMapping("/skl/new/{id}")
	public String creatingskill(@PathVariable("id") Long id,@Valid @ModelAttribute("skill") Skills skill, BindingResult result) {
		if (result.hasErrors()) {
			return "skill.jsp";
		}
		skills.create(skill);
		return "redirect:/add/skill/"+ id;
	}
	@PutMapping("/resume/{id}/{pid}/update_education")
<<<<<<< HEAD
	public String updatingeducation(Model model,@PathVariable("pid") Long pid,@PathVariable("id") Long id,@Valid @ModelAttribute("education") Education education, BindingResult result) {
=======
	public String updatingeducation(@PathVariable("pid") Long pid,@PathVariable("id") Long id,@Valid @ModelAttribute("education") Education education, BindingResult result) {
>>>>>>> 1b6e5dab8e4fb71bfbf2d161e2db0a0d4cdc9a23
			if(result.hasErrors()) {
				List<String> years = new ArrayList<String>();
				int endYear = Calendar.getInstance().get(Calendar.YEAR);
				String currentyear=String.valueOf(endYear);
				for(int year=endYear-100;year<= endYear+100; year++) {
					String y=String.valueOf(year);
					years.add(y);
				}
				Resume resume = resumes.findById(id);
				model.addAttribute("allyears", years);
				model.addAttribute("currentyear", currentyear);
				model.addAttribute("alleducations", educations.byResume(resume));
				model.addAttribute("resume", resume);
				return "education_edit.jsp";}
			Education thisedu=educations.find(pid);
			education.setId(thisedu.getId());
			educations.update(education);
			return "redirect:/resume/"+id+"/edit/2";
	}
	@PutMapping("/resume/{id}/{pid}/update_experiance")
<<<<<<< HEAD
	public String updatingexperiance(Model model,@PathVariable("pid") Long pid,@PathVariable("id") Long id,@Valid @ModelAttribute("experiance") Experiance experiance, BindingResult result) {
			if(result.hasErrors()) {
				List<String> years = new ArrayList<String>();
				int endYear = Calendar.getInstance().get(Calendar.YEAR);
				String currentyear=String.valueOf(endYear);
				for(int year=endYear-100;year<= endYear+100; year++) {
					String y=String.valueOf(year);
					years.add(y);
				}
				Resume resume = resumes.findById(id);
				model.addAttribute("allyears", years);
				model.addAttribute("currentyear", currentyear);
				model.addAttribute("allexperiances", experiances.byResume(resume));
				model.addAttribute("resume", resume);
=======
	public String updatingexperiance(@PathVariable("pid") Long pid,@PathVariable("id") Long id,@Valid @ModelAttribute("experiance") Experiance experiance, BindingResult result) {
			if(result.hasErrors()) {
>>>>>>> 1b6e5dab8e4fb71bfbf2d161e2db0a0d4cdc9a23
				return "experiance_edit.jsp";
			}
			Experiance thisexp=experiances.find(pid);
			experiance.setId(thisexp.getId());
			experiances.update(experiance);
			return "redirect:/resume/"+id+"/edit/4";
	}
	@PutMapping("/resume/{id}/{pid}/update_project")
	public String updatingproject(Model model,@PathVariable("pid") Long pid,@PathVariable("id") Long id,@Valid @ModelAttribute("project") Projects project, BindingResult result) {
			if(result.hasErrors()) {
				List<String> years = new ArrayList<String>();
				int endYear = Calendar.getInstance().get(Calendar.YEAR);
				String currentyear=String.valueOf(endYear);
				for(int year=endYear-100;year<= endYear+100; year++) {
					String y=String.valueOf(year);
					years.add(y);
				}
				Resume resume = resumes.findById(id);
				model.addAttribute("allyears", years);
				model.addAttribute("currentyear", currentyear);
				model.addAttribute("allprojects", projects.byResume(resume));
				model.addAttribute("resume", resume);
				return "project_edit.jsp";
			}
			Projects thisprj=projects.find(pid);
			project.setId(thisprj.getId());
			projects.update(project);
			return "redirect:/resume/"+id+"/edit/5";
	}
	@PutMapping("/resume/{id}/{pid}/update_skill")
<<<<<<< HEAD
	public String updatingskill(Model model,@PathVariable("pid") Long pid,@PathVariable("id") Long id,@Valid @ModelAttribute("skill") Skills skill,BindingResult result) {
			if(result.hasErrors()) {
				List<String> years = new ArrayList<String>();
				int endYear = Calendar.getInstance().get(Calendar.YEAR);
				String currentyear=String.valueOf(endYear);
				for(int year=endYear-100;year<= endYear+100; year++) {
					String y=String.valueOf(year);
					years.add(y);
				}
				Resume resume = resumes.findById(id);
				model.addAttribute("allyears", years);
				model.addAttribute("currentyear", currentyear);
				model.addAttribute("allskills", skills.byResume(resume));
				model.addAttribute("resume", resume);
=======
	public String updatingskill(@PathVariable("pid") Long pid,@PathVariable("id") Long id,@Valid @ModelAttribute("skill") Skills skill,BindingResult result) {
			if(result.hasErrors()) {
>>>>>>> 1b6e5dab8e4fb71bfbf2d161e2db0a0d4cdc9a23
				return "skill_edit.jsp";
			}
			Skills thisskl=skills.find(pid);
			skill.setId(thisskl.getId());
			skills.update(skill);
			return "redirect:/resume/"+id+"/edit/3";
	}
	@PutMapping("/resume/{id}/{pid}/update_honor")
<<<<<<< HEAD
	public String updatinghonor(Model model,@PathVariable("pid") Long pid,@PathVariable("id") Long id,@Valid @ModelAttribute("honor") Honors honor, BindingResult result) {
			if(result.hasErrors()) {
				List<String> years = new ArrayList<String>();
				int endYear = Calendar.getInstance().get(Calendar.YEAR);
				String currentyear=String.valueOf(endYear);
				for(int year=endYear-100;year<= endYear+100; year++) {
					String y=String.valueOf(year);
					years.add(y);
				}
				Resume resume = resumes.findById(id);
				model.addAttribute("allyears", years);
				model.addAttribute("currentyear", currentyear);
				model.addAttribute("allhonors", honors.byResume(resume));
				model.addAttribute("resume", resume);
=======
	public String updatinghonor(@PathVariable("pid") Long pid,@PathVariable("id") Long id,@Valid @ModelAttribute("honor") Honors honor, BindingResult result) {
			if(result.hasErrors()) {
>>>>>>> 1b6e5dab8e4fb71bfbf2d161e2db0a0d4cdc9a23
				return "honor_edit.jsp";
			}
			Honors thishrs=honors.find(pid);
			honor.setId(thishrs.getId());
			honors.update(honor);
			return "redirect:/resume/"+id+"/edit/6";
	}
	@PutMapping("/resume/{id}/{pid}/update_headerinfo")
<<<<<<< HEAD
	public String updatingheaderinfo(Model model,@PathVariable("pid") Long pid,@PathVariable("id") Long id,@Valid @ModelAttribute("headerinfo") Headerinfo headerinfo,BindingResult result) {
			if(result.hasErrors()) {
				List<String> years = new ArrayList<String>();
				int endYear = Calendar.getInstance().get(Calendar.YEAR);
				String currentyear=String.valueOf(endYear);
				for(int year=endYear-100;year<= endYear+100; year++) {
					String y=String.valueOf(year);
					years.add(y);
				}
				Resume resume = resumes.findById(id);
				model.addAttribute("allyears", years);
				model.addAttribute("currentyear", currentyear);
				model.addAttribute("headerinfos", headerinfos.byResume(resume));
				model.addAttribute("resume", resume);
=======
	public String updatingheaderinfo(@PathVariable("pid") Long pid,@PathVariable("id") Long id,@Valid @ModelAttribute("headerinfo") Headerinfo headerinfo,BindingResult result) {
			if(result.hasErrors()) {
>>>>>>> 1b6e5dab8e4fb71bfbf2d161e2db0a0d4cdc9a23
				return "headerinfo_edit.jsp";
			}
			Headerinfo thishdr=headerinfos.find(pid);
			headerinfo.setId(thishdr.getId());
			headerinfos.update(headerinfo);
			return "redirect:/resume/"+id+"/edit/1";
	}
	
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		resumes.delete(id);
		return "redirect:/";
	}
	@DeleteMapping("/delete/{pid}/{secId}/{id}")
	public String deletesection(Model model,@PathVariable("pid") Long pid,@PathVariable("id") Long id,@PathVariable("secId") int secId,HttpSession session) {
		if(secId== 1) {
			model.addAttribute("resume", resumes.find(id));
			headerinfos.delete(pid);
			return "redirect:/add/headerinfo/"+ id;
		}
		if(secId==2) {
			educations.delete(pid);
			return "redirect:/add/education/"+ id;
		}
		if(secId==3) {
			skills.delete(pid);
			return "redirect:/add/skill/"+ id;
		}
		if(secId==4) {
			model.addAttribute("resume", resumes.find(id));
			experiances.delete(pid);
			return "redirect:/add/experience/"+ id;
		}
		if(secId==5) {
			model.addAttribute("resume", resumes.find(id));
			projects.delete(pid);
			return "redirect:/add/projects/"+ id;
		}
		if(secId==6) {
			model.addAttribute("resume", resumes.find(id));
			honors.delete(pid);
			return "redirect:/add/honors/"+ id;
		}
		return "redirect:/";
	}

}