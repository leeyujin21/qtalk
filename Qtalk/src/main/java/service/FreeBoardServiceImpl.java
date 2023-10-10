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
	public void freeboardWrite(FreeBoard freeBoard) throws Exception {
		freeboardDao.insertFreeBoard(freeBoard);
	}

	@Override
	public FreeBoard freeboardDetail(Integer num) throws Exception {
		return freeboardDao.selectfreeBoard(num);
	}

	@Override
	public void freeboardModify(FreeBoard freeboard) throws Exception {
		freeboardDao.updatefreeBoard(freeboard);
	}

	@Override
	public Map<String, Object> freeBoardListByPage(Integer page) throws Exception {
		PageInfo pageInfo = new PageInfo();
		int boardCount = freeboardDao.selectFreeBoardCount();
		int maxPage = (int)Math.ceil((double)boardCount/10);
		int startPage = (page-1)/10*10+1;  //1,11,21,31...
		int endPage = startPage+10-1; //10,20,30...
		if(endPage>maxPage) endPage=maxPage;
		if(page>maxPage) page=maxPage;

		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);

		int row = (page-1)*10+1;  //현재 페이지의 시작 row
		List<FreeBoard> boardList = freeboardDao.selectFreeBoardList(row-1);

		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("boardList", boardList);
		return map;
	}
}

