package service;

import java.util.List;
import java.util.Map;

import dto.TestBoard;

public interface TestBoardService {
	void TestBoardWrite(TestBoard Testboard) throws Exception;
	Map<String, Object> TestBoardListByPage(Integer page) throws Exception; //리스트보기
	TestBoard TestBoardDetail(Integer num) throws Exception;
	void TestBoardModify(TestBoard Testboard) throws Exception;
	void TestBoardDelete(Integer num) throws Exception;
	//test보드 서칭
	Map<String, Object> TestBoardSearch(String type,String keyword ,Integer page )throws Exception;

	// 특정 id 게시판 모두 삭제
	void boardDeleteAll(String id) throws Exception;
	// id가 작성한 게시판 num 리스트
	List<String> boardNumList(String id) throws Exception;
	
	// testboardDAO 에서 id로 testboard List 가져오기
	List<TestBoard> myWriteTestBoard(String id) throws Exception;
}