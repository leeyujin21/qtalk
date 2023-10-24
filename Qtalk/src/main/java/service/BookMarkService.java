package service;

import java.util.List;

import dto.BookMark;
import dto.ExamSchedule;

public interface BookMarkService {
	void insertBookMark(BookMark bookMark) throws Exception;
	void deleteBookMark(BookMark bookMark) throws Exception;
	List<ExamSchedule> selectBookMark (String id) throws Exception;
	BookMark isSelectBookMark(BookMark bookMark)throws Exception;
	
	// 회원탈퇴 시 북마크 모두 삭제
	void bookMarkDeleteAll(String id) throws Exception;
	boolean toggleBookMark(BookMark bookMark) throws Exception;
	boolean isBookMark(BookMark bookMark) throws Exception;
}
