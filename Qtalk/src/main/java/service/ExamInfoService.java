package service;

import java.util.List;

public interface ExamInfoService {
	// ExamInfoDao.selectJmcd 메서드로 받아온 jmcd List를 XMLtoExamSchedule.java로 return
	List<String> jmcd() throws Exception;
}
