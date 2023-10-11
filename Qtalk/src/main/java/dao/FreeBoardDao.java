package dao;

import java.util.List;

import dto.FreeBoard;

public interface FreeBoardDao {
	void insertFreeBoard(FreeBoard freeboard) throws Exception;
	FreeBoard selectfreeBoard(Integer num) throws Exception;
	void updatefreeBoard(FreeBoard freeboard) throws Exception;
	
	List <FreeBoard> selectFreeBoardList (Integer row) throws Exception;
	Integer selectFreeBoardCount() throws Exception;
	void updateBoardViewCount(Integer viewcount)throws Exception;
	void updateBoardCommentCountUp(Integer num)throws Exception;
	void updateBoardCommentCountDown(Integer num)throws Exception;
}

