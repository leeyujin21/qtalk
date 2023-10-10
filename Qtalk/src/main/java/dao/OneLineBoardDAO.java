package dao;

import java.util.List;
import java.util.Map;

import dto.OneLineBoard;

public interface OneLineBoardDAO {
	void insertOneLineBoard(OneLineBoard olb);
	
	List<OneLineBoard> selectOneLineBoardList(Integer row) throws Exception;
	Integer selectOneLineBoardCount() throws Exception;
	Integer searchOneLineBoardCount(Map<String, Object> param) throws Exception;
	List<OneLineBoard> searchOneLineBoardList(Map<String, Object> param) throws Exception;
}
