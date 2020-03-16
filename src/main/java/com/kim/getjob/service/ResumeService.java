package com.kim.getjob.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kim.getjob.model.resume.dto.ReqResumeBasicDto;
import com.kim.getjob.model.resume.dto.ReqResumeEducationDto;
import com.kim.getjob.model.resume.dto.ReqResumeUniversityDto;
import com.kim.getjob.model.resume.dto.ReqResumeWriteDto;
import com.kim.getjob.model.resume.dto.RespResumeBasicDto;
import com.kim.getjob.model.resume.dto.RespResumeEducationDto;
import com.kim.getjob.model.resume.dto.RespResumeUniversityDto;
import com.kim.getjob.model.resume.dto.RespResumeWriteDto;
import com.kim.getjob.repository.ResumeRepository;

@Service
public class ResumeService {

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

	public List<RespResumeBasicDto> 이력서목록보기(int userId) {

		return resumeRepository.resumeBasicfindId(userId);
	}

	public List<RespResumeBasicDto> basic이력서미리보기(int id) {

		return resumeRepository.resumeBasicfindAll(id);
	}

	public List<RespResumeEducationDto> education이력서미리보기(int id) {

		return resumeRepository.resumeEducationfindAll(id);
	}

	public List<RespResumeUniversityDto> University이력서미리보기(int id) {
		
		return resumeRepository.resumeUniversityfindAll(id);
	}

}
