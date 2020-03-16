package com.kim.getjob.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.kim.getjob.model.RespCM;
import com.kim.getjob.model.resume.dto.ReqResumeWriteDto;
import com.kim.getjob.model.user.User;
import com.kim.getjob.service.ResumeService;

@Controller
public class ResumeController {

	@Autowired
	private HttpSession session;

	@Autowired
	private ResumeService resumeService;
	
	@GetMapping("/resume/resumePreview/{id}")
	public String resumeCheck(@PathVariable int id, Model model) {
		System.out.println("----");
		model.addAttribute("basic", resumeService.basic이력서미리보기(id));
		System.out.println("basic = " + resumeService.basic이력서미리보기(id));
		model.addAttribute("education", resumeService.education이력서미리보기(id));
		
		if(resumeService.education이력서미리보기(id).get(0).getLevel()==4) {
			model.addAttribute("university", resumeService.University이력서미리보기(id));
		}
		
		return "/board/resumePreview";
	}
	
	@GetMapping("/resume/resumeList")
	public String resumeList(Model model) {
		
		User principal = (User) session.getAttribute("principal");
		model.addAttribute("resumes", resumeService.이력서목록보기(principal.getId()));

		return "/board/resumeList";
	}	

	@PostMapping("/resume/write")
	public ResponseEntity<?> write(@RequestBody ReqResumeWriteDto dto) {

		User principal = (User) session.getAttribute("principal");
		dto.getReqResumeBasicDto().setUserId(principal.getId());
		int result = resumeService.이력서쓰기(dto);

		if (result == 1) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}

	}

}
