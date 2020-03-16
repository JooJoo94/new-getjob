package com.kim.getjob.model.resume.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RespResumeEducationDto {
	
	private int id;
	private int level;
	private String schoolName;
	private String local;
	private String startYear;
	private String endYear;

}
