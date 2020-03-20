package com.kim.getjob.model.resume.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RespResumeUniversityDto {
	
	private int id;
	private String schoolName;
	private String local;
	private String major;
	private String startYear;
	private String endYear;
	private float score;
	

}
