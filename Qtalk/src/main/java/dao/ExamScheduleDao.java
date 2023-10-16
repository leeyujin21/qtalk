package dao;

import java.util.List;

import dto.ExamSchedule;

public interface ExamScheduleDao {
	List<ExamSchedule> getExamScheduleRounds() throws Exception;
	List<Object> selectedSubjectRound(String subject) throws Exception;

	// main page
	List<ExamSchedule> selectSubjectSchedule() throws Exception;
//	List<ExamSchedule> selectSubject(String param) throws Exception;
}
