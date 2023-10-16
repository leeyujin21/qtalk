package service;

import java.util.List;
import java.util.Map;

import dto.Level;
import dto.OneLineBoard;

public interface OneLineBoardService {
	void boardwirte(OneLineBoard olb) throws Exception;
	Map<String, Object> oneLineBoardListByPage(Integer page) throws Exception;
	Map<String,Object> oneLineBoardSearch(String type, String keyword, Integer page) throws Exception;
	
	// 특정 id 게시판 모두 삭제
	void boardDeleteAll(String id) throws Exception;
	
	// onelineboard 에서 인기 있는 시험 3가지 가져오기
	List<Level> oneLineBoardMostSubject() throws Exception;
}
