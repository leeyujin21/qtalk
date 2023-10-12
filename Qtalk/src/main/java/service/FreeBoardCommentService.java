package service;

import java.util.List;

import dto.FreeBoardComment;

public interface FreeBoardCommentService {
	void boardCommentWrite(FreeBoardComment freeBoardComment) throws Exception;
	void boardModify(Integer comment_num) throws Exception;
	void boardDelete(Integer comment_num) throws Exception;
	List<FreeBoardComment>boardCommentSelect(Integer postnum) throws Exception; 
	FreeBoardComment boardCommentSelectOne(Integer comment_num) throws Exception;
}