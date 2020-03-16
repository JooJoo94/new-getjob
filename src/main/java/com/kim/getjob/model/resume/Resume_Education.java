package com.kim.getjob.model.resume;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Resume_Education {
	
	private int id;
	private int level;
	private String schoolName;
	private String local;
	private String startYear;
	private String endYear;
	
	@Builder
	public Resume_Education(int level, String schoolName, String local, String startYear, String endYear) {
		this.level = level;
		this.schoolName = schoolName;
		this.local = local;
		this.startYear = startYear;
		this.endYear = endYear;
	}
	
	

}
