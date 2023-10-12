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

}
