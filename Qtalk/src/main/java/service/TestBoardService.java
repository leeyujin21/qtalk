package service;

import java.util.Map;

import dto.TestBoard;

public interface TestBoardService {
	void boardWrite(TestBoard Testboard) throws Exception;
	Map<String, Object> boardListByPage(Integer page) throws Exception;
	TestBoard boardDetail(Integer num) throws Exception;
	void boardModify(TestBoard Testboard) throws Exception;
	void boardDelete(Integer num) throws Exception;
	Map<String, Object> boardSearch(String type,String keyword ,Integer page )throws Exception;
	

}