package com.kim.getjob.model.resume.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RespResumeWriteDto {

	private ReqResumeBasicDto reqResumeBasicDto;
	private ReqResumeEducationDto reqResumeEducationDto;
	private ReqResumeUniversityDto reqResumeUniversityDto;
}
