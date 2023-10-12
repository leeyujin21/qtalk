package service;

import java.util.List;

import dao.FreeBoardCommentDao;
import dao.FreeBoardCommentDaoImpl;
import dao.FreeBoardDao;
import dao.FreeBoardDaoImpl;
import dto.FreeBoardComment;

public class FreeBoardCommentServiceImpl implements FreeBoardCommentService {
	private FreeBoardCommentDao freeBoardCommentDao;
	public FreeBoardCommentServiceImpl() {
		freeBoardCommentDao = new FreeBoardCommentDaoImpl();
	}


	@Override
	public void boardCommentWrite(FreeBoardComment freeBoardComment) throws Exception {
		FreeBoardDao freeBoardDao = new FreeBoardDaoImpl();
		freeBoardDao.updateFreeBoardCommentCountUp(freeBoardComment.getPost_num());
		freeBoardCommentDao.insertBoardComment(freeBoardComment);

	}
	
	@Override
	public void boardModify(Integer comment_num) throws Exception {
		freeBoardCommentDao.updateBoardComment(comment_num);
		
	}



	@Override
	public void boardDelete(Integer comment_num) throws Exception {
		FreeBoardDao freeBoardDao = new FreeBoardDaoImpl();
		Integer num  = freeBoardCommentDao.selectBoardComment(comment_num).getPost_num();
		freeBoardDao.updateFreeBoardCommentCountDown(num);
		freeBoardCommentDao.deleteBoardComment(comment_num);
	}


	@Override
	public List<FreeBoardComment> boardCommentSelect(Integer postnum) throws Exception {
		return freeBoardCommentDao.selectBoardCommentList(postnum);
	}


	@Override
	public FreeBoardComment boardCommentSelectOne(Integer comment_num) throws Exception {
		return freeBoardCommentDao.selectBoardComment(comment_num);
	}







	



	

}