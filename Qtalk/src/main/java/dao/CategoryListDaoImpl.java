package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.ExamInfo;
import util.MybatisSqlSessionFactory;

public class CategoryListDaoImpl implements CategoryListDao {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public List<ExamInfo> selectAllCategory() throws Exception {
		
		return  sqlSession.selectList("mapper.categorylist.selectAllCategory");
	}

	@Override
	public List<ExamInfo> selectFirstCategory() throws Exception {
		return sqlSession.selectList("mapper.categorylist.selectFirstCategory");
	}

	@Override
	public List<ExamInfo> selectSecondCategory() throws Exception {
		return sqlSession.selectList("mapper.categorylist.selectSecondCategory");
	}

}
