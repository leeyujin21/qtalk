package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.FreeBoardComment;
import util.MybatisSqlSessionFactory;

public class FreeBoardCommentDaoImpl implements FreeBoardCommentDao {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public void insertBoardComment(FreeBoardComment freeBoardComment) throws Exception {
		sqlSession.insert("mapper.freeboardcomment.insertFreeBoardComment", freeBoardComment);
		sqlSession.commit();
	}

	@Override
	public List<FreeBoardComment> selectBoardCommentList(Integer postnum) throws Exception {
		return sqlSession.selectList("mapper.freeboardcomment.selectFreeBoardCommentList",postnum);
	}


	@Override
	public void updateBoardComment(Integer comment_num) throws Exception {
		sqlSession.update("mapper.freeboardcomment.updateFreeBoardComment",comment_num);
		sqlSession.commit();
		
	}

	@Override
	public void deleteBoardComment(Integer comment_num) throws Exception {
		sqlSession.delete("mapper.freeboardcomment.deleteFreeBoardComment",comment_num);
		sqlSession.commit();
	}

	@Override
	public FreeBoardComment selectBoardComment(Integer comment_num) throws Exception {
		return sqlSession.selectOne("mapper.freeboardcomment.selectFreeBoardComment",comment_num);
		
	}
	


}