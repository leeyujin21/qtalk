package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.TestBoardComment;
import util.MybatisSqlSessionFactory;

public class TestBoardCommentDaoImpl implements TestBoardCommentDao {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public void insertBoardComment(TestBoardComment testBoardComment) throws Exception {
		sqlSession.insert("mapper.testboardcomment.insertTestBoardComment", testBoardComment);
		sqlSession.commit();
	}

	@Override
	public List<TestBoardComment> selectBoardCommentList(Integer postnum) throws Exception {
		return sqlSession.selectList("mapper.testboardcomment.selectTestBoardCommentList",postnum);
	}


	@Override
	public void updateBoardComment(Integer comment_num) throws Exception {
		sqlSession.update("mapper.testboardcomment.updateTestBoardComment",comment_num);
		sqlSession.commit();
		
	}

	@Override
	public void deleteBoardComment(Integer comment_num) throws Exception {
		sqlSession.delete("mapper.testboardcomment.deleteTestBoardComment",comment_num);
		sqlSession.commit();
	}

	@Override
	public TestBoardComment selectBoardComment(Integer comment_num) throws Exception {
		return sqlSession.selectOne("mapper.testboardcomment.selectTestBoardComment",comment_num);
		
	}
	


}