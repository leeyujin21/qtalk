package dao;

import java.util.List;

public interface ExamInfoDao {
	// mapper/ExamInfo.xml에서 jmcd(종목코드) 받아와서 List로 저장해서 retrun
	List<String> selectJmcd() throws Exception;
}
