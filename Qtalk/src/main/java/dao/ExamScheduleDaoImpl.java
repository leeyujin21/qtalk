package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.ExamSchedule;
import util.MybatisSqlSessionFactory;

public class ExamScheduleDaoImpl implements ExamScheduleDao {

	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	@Override
	public List<ExamSchedule> getExamScheduleRounds() throws Exception {
		return sqlSession.selectList("mapper.examschedule.selectRoundList");
	}

	@Override
	public List<Object> selectedSubjectRound(String subject) throws Exception {
		return sqlSession.selectList("mapper.examschedule.selectedSubjectRound", subject);
	}

}
