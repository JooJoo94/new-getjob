package com.kim.getjob.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.kim.getjob.model.board.Criteria;
import com.kim.getjob.model.board.PageMaker;
import com.kim.getjob.model.board.RespListDto;
import com.kim.getjob.service.BoardService;

@Controller
public class BoardController {
	List<RespListDto> list = null;

	@Autowired
	private BoardService boardService;

	// 메인 페이지
	@GetMapping({ "", "/", "/board" })
	public String posts(@ModelAttribute Criteria cri, Model model) {
		List<RespListDto> mainList = boardService.목록보기();
		List<RespListDto> submainList = new ArrayList<RespListDto>();
		list = mainList;

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.목록보기().size());
		int start = pageMaker.getCri().getPageStart();
		for (int i = start; i < start + 4; i++) {
			submainList.add(mainList.get(i));
		}

		model.addAttribute("boards", submainList);
		model.addAttribute("pageMaker", pageMaker);
		return "/board/main";
	}

	// 메인 페이지 Paging
	@GetMapping("/board/page/{num}")
	public String page(@ModelAttribute Criteria cri, @PathVariable int num, Model model) {
		List<RespListDto> mainList = boardService.목록보기();
		List<RespListDto> submainList = new ArrayList<RespListDto>();
		PageMaker pageMaker = new PageMaker();
		cri.setPage(num);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.목록보기().size());
		int start = pageMaker.getCri().getPageStart();
		for (int i = start; i < start + 5; i++) {
			submainList.add(mainList.get(i));
		}
		model.addAttribute("boards", submainList);
		model.addAttribute("pageMaker", pageMaker);

		return "/board/main";
	}

	// 카테고리 페이지
	@GetMapping("/board/categoryList")
	public String categoryList(@ModelAttribute Criteria cri, @RequestParam("categoryNum") int categoryNum,
			@RequestParam("pageNum") int pageNum, Model model) {
		List<RespListDto> categoryList = boardService.카테고리별목록보기(categoryNum);
		List<RespListDto> subCategoryList = new ArrayList<RespListDto>();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.카테고리별목록보기(categoryNum).size());
		int start = pageMaker.getCri().getPageStart();
		for (int i = start; i < start + 5; i++) {
			subCategoryList.add(categoryList.get(i));
		}
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("jobs", subCategoryList);
		model.addAttribute("pageMaker", pageMaker);
		return "/board/categoryList";
	}

	// 카테고리 페이지 Paging
	@GetMapping("/board/categoryListPaging")
	public String categoryListPaging(@ModelAttribute Criteria cri, @RequestParam("categoryNum") int categoryNum,
			@RequestParam("pageNum") int pageNum, Model model) {
		List<RespListDto> categoryList = boardService.카테고리별목록보기(categoryNum);
		List<RespListDto> subCategoryList = new ArrayList<RespListDto>();

		PageMaker pageMaker = new PageMaker();
		cri.setPage(pageNum);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.카테고리별목록보기(categoryNum).size());
		int start = pageMaker.getCri().getPageStart();
		for (int i = start; i < start + 5; i++) {
			subCategoryList.add(categoryList.get(i));
		}
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("jobs", subCategoryList);
		model.addAttribute("pageMaker", pageMaker);
		return "/board/categoryList";
	}

	@GetMapping("/board/searchList")
	public String searchList(@RequestParam("wordSubmit") String searchWord,
			@RequestParam("categorySubmit") String searchCategory, Model model) {
		model.addAttribute("jobs", boardService.검색어목록보기(searchWord, searchCategory));
		return "/board/searchList";
	}

}
