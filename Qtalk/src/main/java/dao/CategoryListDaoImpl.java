package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.ExamInfo;
import util.MybatisSqlSessionFactory;

public class CategoryListDaoImpl implements CategoryListDao {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	@Override
	public List<ExamInfo> selectCategory() throws Exception {		
		return sqlSession.selectList("mapper.categorylist.selectCategory");
	}

}
