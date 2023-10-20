package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.BookMark;
import dto.ExamSchedule;
import util.MybatisSqlSessionFactory;

public class BookMarkDaoImpl implements BookMarkDao {
	
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	public void insertBookMark(BookMark bookMark) throws Exception {
		sqlSession.insert("mapper.bookmark.insertBookMark", bookMark);
		sqlSession.commit();
	}

	@Override
	public void deleteBookMark(BookMark bookMark) throws Exception {
		sqlSession.delete("mapper.bookmark.deleteBookMark",bookMark);
		sqlSession.commit();
	}

	@Override
	public List<ExamSchedule> selectBookMark(String id) throws Exception {
		return sqlSession.selectList("mapper.bookmark.selectBookMark",id);
				
	}

	@Override
	public BookMark isSelectBookMark(BookMark bookMark) throws Exception {
		return sqlSession.selectOne("mapper.bookmark.isSelectBookMark",bookMark);
	}

	// 회원탈퇴 시 북마크 삭제
	@Override
	public void deleteBookMarkAll(String id) throws Exception {
		sqlSession.delete("mapper.bookmark.isSelectBookMark", id);
		sqlSession.commit();
	}
	public boolean isBookMarked(BookMark bookMark) {
        int count = sqlSession.selectOne("mapper.bookmark.isBookMarked", bookMark);
        return count > 0;
    }

}
