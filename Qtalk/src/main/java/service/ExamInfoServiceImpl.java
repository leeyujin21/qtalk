package service;

import java.util.List;

import dao.ExamInfoDao;
import dao.ExamInfoDaoImpl;

public class ExamInfoServiceImpl implements ExamInfoService {
	private ExamInfoDao examInfoDao;
	
	public ExamInfoServiceImpl() {
		examInfoDao = new ExamInfoDaoImpl();
	}
	
	// ExamInfoDao.selectJmcd 메서드로 받아온 jmcd List를 XMLtoExamSchedule.java로 return
	@Override
	public List<String> jmcd() throws Exception {
		return examInfoDao.selectJmcd();
	}

}
