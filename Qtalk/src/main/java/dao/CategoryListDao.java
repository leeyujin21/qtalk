package dao;

import java.util.List;

import dto.ExamInfo;
import dto.ExamSchedule;

public interface CategoryListDao {
	List<ExamInfo> selectAllCategory() throws Exception;
	List<ExamInfo> selectFirstCategory() throws Exception;
	List<ExamInfo> selectSecondCategory() throws Exception;
	List<String> selectMdtoOd (String firstValue) throws Exception;
	List<String> selectOdtoJm (String secondValue) throws Exception;
	List<ExamSchedule> selectJm(String thirdValue) throws Exception;
}
