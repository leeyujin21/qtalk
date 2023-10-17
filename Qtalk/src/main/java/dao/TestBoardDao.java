package dao;

import java.util.List;
import java.util.Map;

import dto.TestBoard;

public interface TestBoardDao {
	void insertTestBoard(TestBoard testboard) throws Exception;
	List<TestBoard> selectTestBoardList(Integer row) throws Exception;
	Integer selectTestBoardCount() throws Exception;
	TestBoard selectTestBoard(Integer num)throws Exception;
	void updateTestBoard(TestBoard testBoard) throws Exception;
	void deleteTestBoard(Integer num) throws Exception;
	
	Integer searchTestBoardCount(Map<String,Object> param) throws Exception;
	List<TestBoard> searchTestBoardList(Map<String,Object> param)throws Exception;
	void updateTestBoardViewCount(Integer viewcount)throws Exception;
	void updateTestBoardCommentCountUp(Integer num)throws Exception;
	void updateTestBoardCommentCountDown(Integer num)throws Exception;

	// writer가 id인 testboard 모두 삭제
	void deleteBoardAll(String id) throws Exception;
	
	// writer가 id인 게시판 num을 리스트로 전달
	List<String> selectBoardNum(String id) throws Exception;
	
	// testboard DB에서 writer = id인 testboard List 가져오기
	List<TestBoard> selectIdBoardList(String id) throws Exception;
}