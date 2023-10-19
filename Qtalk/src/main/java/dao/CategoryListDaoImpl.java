package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.ExamInfo;
import dto.ExamSchedule;
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

	@Override
	public List<String> selectMdtoOd(String firstValue) throws Exception {
		return sqlSession.selectList("mapper.categorylist.selectMdtoOd",firstValue);
	}

	@Override
	public List<String> selectOdtoJm(String secondValue) throws Exception {
		return sqlSession.selectList("mapper.categorylist.selectOdtoJm",secondValue);
	}

	@Override
	public List<ExamSchedule> selectJm(String thirdValue) throws Exception {
		return sqlSession.selectList("mapper.categorylist.selectJm", thirdValue);
	}
}
