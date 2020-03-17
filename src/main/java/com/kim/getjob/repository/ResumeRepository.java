package com.kim.getjob.repository;

import java.util.List;

import com.kim.getjob.model.resume.dto.ReqResumeBasicDto;
import com.kim.getjob.model.resume.dto.ReqResumeEducationDto;
import com.kim.getjob.model.resume.dto.ReqResumeUniversityDto;
import com.kim.getjob.model.resume.dto.ReqResumeWriteDto;
import com.kim.getjob.model.resume.dto.RespResumeBasicDto;
import com.kim.getjob.model.resume.dto.RespResumeEducationDto;
import com.kim.getjob.model.resume.dto.RespResumeUniversityDto;

public interface ResumeRepository {
	
	public int resumeSaveBasic(ReqResumeBasicDto dto);
	public int resumeSaveEducation(ReqResumeEducationDto dto);
	public int resumeSaveUniversity(ReqResumeUniversityDto dto);
	
	public List<RespResumeBasicDto> resumeBasicfindByUserId(int userId);
	
	public RespResumeBasicDto resumeBasicfindById(int id);
	public RespResumeEducationDto resumeEducationfindById(int id);
	public RespResumeUniversityDto resumeUniversityfindById(int id);
	
	public int resumeBasicUpdate(ReqResumeBasicDto dto);
	public int resumeEducationUpdate(ReqResumeEducationDto dto);
	public int resumeUniversityUpdate(ReqResumeUniversityDto dto);

}
