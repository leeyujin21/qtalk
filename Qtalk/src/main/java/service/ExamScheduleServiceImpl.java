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

	// main page 임박한 시험 일정 List로 가져오기
	@Override
	public List<ExamSchedule> scheduleList() throws Exception {
		return examscheduleDao.selectSubjectSchedule();
	}

	// testschedule search
	@Override
	public List<ExamSchedule> searchSchedule(String search) throws Exception {
		return examscheduleDao.selectTestSchedule(search);
	}

	@Override
	public ExamSchedule selectTestDetail(Integer num) throws Exception {
		return examscheduleDao.selectJmImTotestdetail(num);
	}
	

}
