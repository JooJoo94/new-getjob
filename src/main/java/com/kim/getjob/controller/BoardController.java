package com.kim.getjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.kim.getjob.model.board.Criteria;
import com.kim.getjob.model.board.PageMaker;
import com.kim.getjob.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping({"", "/", "/board"})
	public String posts(@ModelAttribute Criteria cri, Model model) {
		model.addAttribute("boards", boardService.목록보기());
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);		
		pageMaker.setTotalCount(boardService.목록보기().size());
		model.addAttribute("pageMaker", pageMaker);
		return "/board/main";
	}
	
	@GetMapping("/board/categoryList/{num}")
	public String categoryList(@ModelAttribute Criteria cri, @PathVariable int num, Model model) {
		model.addAttribute("jobs", boardService.카테고리별목록보기(num));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);		
		pageMaker.setTotalCount(boardService.카테고리별목록보기(num).size());
		model.addAttribute("pageMaker", pageMaker);
		return "/board/categoryList";
	}

	@GetMapping("/board/searchList")
	public String searchList(@RequestParam("wordSubmit") String searchWord, @RequestParam("categorySubmit") String searchCategory, Model model) {
		model.addAttribute("jobs", boardService.검색어목록보기(searchWord, searchCategory));
		return "/board/searchList";
	}


}
