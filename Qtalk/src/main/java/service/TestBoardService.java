package service;

import java.util.Map;

import dto.TestBoard;

public interface TestBoardService {
	void TestBoardWrite(TestBoard Testboard) throws Exception;
	Map<String, Object> TestBoardListByPage(Integer page) throws Exception; //리스트보기
	TestBoard TestBoardDetail(Integer num) throws Exception;
	void TestBoardModify(TestBoard Testboard) throws Exception;
	void TestBoardDelete(Integer num) throws Exception;
	Map<String, Object> TestBoardSearch(String type,String keyword ,Integer page )throws Exception;
}