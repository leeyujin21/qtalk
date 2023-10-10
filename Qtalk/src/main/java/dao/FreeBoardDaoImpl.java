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
	public FreeBoard selectfreeBoard(Integer num) throws Exception {
		return sqlSession.selectOne("mapper.freeboard.selectFreeBoard", num);
	}
	@Override
	public void updatefreeBoard(FreeBoard freeboard) throws Exception {
		sqlSession.update("mapper.freeboard.updateFreeBoard", freeboard);
		sqlSession.commit();
	}
		
	@Override
	public List<FreeBoard> selectFreeBoardList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.freeboard.selectFreeBoardList",row);
	}
	
	@Override
	public Integer selectFreeBoardCount() throws Exception {
		return sqlSession.selectOne("mapper.board.selectFreeBoardCount");
	}
}