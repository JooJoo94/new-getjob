package com.kim.getjob.model.board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RespListDto {
	
	private String image;
	private String companyName;
	private String title;
	private String deadLine;
	private String href;

}
