package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.FreeBoard;
import util.MybatisSqlSessionFactory;

public class FreeBoardDaoImpl implements FreeBoardDao{
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	@Override
	public void insertFreeBoard(FreeBoard freeboard) throws Exception {
		sqlSession.insert("mapper.freeboard.insertFreeBoard", freeboard);
		sqlSession.commit();
	}
	@Override
	public FreeBoard selectFreeBoard(Integer num) throws Exception {
		return sqlSession.selectOne("mapper.freeboard.selectFreeBoard", num);
	}
	@Override
	public void updateFreeBoard(FreeBoard freeboard) throws Exception {
		sqlSession.update("mapper.freeboard.updateFreeBoard", freeboard);
		sqlSession.commit();
	}
		
	@Override
	public List<FreeBoard> selectFreeBoardList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.freeboard.selectFreeBoardList",row);
	}
	
	@Override
	public Integer selectFreeBoardCount() throws Exception {
		return sqlSession.selectOne("mapper.freeboard.selectFreeBoardCount");
	}
	
	
	@Override
	public void updateFreeBoardViewCount(Integer viewcount) throws Exception {
		sqlSession.update("mapper.freeboard.updateFreeBoardViewCount",viewcount);
		sqlSession.commit();
		
	}
	
	@Override
	public void updateFreeBoardCommentCountUp(Integer num) throws Exception {
		sqlSession.update("mapper.freeboard.updateFreeBoardCommentCountUp",num);
		sqlSession.commit();
		
	}
	
	@Override
	public void updateFreeBoardCommentCountDown(Integer num) throws Exception {
		sqlSession.update("mapper.freeboard.updateFreeBoardCommentCountDown",num);
		sqlSession.commit();
		
	}
}