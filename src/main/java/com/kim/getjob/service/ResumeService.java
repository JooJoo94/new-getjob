package com.kim.getjob.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kim.getjob.model.ReturnCode;
import com.kim.getjob.model.resume.Resume_Basic;
import com.kim.getjob.model.resume.dto.ReqResumeBasicDto;
import com.kim.getjob.model.resume.dto.ReqResumeEducationDto;
import com.kim.getjob.model.resume.dto.ReqResumeUniversityDto;
import com.kim.getjob.model.resume.dto.ReqResumeWriteDto;
import com.kim.getjob.model.resume.dto.RespResumeBasicDto;
import com.kim.getjob.model.resume.dto.RespResumeEducationDto;
import com.kim.getjob.model.resume.dto.RespResumeUniversityDto;
import com.kim.getjob.model.resume.dto.RespResumeWriteDto;
import com.kim.getjob.model.user.User;
import com.kim.getjob.repository.ResumeRepository;

@Service
public class ResumeService {
	
	@Autowired
	private HttpSession session;

	@Autowired
	private ResumeRepository resumeRepository;

	public int 이력서쓰기(ReqResumeWriteDto dto) {

		ReqResumeBasicDto reqResumeBasicDto = dto.getReqResumeBasicDto();
		resumeRepository.resumeSaveBasic(reqResumeBasicDto);

		ReqResumeEducationDto reqEducationDto = dto.getReqResumeEducationDto();
		reqEducationDto.setId(reqResumeBasicDto.getId());
		resumeRepository.resumeSaveEducation(reqEducationDto);

		if (dto.getReqResumeEducationDto().getLevel() == 4) {

			ReqResumeUniversityDto reqUniversityDto = dto.getReqResumeUniversityDto();
			reqUniversityDto.setId(reqResumeBasicDto.getId());
			resumeRepository.resumeSaveUniversity(reqUniversityDto);
		}

		return resumeRepository.resumeSaveBasic(reqResumeBasicDto);
	}

	// 나의 이력서 목록
	public List<RespResumeBasicDto> 이력서목록보기(int userId) {

		return resumeRepository.resumeBasicfindByUserId(userId);
	}
	
	public RespResumeBasicDto basic이력서(int id) {

		return resumeRepository.resumeBasicfindById(id);
	}

	public RespResumeEducationDto education이력서(int id) {

		return resumeRepository.resumeEducationfindById(id);
	}

	public RespResumeUniversityDto University이력서(int id) {
		
		return resumeRepository.resumeUniversityfindById(id);
	}
	
	public int 이력서수정완료(ReqResumeWriteDto dto) {
		
		User principal = (User) session.getAttribute("principal");
		RespResumeBasicDto respResumeBasicDto = resumeRepository.resumeBasicfindById(dto.getReqResumeBasicDto().getId());
		
		if(principal.getId() == respResumeBasicDto.getUserId()) {
			int result = resumeRepository.resumeBasicUpdate(dto.getReqResumeBasicDto()) 
					+ resumeRepository.resumeEducationUpdate(dto.getReqResumeEducationDto());
			if (dto.getReqResumeEducationDto().getLevel() == 4) {
						result += resumeRepository.resumeUniversityUpdate(dto.getReqResumeUniversityDto());
					}
			return result; 
		}else {
			return ReturnCode.권한없음; 
		}		
	}

}
