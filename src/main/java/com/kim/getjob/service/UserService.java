package com.kim.getjob.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kim.getjob.model.ReturnCode;
import com.kim.getjob.model.user.User;
import com.kim.getjob.model.user.dto.ReqJoinDto;
import com.kim.getjob.model.user.dto.ReqLoginDto;
import com.kim.getjob.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserRepository userRepository;
	
	@Transactional
	public int 회원가입(ReqJoinDto dto) {

		try {
			int result = userRepository.findByUserId(dto.getUserId());	
			if(result == 1) {
				return ReturnCode.아이디중복;
			}else {
				return userRepository.save(dto);
			}			
		} catch (Exception e) {
			throw new RuntimeException();
		}		
	}
	
	public User 로그인(ReqLoginDto dto) {
		return userRepository.findByUsernameAndPassword(dto);

	}
	
	public int 수정완료(int id, String password, String email, String profile) {
		int result = userRepository.update(id, password, email, profile);
		System.out.println("결과 : " + result);
		if(result==1) {
			User user = userRepository.findById(id);
			session.setAttribute("principal", user);
			return 1;
		}else {
			return -1;
		}
	}
	
	
}
