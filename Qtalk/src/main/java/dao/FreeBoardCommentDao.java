package dao;

import java.util.List;

import dto.FreeBoardComment;

public interface FreeBoardCommentDao {
	void insertBoardComment(FreeBoardComment freeBoardComment) throws Exception;
	List<FreeBoardComment> selectBoardCommentList(Integer postnum) throws Exception;
	void updateBoardComment(Integer comment_num) throws Exception;
	void deleteBoardComment(Integer comment_num) throws Exception;
	FreeBoardComment selectBoardComment(Integer comment_num)throws Exception;

	// writer가 id인 댓글 모두 삭제
	void deleteCommentAll(String num) throws Exception;
}