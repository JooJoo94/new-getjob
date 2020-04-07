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

import com.kim.getjob.model.board.Criteria;
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
			for (Element el : element) {
				RespListDto dto = new RespListDto();
				dto.setImage(el.select("span.product_logo img").attr("src"));
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
		String url = "https://www.saramin.co.kr/zf_user/jobs/list/job-category?cat_cd=" + num
				+ "&panel_type=&search_optional_item=n&search_done=y&panel_count=y";
		List<RespListDto> list = new ArrayList<>();
		
		try {
			Connection conn = Jsoup.connect(url).header("Content-Type", "text/html;charset=UTF-8").userAgent(USER_AGENT)
					.method(Connection.Method.GET).ignoreContentType(true);

			Document doc = conn.get();
			Elements elements = doc.select(".wrap_list_banner ul.unit_list");
			for (Element el : elements) {
				Elements li_elements = el.select(">li");
				for (Element li_el : li_elements) {						
					RespListDto dto = new RespListDto();
					dto.setImage(li_el.select("span.company_ci img").attr("src"));
					dto.setCompanyName(li_el.select("h3.company_name").text());
					dto.setTitle(li_el.select("h4.recruit_name").text());
					dto.setDeadLine(li_el.select("span.dday").text());
					dto.setHref(li_el.select("a").attr("href"));
					list.add(dto);
				}

			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<RespListDto> 검색어목록보기(String searchWord) {
		String url = "http://www.saramin.co.kr/zf_user/search?search_area=main&search_done="
				+ "y&search_optional_item=n&searchType=default_mysearch&searchword="
				+ searchWord;
		List<RespListDto> list = new ArrayList<>();
		
		try {
			Connection conn = Jsoup.connect(url).header("Content-Type", "text/html;charset=UTF-8").userAgent(USER_AGENT)
					.method(Connection.Method.GET).ignoreContentType(true);

			Document doc = conn.get();
			Elements elements = doc.select("#recruit_info .item_recruit");
			//System.out.println(elements);
			for (Element el : elements) {					
					RespListDto dto = new RespListDto();
					dto.setTitle(el.select("a").attr("title"));
					dto.setCompanyName(el.select("div.area_corp span").text());
					dto.setDeadLine(el.select("div.job_date span").text());
					dto.setHref(el.select("a").attr("href"));
					list.add(dto);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
}
