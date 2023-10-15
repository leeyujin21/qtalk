package service;

import java.util.List;


import dao.ExamScheduleDao;
import dao.ExamScheduleDaoImpl;
import dto.ExamSchedule;

public class ExamScheduleServiceImpl implements ExamScheduleService {
	private ExamScheduleDao examscheduleDao;
	
	public ExamScheduleServiceImpl() {
		examscheduleDao = new ExamScheduleDaoImpl();
	}
	
	@Override
	public List<ExamSchedule> getExamScheduleRounds() throws Exception {
		return examscheduleDao.getExamScheduleRounds();
	}

	@Override
	public List<Object> selectRoundList(String subject) throws Exception {
		return examscheduleDao.selectedSubjectRound(subject);
	}

	// main info box
	public List<ExamSchedule> mainInfoList(List<String> list) throws Exception {
		return examscheduleDao.;
	}
}
