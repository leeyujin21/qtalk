package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.TestBoardDao;
import dao.TestBoardDaoImpl;
import dto.TestBoard;
import util.PageInfo;

public class TestBoardServiceImpl implements TestBoardService {
	private TestBoardDao testBoardDao;
	public TestBoardServiceImpl() {
		testBoardDao = new TestBoardDaoImpl();
	}



	@Override
	public Map<String, Object> TestBoardListByPage(Integer page) throws Exception {
		PageInfo pageInfo = new PageInfo();
		int testBoardCount = testBoardDao.selectTestBoardCount();
		int maxPage = (int)Math.ceil((double)testBoardCount/10);
		int startPage = (page-1)/10*10+1;
		int endPage = startPage+10-1;
		if(endPage>maxPage) endPage=maxPage;
		if(page>maxPage) page=maxPage;
			
			
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10+1; //현재 페이지의 시작 row
		List<TestBoard> testBoardList = testBoardDao.selectTestBoardList(row-1);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("testBoardList", testBoardList);
		return map;
	}

	

	
	
	@Override
	public  Map<String, Object> TestBoardSearch(String type,String keyword ,Integer page) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		
		PageInfo pageInfo = new PageInfo();
		int testBoardCount = testBoardDao.searchTestBoardCount(param);
		int maxPage = (int)Math.ceil((double)testBoardCount/10); //ceil은 올림
		int startPage = (page-1)/10*10+1;
		int endPage = startPage+10-1;
		if(endPage>maxPage) endPage=maxPage;
		if(page>maxPage) page=maxPage;
			
			
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10+1; //현재 페이지의 시작 row
		param.put("row", row-1);
		List<TestBoard> testBoardList = testBoardDao.searchTestBoardList(param);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("testBoardList", testBoardList);
		map.put("type", type);
		map.put("keyword", keyword);
		return map;
	}



	@Override
	public void TestBoardWrite(TestBoard Testboard) throws Exception {
		testBoardDao.insertTestBoard(Testboard);
		
	}



	@Override
	public TestBoard TestBoardDetail(Integer num) throws Exception {
		testBoardDao.updateTestBoardViewCount(num);
		return testBoardDao.selectTestBoard(num);
	}



	@Override
	public void TestBoardModify(TestBoard Testboard) throws Exception {
		testBoardDao.updateTestBoard(Testboard);
		
	}


	@Override
	public void TestBoardDelete(Integer num) throws Exception {
		testBoardDao.deleteTestBoard(num);
		
	}
	

}