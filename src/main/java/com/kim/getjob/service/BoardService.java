package com.kim.getjob.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.kim.getjob.model.board.RespListDto;

@Service
public class BoardService {
	private final static String USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36";
	
	public List<RespListDto> 목록보기() {
		String url = "https://www.saramin.co.kr/zf_user/";
		List<RespListDto> list = new ArrayList<>();
		

		try {
			Connection conn = Jsoup.connect(url).header("Content-Type", "text/html;charset=UTF-8").userAgent(USER_AGENT)
					.method(Connection.Method.GET).ignoreContentType(true);
			
			Document doc = conn.get();
			Elements element = doc.select("#_platinum li");
			for(Element el : element) {
				RespListDto dto = new RespListDto();
				  dto.setCompanyName(el.select("strong.poduct_tit").text());
				  dto.setTitle(el.select("em.product_desc").text());
				  dto.setDeadLine(el.select(".recruit_func").select(".num_dday").text());
				  dto.setHref(el.select("a").attr("href"));
				  list.add(dto); 	

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<RespListDto> 카테고리별목록보기(int num) {
		String url = "https://www.saramin.co.kr/zf_user/jobs/list/job-category?cat_cd=" + num + "&panel_type=&search_optional_item=n&search_done=y&panel_count=y";
		List<RespListDto> list = new ArrayList<>();
		

		try {
			Connection conn = Jsoup.connect(url).header("Content-Type", "text/html;charset=UTF-8").userAgent(USER_AGENT)
					.method(Connection.Method.GET).ignoreContentType(true);
			
			Document doc = conn.get();
			Elements element = doc.select(".wrap_list_banner ul.unit_list");
			System.out.println("element---");
			System.out.println(element);
			System.out.println("end element");
			for(Element el : element) {
				RespListDto dto = new RespListDto();
				  dto.setCompanyName(el.select("strong.poduct_tit").text());
				  dto.setTitle(el.select("em.product_desc").text());
				  dto.setDeadLine(el.select(".recruit_func").select(".num_dday").text());
				  dto.setHref(el.select("a").attr("href"));
				  list.add(dto); 	

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
}
