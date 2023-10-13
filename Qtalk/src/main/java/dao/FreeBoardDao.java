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

	// writer가 id인 freeboard 모두 삭제
	void deleteBoardAll(String id) throws Exception;
	
	// writer가 id인 게시판 num을 리스트로 전달
	List<String> selectBoardNum(String id) throws Exception;
}

