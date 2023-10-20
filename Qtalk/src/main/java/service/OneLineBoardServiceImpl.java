package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.OneLineBoardDAO;
import dao.OneLineBoardDAOImpl;
import dto.Level;
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
		System.out.println("page1 :" + page);
		int Count = oneLineBoardDao.selectOneLineBoardCount();
		int maxPage = (int)Math.ceil((double)Count/10);
		int startPage = (page-1)/10*10+1; // 1, 11, 21, 31...
		int endPage = startPage+10-1; // 10,20,30...
		if(Count == 0) {
			endPage=1;
			maxPage=1;
		} else if(endPage > maxPage) {
			endPage = maxPage;
		}
		if(page > maxPage) page = maxPage;
		
		System.out.println("page2 :" + page);
		System.out.println("count :" + Count);
		System.out.println("maxPage :" + maxPage);
		System.out.println("startPage :" + startPage);
		System.out.println("endPage :" + endPage);
		
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10+1; // 현재 페이지의 시작 row 
		List<OneLineBoard> oneLineBoardList = oneLineBoardDao.selectOneLineBoardList(row-1);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("oneLineBoardList", oneLineBoardList);
		return map;
	}
	// 검색에 일치한 글들을 리스트, 과목명, 검색어를 Map형으로 담아서 return
	@Override
	public Map<String, Object> oneLineBoardSearch(String type, String keyword, Integer page) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		int count = oneLineBoardDao.searchOneLineBoardCount(param);
		int maxPage = (int)Math.ceil((double)count/10);
		int startPage = (page-1)/10*10+1; // 1, 11, 21, 31...
		int endPage = startPage+10-1; // 10,20,30...
		if(endPage > maxPage) endPage = maxPage;
		if(page > maxPage) page = maxPage;
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);

		int row = (page-1)*10+1; // 현재 페이지의 시작 row 
		param.put("row", row-1);
		List<OneLineBoard> oneLineBoardList = oneLineBoardDao.searchOneLineBoardList(param);

		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("oneLineBoardList", oneLineBoardList);
		map.put("type", type);
		map.put("keyword", keyword);
		return map;
	}
	
	// 특정 id 게시판 모두 삭제
	@Override
	public void boardDeleteAll(String id) throws Exception {
		oneLineBoardDao.deleteBoardAll(id);
	}
	
	// writer가 id인 시험 한 줄 게시판 삭제
	public void oneLineBoardDelete(String num) throws Exception {
		oneLineBoardDao.deleteBoard(num);
	}
	
	// onelineboard 에서 인기 있는 시험 3가지 가져오기
	@Override
	public List<Level> oneLineBoardMostSubject() throws Exception {
		return oneLineBoardDao.selectMostSubject();
	}
	
	// onelineboardDAO 에서 id로 onelineboard List 가져오기
	@Override
	public List<OneLineBoard> myWriteOneLineBoard(String id) throws Exception {
		return oneLineBoardDao.selectIdOneLineBoardList(id);
	}
	
	
}
