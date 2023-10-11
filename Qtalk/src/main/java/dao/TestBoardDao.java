package dao;

import java.util.List;
import java.util.Map;

import dto.TestBoard;

public interface TestBoardDao {
	void insertBoard(TestBoard testboard) throws Exception;
	List<TestBoard> selectBoardList(Integer row) throws Exception;
	Integer selectBoardCount() throws Exception;
	TestBoard selectBoard(Integer num)throws Exception;
	void updateBoard(TestBoard testBoard) throws Exception;
	void deleteBoard(Integer num) throws Exception;
	
	Integer searchBoardCount(Map<String,Object> param) throws Exception;
	List<TestBoard> searchBoardList(Map<String,Object> param)throws Exception;
	void updateBoardViewCount(Integer viewcount)throws Exception;
	void updateBoardCommentCountUp(Integer num)throws Exception;
	void updateBoardCommentCountDown(Integer num)throws Exception;

}