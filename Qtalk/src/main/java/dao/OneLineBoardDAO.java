package dao;

import java.util.List;
import java.util.Map;

import dto.Level;
import dto.OneLineBoard;

public interface OneLineBoardDAO {
	void insertOneLineBoard(OneLineBoard olb);
	
	List<OneLineBoard> selectOneLineBoardList(Integer row) throws Exception;
	Integer selectOneLineBoardCount() throws Exception;
	Integer searchOneLineBoardCount(Map<String, Object> param) throws Exception;
	List<OneLineBoard> searchOneLineBoardList(Map<String, Object> param) throws Exception;

	// writer가 id인 onelineboard 모두 삭제
	void deleteBoardAll(String id) throws Exception;
	
	// 한 줄평 게피산에서 가장 인기 있는 시험 3개
	List<Level> selectMostSubject() throws Exception;
}
