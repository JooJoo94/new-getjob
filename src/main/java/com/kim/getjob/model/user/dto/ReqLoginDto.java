package com.kim.getjob.model.user.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqLoginDto {
	
	@Pattern(regexp="^[a-zA-Z0-9]*$", message="유저네임에 한글을 입력할 수 없습니다")
	@NotBlank(message="유저네임을 입력하세요")
	private String userId;
	
	@NotBlank(message="패스워드를 입력하세요")
	private String password;

}
