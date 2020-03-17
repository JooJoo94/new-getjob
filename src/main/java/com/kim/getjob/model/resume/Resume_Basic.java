package com.kim.getjob.model.resume;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Resume_Basic {
	
	private int id;
	private int userId;
	private String title;
	private String name;
	private int birth;
	private String email;
	private String phone;
	private String address;
	private String detailAddress;
	private Timestamp createDate;
	
	@Builder
	public Resume_Basic(int userId, String name, int birth, String email, String phone, String address) {
		this.userId = userId;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}
	
	

}
