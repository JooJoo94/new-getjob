package com.kim.getjob.model.resume;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Resume_University {
	
	private int id;
	private int level;
	private String schoolName;
	private String local;
	private String major;
	private String startYear;
	private String endYear;
	private int score;
	
	@Builder
	public Resume_University(int level, String schoolName, String local, String major, String startYear, String endYear,
			int score) {

		this.level = level;
		this.schoolName = schoolName;
		this.local = local;
		this.major = major;
		this.startYear = startYear;
		this.endYear = endYear;
		this.score = score;
	}
	
	

}
