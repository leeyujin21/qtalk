package service;

import java.util.List;

import dto.ExamSchedule;

public interface ExamScheduleService {
	List<ExamSchedule> getExamScheduleRounds() throws Exception;
}
