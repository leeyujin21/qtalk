package service;

import java.util.Map;

import dto.FreeBoard;

public interface FreeBoardService {
	void FreeBoardWrite(FreeBoard freeBoard) throws Exception;
	FreeBoard FreeBoardDetail(Integer num) throws Exception;
	void FreeBoardModify(FreeBoard freeboard) throws Exception;

	Map<String, Object> FreeBoardListByPage (Integer page) throws Exception;
}
