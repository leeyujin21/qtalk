package service;

import java.util.List;

import dto.ExamInfo;
import dto.ExamSchedule;

public interface CategoryListService {	
	List<ExamInfo> getAllCategoryList() throws Exception;
	List<ExamInfo> getFirstCategoryList() throws Exception;
	List<ExamInfo> getSecoundCategoryList() throws Exception;
	List<String> getMdtoOd(String firstValue) throws Exception;
	List<String> getOdtoJm(String secondValue) throws Exception;
	List<ExamSchedule> getJm(String thirdValue) throws Exception;
}


