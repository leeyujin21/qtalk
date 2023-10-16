package service;

import java.util.List;

import dto.ExamSchedule;

public interface ExamScheduleService {
	List<ExamSchedule> getExamScheduleRounds() throws Exception;
	List<Object> selectRoundList(String subject) throws Exception;
	
	// main info box
	List<ExamSchedule> scheduleList() throws Exception;
	/* List<ExamSchedule> mainInfoList(List<String> list) throws Exception; */
	
	// examschedule list to testschedule
	List<ExamSchedule> searchSchedule(String search) throws Exception;
}
