package service;

import java.util.List;

import dto.ExamInfo;

public interface CategoryListService {	
	List<ExamInfo> getAllCategoryList() throws Exception;
	List<ExamInfo> getFirstCategoryList() throws Exception;
	List<ExamInfo> getSecoundCategoryList() throws Exception;
}


