package service;

import java.util.List;

import dao.TestBoardCommentDao;
import dao.TestBoardCommentDaoImpl;
import dao.TestBoardDao;
import dao.TestBoardDaoImpl;
import dto.TestBoardComment;

public class TestBoardCommentServiceImpl implements TestBoardCommentService {
	private TestBoardCommentDao testBoardCommentDao;
	public TestBoardCommentServiceImpl() {
		testBoardCommentDao = new TestBoardCommentDaoImpl();
	}


	@Override
	public void boardCommentWrite(TestBoardComment testBoardComment) throws Exception {
		TestBoardDao testBoardDao = new TestBoardDaoImpl();
		Integer num=testBoardComment.getPost_num();
		testBoardDao.updateTestBoardCommentCountUp(num);
		testBoardCommentDao.insertBoardComment(testBoardComment);

	}
	
	@Override
	public void boardModify(Integer comment_num) throws Exception {
		testBoardCommentDao.updateBoardComment(comment_num);
		
	}



	@Override
	public void boardDelete(Integer comment_num) throws Exception {
		TestBoardDao testBoardDao = new TestBoardDaoImpl();
		Integer num  = (testBoardCommentDao.selectBoardComment(comment_num)).getPost_num();
		testBoardDao.updateTestBoardCommentCountDown(num);
		testBoardCommentDao.deleteBoardComment(comment_num);
	}


	@Override
	public List<TestBoardComment> boardCommentSelect(Integer postnum) throws Exception {
		return testBoardCommentDao.selectBoardCommentList(postnum);
	}


	@Override
	public TestBoardComment boardCommentSelectOne(Integer comment_num) throws Exception {
		return testBoardCommentDao.selectBoardComment(comment_num);
	}







	



	

}