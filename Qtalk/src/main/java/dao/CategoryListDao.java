package dao;

import java.util.List;

import dto.ExamInfo;

public interface CategoryListDao {
	List<ExamInfo> selectAllCategory() throws Exception;
	List<ExamInfo> selectFirstCategory() throws Exception;
	List<ExamInfo> selectSecondCategory() throws Exception;
}
