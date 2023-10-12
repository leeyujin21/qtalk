package dao;

import java.util.List;

import dto.FreeBoard;

public interface FreeBoardDao {
	void insertFreeBoard(FreeBoard freeboard) throws Exception;
	FreeBoard selectFreeBoard(Integer num) throws Exception;
	void updateFreeBoard(FreeBoard freeboard) throws Exception;
	
	List <FreeBoard> selectFreeBoardList (Integer row) throws Exception;
	Integer selectFreeBoardCount() throws Exception;
	void updateFreeBoardViewCount(Integer viewcount)throws Exception;
	void updateFreeBoardCommentCountUp(Integer num)throws Exception;
	void updateFreeBoardCommentCountDown(Integer num)throws Exception;
}

