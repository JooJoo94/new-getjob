package com.kim.getjob.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.kim.getjob.model.RespCM;
import com.kim.getjob.model.ReturnCode;
import com.kim.getjob.model.user.User;
import com.kim.getjob.model.user.dto.ReqJoinDto;
import com.kim.getjob.model.user.dto.ReqLoginDto;
import com.kim.getjob.service.UserService;


@Controller
public class UserController {
	
	@Value("${file.path}")
	private String fileRealPath;  // 서버에 배포하면 경로 변경해야함.

	@Autowired
	private UserService userService;
	
	@Autowired
	private HttpSession session;

	@GetMapping("/user/login")
	public String login(Model model) {

		return "/user/login";
	}
	
	@GetMapping("/user/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/user/login")
	public ResponseEntity<?> login(@Valid @RequestBody ReqLoginDto dto, BindingResult bindResult) {

		// 서비스 호출
		User principal = userService.로그인(dto);
		
		if (principal != null) {
			session.setAttribute("principal", principal);
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(400, "fail"), HttpStatus.BAD_REQUEST);
		}

	}


	@GetMapping("/user/join")
	public String join(Model model) {

		return "/user/join";
	}

	@PostMapping("/user/join")
	public ResponseEntity<?> join(@Valid @RequestBody ReqJoinDto dto, BindingResult bindingResult) {		
		int result = userService.회원가입(dto);
		
		if (result == ReturnCode.아이디중복) {
			return new ResponseEntity<RespCM>(new RespCM(ReturnCode.아이디중복, "아이디중복"), HttpStatus.OK);
		} else if (result == ReturnCode.성공) {
			return new ResponseEntity<RespCM>(new RespCM(200, "ok"), HttpStatus.OK);
		} else {
			return new ResponseEntity<RespCM>(new RespCM(500, "fail"), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
