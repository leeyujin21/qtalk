package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.TestBoard;
import util.MybatisSqlSessionFactory;

public class TestBoardDaoImpl implements TestBoardDao {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	@Override
	public void insertTestBoard(TestBoard testboard) throws Exception {
		sqlSession.insert("mapper.testboard.insertBoard", testboard);
		sqlSession.commit();
	}

	@Override
	public List<TestBoard> selectTestBoardList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.testboard.selectBoardList",row);
	}

	@Override
	public Integer selectTestBoardCount() throws Exception {
		return sqlSession.selectOne("mapper.testboard.selectBoardCount");
	}

	@Override
	public TestBoard selectTestBoard(Integer num) throws Exception {
		return sqlSession.selectOne("mapper.testboard.selectBoard", num);
	}

	@Override
	public void updateTestBoard(TestBoard testBoard) throws Exception {
		sqlSession.update("mapper.testboard.updateBoard",testBoard);
		sqlSession.commit();
		
	}

	@Override
	public void deleteTestBoard(Integer num) throws Exception {
		sqlSession.delete("mapper.testboard.deleteBoard",num);
		sqlSession.commit();
	}

	@Override
	public Integer searchTestBoardCount(Map<String, Object> param) throws Exception {
		return sqlSession.selectOne("mapper.testboard.searchBoardCount",param);
	}

	/*
	 * @Override public List<TestBoard> searchBoardList(Map<String, Object> param)
	 * throws Exception { return
	 * sqlSession.selectList("mapper.testboard.searchBoardList",param); }
	 */

	@Override
	public void updateTestBoardViewCount(Integer viewcount) throws Exception {
		sqlSession.update("mapper.testboard.updateBoardViewCount",viewcount);
		sqlSession.commit();
		
	}
	@Override
	public void updateTestBoardCommentCountUp(Integer num) throws Exception {
		sqlSession.update("mapper.testboard.updateBoardCommentCountUp",num);
		sqlSession.commit();
		
	}
	@Override
	public void updateTestBoardCommentCountDown(Integer num) throws Exception {
		sqlSession.update("mapper.testboard.updateBoardCommentCountDown",num);
		sqlSession.commit();
		
	}

	@Override
	public List<TestBoard> searchTestBoardList(Map<String, Object> param) throws Exception {
		return sqlSession.selectList("mapper.testboard.searchBoardList",param);
	}



}