package service;

import java.util.List;

import dto.ExamInfo;

public interface ExamInfoService {
	List<ExamInfo> getExamInfoNames() throws Exception;
	
	// ExamInfoDao.selectJmcd 메서드로 받아온 jmcd List를 XMLtoExamSchedule.java로 return
	List<String> jmcd() throws Exception;
}
