package com.kim.getjob.model.resume.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqResumeBasicDto {
	
	private int id;
	private int userId;
	
	@NotBlank(message = "제목을 입력하세요.")
	private String title;
	@NotBlank(message = "이름을 입력하세요.")
	private String name;
	@NotBlank(message = "생년월일을 입력하세요.")
	private int birth;
	@NotBlank(message = "이메일을 입력하세요.")
	@Email(message = "이메일 양식이 틀렸습니다.")
	private String email;
	private String phone;
	
	@NotBlank(message = "주소를 입력하세요.")
	private String sample_address;
	private String sample_detailAddress;
	
}
