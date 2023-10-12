package service;

import java.util.List;

import dao.ExamInfoDao;
import dao.ExamInfoDaoImpl;
import dto.ExamInfo;

public class ExamInfoServiceImpl implements ExamInfoService {
	private ExamInfoDao examinfoDao;
	
	public ExamInfoServiceImpl() {
		examinfoDao = new ExamInfoDaoImpl();
	}
	@Override
	public List<ExamInfo> getExamInfoNames() throws Exception {
		return examinfoDao.getExamInfoNames();
	}
	
	// ExamInfoDao.selectJmcd 메서드로 받아온 jmcd List를 XMLtoExamSchedule.java로 return
	@Override
	public List<String> jmcd() throws Exception {
		return examinfoDao.selectJmcd();
	}

}
