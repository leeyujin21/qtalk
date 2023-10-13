package dao;

import java.util.List;

import dto.ExamSchedule;

public interface ExamScheduleDao {
	List<ExamSchedule> getExamScheduleRounds() throws Exception;
	List<Object> selectedSubjectRound(String subject) throws Exception;
}
