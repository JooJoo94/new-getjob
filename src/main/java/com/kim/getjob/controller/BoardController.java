package com.kim.getjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.kim.getjob.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping({"", "/", "/board"})
	public String posts(Model model) {
		model.addAttribute("boards", boardService.목록보기());

		return "/board/main";
	}
	
	@GetMapping("/board/resume")
	public String resume(Model model) {
		

		return "/board/resume";
	}
	
	@GetMapping("/board/categoryList/{num}")
	public String categoryList(@PathVariable int num, Model model) {

		boardService.카테고리별목록보기(num);
		return "/board/categoryList";
	}

	

}