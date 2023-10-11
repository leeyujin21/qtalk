package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class ExamInfoDaoImpl implements ExamInfoDao {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	// mapper/ExamInfo.xml에서 jmcd(종목코드) 받아와서 List로 저장해서 retrun
	@Override
	public List<String> selectJmcd() throws Exception {
		return sqlSession.selectList("mapper.examinfo.selectJmcd");
	}

}
