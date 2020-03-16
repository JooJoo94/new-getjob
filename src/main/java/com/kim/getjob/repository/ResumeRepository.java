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
	public List<RespResumeBasicDto> resumeBasicfindAll(int id);
	public List<RespResumeEducationDto> resumeEducationfindAll(int id);
	public List<RespResumeUniversityDto> resumeUniversityfindAll(int id);
	public List<RespResumeBasicDto> resumeBasicfindId(int userId);

}
