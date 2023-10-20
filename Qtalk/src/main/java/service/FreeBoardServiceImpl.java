package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.FreeBoardDao;
import dao.FreeBoardDaoImpl;
import dto.FreeBoard;
import util.PageInfo;

public class FreeBoardServiceImpl implements FreeBoardService{
	private FreeBoardDao freeboardDao;
	
	public FreeBoardServiceImpl() {
		freeboardDao = new FreeBoardDaoImpl();
	}

	@Override
	public void FreeBoardWrite(FreeBoard freeBoard) throws Exception {
		freeboardDao.insertFreeBoard(freeBoard);
	}

	@Override
	public FreeBoard FreeBoardDetail(Integer num) throws Exception {
		freeboardDao.updateFreeBoardViewCount(num);
		return freeboardDao.selectFreeBoard(num);
	}

	@Override
	public void FreeBoardModify(FreeBoard freeboard) throws Exception {
		freeboardDao.updateFreeBoard(freeboard);
	}

	@Override
	public Map<String, Object> FreeBoardListByPage(Integer page) throws Exception {
		PageInfo pageInfo = new PageInfo();
		int boardCount = freeboardDao.selectFreeBoardCount();
		int maxPage = (int)Math.ceil((double)boardCount/10);
		int startPage = (page-1)/10*10+1;  //1,11,21,31...
		int endPage = startPage+10-1; //10,20,30...
		if(boardCount == 0) {
			endPage=1;
			maxPage=1;
		} else if(endPage > maxPage) {
			endPage = maxPage;
		}
		if(page > maxPage) page = maxPage;

		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);

		int row = (page-1)*10+1;  //현재 페이지의 시작 row
		List<FreeBoard> freeboardList = freeboardDao.selectFreeBoardList(row-1);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("freeBoardList", freeboardList);
		return map;
	}

	// 특정 id 게시판 모두 삭제
	@Override
	public void boardDeleteAll(String id) throws Exception {
		freeboardDao.deleteBoardAll(id);
	}

	// id가 작성한 게시판 num 리스트
	@Override
	public List<String> boardNumList(String id) throws Exception {
		return freeboardDao.selectBoardNum(id);
	}


	// freeboarddDAO 에서 id로 freeboard List 가져오기
	@Override
	public List<FreeBoard> myWriteFreeBoard(String id) throws Exception {
		return freeboardDao.selectIdFreeBoardList(id);
	}
	
	@Override
	public Map<String, Object> FreeBoardSearch(String type, String keyword, Integer page) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		
		PageInfo pageInfo = new PageInfo();
		int freeBoardCount = freeboardDao.searchFreeBoardCount(param);
		int maxPage = (int)Math.ceil((double)freeBoardCount/10); //ceil은 올림
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
		List<FreeBoard> freeBoardList = freeboardDao.searchFreeBoardList(param);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("freeBoardList", freeBoardList);
		map.put("type", type);
		map.put("keyword", keyword);
		return map;

	}

	@Override
	public void freeBoardDelete(Integer num) throws Exception {
		freeboardDao.deleteFreeBoard(num);
	}// 게시물 하나 삭제
}

