package service;

import java.util.Map;

import dto.FreeBoard;

public interface FreeBoardService {
	void freeboardWrite(FreeBoard freeBoard) throws Exception;
	FreeBoard freeboardDetail(Integer num) throws Exception;
	void freeboardModify(FreeBoard freeboard) throws Exception;

	Map<String, Object> freeBoardListByPage (Integer page) throws Exception;
}
