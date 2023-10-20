package dao;

import java.util.List;
import java.util.Map;

import dto.FreeBoard;

public interface FreeBoardDao {
	void insertFreeBoard(FreeBoard freeboard) throws Exception;
	List <FreeBoard> selectFreeBoardList (Integer row) throws Exception;
	FreeBoard selectFreeBoard(Integer num) throws Exception;
	void updateFreeBoard(FreeBoard freeboard) throws Exception;
	
	Integer selectFreeBoardCount() throws Exception;
	
	Integer searchFreeBoardCount(Map<String,Object> param) throws Exception;
	List<FreeBoard> searchFreeBoardList(Map<String,Object> param)throws Exception;
	// 서치
	
	
	void updateFreeBoardViewCount(Integer viewcount)throws Exception;
	void updateFreeBoardCommentCountUp(Integer num)throws Exception;
	void updateFreeBoardCommentCountDown(Integer num)throws Exception;

	//게시물 하나 삭제
	void deleteFreeBoard(Integer num) throws Exception;
	
	
	// writer가 id인 freeboard 모두 삭제
	void deleteBoardAll(String id) throws Exception;
	
	// writer가 id인 게시판 num을 리스트로 전달
	List<String> selectBoardNum(String id) throws Exception;
	
	// freeboard DB에서 writer = id인 freeboard List 가져오기
	List<FreeBoard> selectIdFreeBoardList(String id) throws Exception;
}

