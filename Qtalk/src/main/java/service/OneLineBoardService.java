package service;

import java.util.Map;

import dto.OneLineBoard;

public interface OneLineBoardService {
	void boardwirte(OneLineBoard olb) throws Exception;
	Map<String, Object> oneLineBoardListByPage(Integer page) throws Exception;
	Map<String,Object> oneLineBoardSearch(String type, String keyword, Integer page) throws Exception;
}
