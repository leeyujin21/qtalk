package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.OneLineBoard;
import util.MybatisSqlSessionFactory;

public class OneLineBoardDAOImpl implements OneLineBoardDAO {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public void insertOneLineBoard(OneLineBoard olb) {
		sqlSession.insert("mapper.onelineboard.insertOneLineBoard", olb);
		sqlSession.commit();
	}

	@Override
	public List<OneLineBoard> selectOneLineBoardList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.onelineboard.selectOneLineBoardList", row);
	}

	@Override
	public Integer selectOneLineBoardCount() throws Exception {
		return sqlSession.selectOne("mapper.onelineboard.selectOneLineBoardCount");
	}

	@Override
	public Integer searchOneLineBoardCount(Map<String, Object> param) throws Exception {
		return sqlSession.selectOne("mapper.onelineboard.searchOneLineBoardCount", param);
	}

	@Override
	public List<OneLineBoard> searchOneLineBoardList(Map<String, Object> param) throws Exception {
		return sqlSession.selectList("mapper.onelineboard.searchOneLineBoardList", param);
	}
	
	// writer가 id인 게시판 모두 삭제
	@Override
	public void deleteBoardAll(String id) throws Exception {
		sqlSession.delete("mapper.onelineboard.deleteBoardAll",id);
		sqlSession.commit();
	}
	
	
}
