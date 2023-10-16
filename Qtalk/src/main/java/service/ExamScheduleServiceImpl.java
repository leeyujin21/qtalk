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

	// main 페이지 시험 일정
	@Override
	public List<ExamSchedule> scheduleList() throws Exception {
		return examscheduleDao.selectSubjectSchedule();
	}
	

}
