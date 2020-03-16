package com.kim.getjob.model.user.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReqJoinDto {
	
	@NotBlank(message = "이름을 입력하세요.")
	private String userName;
	
	@Pattern(regexp = "^[a-zA-Z0-9]*$", message = "아이디에 한글이 입력될 수 없습니다.")
	@Size(max=15, message = "아이디 길이가 잘못되었습니다.")
	@NotBlank(message = "아이디를 입력하세요.")
	private String userId;
	
	@NotBlank(message = "패스워드를 입력하세요.")
	private String password;
	
	@Size(max=30, message = "이메일이 길이가 잘못되었습니다.")
	@Email(message = "이메일 양식이 틀렸습니다.")
	@NotBlank(message = "이메일을 입력하세요.")
	private String email;
	
	@NotBlank(message = "전화번호를 입력하세요.")
	private String phone;


}
