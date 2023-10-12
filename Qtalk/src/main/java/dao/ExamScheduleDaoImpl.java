package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.ExamSchedule;
import util.MybatisSqlSessionFactory;

public class ExamScheduleDaoImpl implements ExamScheduleDao {

	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	@Override
	public List<ExamSchedule> getExamScheduleRounds() throws Exception {
		return sqlSession.selectList("mapper.examschedule.selectRoundList");
	}

}
