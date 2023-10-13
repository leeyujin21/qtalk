package dao;

import java.util.List;

import dto.ExamInfo;

public interface CategoryListDao {
	List<ExamInfo> selectCategory() throws Exception;
}
