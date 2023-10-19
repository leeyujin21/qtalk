package dao;

import java.util.List;

import dto.ExamSchedule;

public interface ExamScheduleDao {
	List<ExamSchedule> getExamScheduleRounds() throws Exception;
	List<Object> selectedSubjectRound(String subject) throws Exception;

	// main page 임박한 시험 일정 불러오기
	List<ExamSchedule> selectSubjectSchedule() throws Exception;
//	List<ExamSchedule> selectSubject(String param) throws Exception;
	
	// 시험목록 검색
	List<ExamSchedule> selectTestSchedule(String search) throws Exception;
	
	//test detail 가는 sql
	ExamSchedule selectJmImTotestdetail(Integer num) throws Exception;

}
