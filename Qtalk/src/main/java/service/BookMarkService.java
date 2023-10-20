package service;

import java.util.List;

import dto.BookMark;
import dto.ExamSchedule;

public interface BookMarkService {
	void insertBookMark(BookMark bookMark) throws Exception;
	void deleteBookMark(BookMark bookMark) throws Exception;
	List<ExamSchedule> selectBookMark (String id) throws Exception;
	BookMark isSelectBookMark(BookMark bookMark)throws Exception;
}
