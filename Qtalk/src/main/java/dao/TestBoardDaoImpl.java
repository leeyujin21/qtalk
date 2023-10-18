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
		sqlSession.insert("mapper.testboard.insertTestBoard", testboard);
		sqlSession.commit();
	}

	@Override
	public List<TestBoard> selectTestBoardList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.testboard.selectTestBoardList",row);
	}

	@Override
	public Integer selectTestBoardCount() throws Exception {
		return sqlSession.selectOne("mapper.testboard.selectTestBoardCount");
	}

	@Override
	public TestBoard selectTestBoard(Integer num) throws Exception {
		return sqlSession.selectOne("mapper.testboard.selectTestBoard", num);
	}

	@Override
	public void updateTestBoard(TestBoard testBoard) throws Exception {
		sqlSession.update("mapper.testboard.updateTestBoard",testBoard);
		sqlSession.commit();
		
	}

	@Override
	public void deleteTestBoard(Integer num) throws Exception {
		sqlSession.delete("mapper.testboard.deleteTestBoard",num);
		sqlSession.commit();
	}

	


	@Override
	public void updateTestBoardViewCount(Integer viewcount) throws Exception {
		sqlSession.update("mapper.testboard.updateTestBoardViewCount",viewcount);
		sqlSession.commit();
		
	}
	@Override
	public void updateTestBoardCommentCountUp(Integer num) throws Exception {
		sqlSession.update("mapper.testboard.updateTestBoardCommentCountUp",num);
		sqlSession.commit();
		
	}
	@Override
	public void updateTestBoardCommentCountDown(Integer num) throws Exception {
		sqlSession.update("mapper.testboard.updateTestBoardCommentCountDown",num);
		sqlSession.commit();
		
	}

	@Override
	public List<TestBoard> searchTestBoardList(Map<String, Object> param) throws Exception {
		return sqlSession.selectList("mapper.testboard.searchTestBoardList",param);
	}
	@Override
	public Integer searchTestBoardCount(Map<String, Object> param) throws Exception {
		return sqlSession.selectOne("mapper.testboard.searchTestBoardCount",param);
	}
	// writer가 id인 게시판 모두 삭제
	@Override
	public void deleteBoardAll(String id) throws Exception {
		sqlSession.delete("mapper.testboard.deleteBoardAll", id);
		sqlSession.commit();
	}

	@Override
	public List<String> selectBoardNum(String id) throws Exception {
		return sqlSession.selectList("mapper.testboard.selectBoardNum", id);
	}

	// testboard DB에서 writer = id인 testboard List 가져오기
	@Override
	public List<TestBoard> selectIdBoardList(String id) throws Exception {
		return sqlSession.selectList("mapper.testboard.selectIdTestBoardList", id);
	}



}