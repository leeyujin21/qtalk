package dao;

import java.util.List;

import dto.BookMark;
import dto.ExamSchedule;

public interface BookMarkDao {
	void insertBookMark(BookMark bookMark) throws Exception;
	void deleteBookMark(BookMark bookMark) throws Exception;
	List<ExamSchedule> selectBookMark (String id) throws Exception;
	BookMark isSelectBookMark(BookMark bookMark)throws Exception;
	
	// 회원탈퇴 시 북마크 삭제
	void deleteBookMarkAll(String id) throws Exception;
	boolean isBookMarked(BookMark bookMark);
}
