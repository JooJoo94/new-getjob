package com.kim.getjob.model.resume.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RespResumeBasicDto {
	
	private int id;
	private int userId;
	private String title;
	private String name;
	private int birth;
	private String email;
	private String phone;
	private String sample_address;
	private String sample_detailAddress;
	private Timestamp createDate;

}
