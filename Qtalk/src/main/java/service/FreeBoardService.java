package service;

import java.util.List;
import java.util.Map;

import dto.FreeBoard;

public interface FreeBoardService {
	void FreeBoardWrite(FreeBoard freeBoard) throws Exception;
	FreeBoard FreeBoardDetail(Integer num) throws Exception;
	void FreeBoardModify(FreeBoard freeboard) throws Exception;

	Map<String, Object> FreeBoardListByPage (Integer page) throws Exception;
	Map<String, Object> FreeBoardSearch(String type,String keyword ,Integer page )throws Exception;

	// 특정 id 게시판 모두 삭제
	void boardDeleteAll(String id) throws Exception;
	
	List<String> boardNumList(String id) throws Exception;
}
