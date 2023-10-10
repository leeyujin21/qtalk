package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.TestBoard;
import util.MybatisSqlSessionFactory;

public class TestBoardDaoImpl implements TestBoardDao {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	@Override
	public void insertBoard(TestBoard testboard) throws Exception {
		sqlSession.insert("mapper.testboard.insertBoard", testboard);
		sqlSession.commit();

	}

	@Override
	public List<TestBoard> selectBoardList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.testboard.selectBoardList",row);
	}

	@Override
	public Integer selectBoardCount() throws Exception {
		return sqlSession.selectOne("mapper.testboard.selectBoardCount");
	}

	@Override
	public TestBoard selectBoard(Integer num) throws Exception {
		return sqlSession.selectOne("mapper.testboard.selectBoard", num);
	}

	@Override
	public void updateBoard(TestBoard testBoard) throws Exception {
		sqlSession.update("mapper.testboard.updateBoard",testBoard);
		sqlSession.commit();
		
	}

	@Override
	public void deleteBoard(Integer num) throws Exception {
		sqlSession.delete("mapper.testboard.deleteBoard",num);
		sqlSession.commit();
	}

	@Override
	public Integer searchBoardCount(Map<String, Object> param) throws Exception {
		return sqlSession.selectOne("mapper.testboard.searchBoardCount",param);
	}

	@Override
	public List<TestBoard> searchBoardList(Map<String, Object> param) throws Exception {
		return sqlSession.selectList("mapper.testboard.searchBoardList",param);
	}

	@Override
	public void updateBoardViewCount(Integer viewcount) throws Exception {
		sqlSession.update("mapper.testboard.updateBoardViewCount",viewcount);
		sqlSession.commit();
		
	}



}