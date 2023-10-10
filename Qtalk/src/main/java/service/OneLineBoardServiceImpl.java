package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.OneLineBoardDAO;
import dao.OneLineBoardDAOImpl;
import dto.OneLineBoard;
import util.PageInfo;

public class OneLineBoardServiceImpl implements OneLineBoardService {
	private OneLineBoardDAO oneLineBoardDao;
	public OneLineBoardServiceImpl() {
		oneLineBoardDao = new OneLineBoardDAOImpl();
	}
	@Override
	public void boardwirte(OneLineBoard olb) throws Exception {
		oneLineBoardDao.insertOneLineBoard(olb);
	}
	@Override
	public Map<String, Object> oneLineBoardListByPage(Integer page) throws Exception {
		PageInfo pageInfo = new PageInfo();
		int oneLineBoardCount = oneLineBoardDao.selectOneLineBoardCount();
		int maxPage = (int)Math.ceil((double)oneLineBoardCount/10);
		int startPage = (page-1)/10*10+1; // 1, 11, 21, 31...
		int endPage = startPage+10-1; // 10,20,30...
		if(endPage>maxPage) endPage=maxPage;
		if(page > maxPage) page = maxPage;
		
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10+1; // 현재 페이지의 시작 row 
		List<OneLineBoard> OneLIneBoardList = oneLineBoardDao.selectOneLineBoardList(row-1);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("OneLIneBoardList", OneLIneBoardList);
		return map;
	}
	@Override
	public Map<String, Object> oneLineBoardSearch(String type, String keyword, Integer page) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		PageInfo pageInfo = new PageInfo();
		int oneLineBoardCount = oneLineBoardDao.searchOneLineBoardCount(param);
		int maxPage = (int)Math.ceil((double)oneLineBoardCount/10);
		int startPage = (page-1)/10*10+1; // 1, 11, 21, 31...
		int endPage = startPage+10-1; // 10,20,30...
		if(endPage>maxPage) endPage=maxPage;
		if(page > maxPage) page = maxPage;
		
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		if(page == 0) {
			return map;
		}
		int row = (page-1)*10+1; // 현재 페이지의 시작 row 
		param.put("row", row-1);
		List<OneLineBoard> oneLineBoardList = oneLineBoardDao.searchOneLineBoardList(param);
		
		map.put("oneLineBoardList", oneLineBoardList);
		map.put("type", type);
		map.put("keyword", keyword);
		return map;
	}
	
	
}
