package com.kim.getjob.model.resume.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqResumeWriteDto {
	
	private ReqResumeBasicDto reqResumeBasicDto;
	private ReqResumeEducationDto reqResumeEducationDto;
	private ReqResumeUniversityDto reqResumeUniversityDto;


}
