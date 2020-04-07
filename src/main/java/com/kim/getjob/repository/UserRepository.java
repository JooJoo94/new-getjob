package com.kim.getjob.repository;


import com.kim.getjob.model.user.User;
import com.kim.getjob.model.user.dto.ReqJoinDto;
import com.kim.getjob.model.user.dto.ReqLoginDto;

public interface UserRepository {
	
	int save(ReqJoinDto dto);
	int findByUserId(String userId);
	User findByUsernameAndPassword(ReqLoginDto dto);
	User findById(int id);
	int update(int id, String password, String email, String profile);

}
