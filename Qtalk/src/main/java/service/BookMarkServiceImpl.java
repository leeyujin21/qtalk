package service;

import java.util.List;

import dao.BookMarkDao;
import dao.BookMarkDaoImpl;
import dto.BookMark;
import dto.ExamSchedule;

public class BookMarkServiceImpl implements BookMarkService {
	private BookMarkDao bookMarkDao;
	
	public BookMarkServiceImpl() {
		bookMarkDao = new BookMarkDaoImpl();
	}
	
	
	@Override
	public void insertBookMark(BookMark bookMark) throws Exception {
		bookMarkDao.insertBookMark(bookMark);
	}


	@Override
	public void deleteBookMark(BookMark bookMark) throws Exception {
		bookMarkDao.deleteBookMark(bookMark);
	}


	@Override
	public List<ExamSchedule> selectBookMark(String id) throws Exception {
		return bookMarkDao.selectBookMark(id);
	}


	@Override
	public BookMark isSelectBookMark(BookMark bookMark) throws Exception {
		return bookMarkDao.isSelectBookMark(bookMark);
	}

}
