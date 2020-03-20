package com.kim.getjob.model.resume;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Resume_University {
	
	private int id;
	private String schoolName;
	private String local;
	private String major;
	private String startYear;
	private String endYear;
	private float score;
	
	@Builder
	public Resume_University(String schoolName, String local, String major, String startYear, String endYear,
			int score) {

		this.schoolName = schoolName;
		this.local = local;
		this.major = major;
		this.startYear = startYear;
		this.endYear = endYear;
		this.score = score;
	}
	
	

}
