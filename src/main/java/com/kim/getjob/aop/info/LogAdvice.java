package com.kim.getjob.aop.info;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Component
@Aspect
public class LogAdvice {
	
	private static final Logger log = LoggerFactory.getLogger(LogAdvice.class);
	
	@Around("execution(* com.kim.getjob.controller..*Controller.*(..))"
			+" or execution(* com.kim.getjob.service..*Service.*(..))"
			+" or execution(* com.kim.getjob.repository..*Repository.*(..))")
	public Object logPrint(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {

		// 자신의 타입이 뭔지 알려준다
		String type = proceedingJoinPoint.getSignature().getDeclaringTypeName();
		
		log.info(type+"."+proceedingJoinPoint.getSignature().getName()+"() <=================");
		log.info("Argument/Parameter : "+Arrays.toString(proceedingJoinPoint.getArgs()));
		log.info("=================>");
		
		return proceedingJoinPoint.proceed();
	}
	
}


