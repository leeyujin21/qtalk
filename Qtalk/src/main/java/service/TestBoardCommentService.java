package service;

import java.util.List;

import dto.TestBoardComment;

public interface TestBoardCommentService {
	void boardCommentWrite(TestBoardComment testBoardComment) throws Exception;
	void boardModify(Integer comment_num) throws Exception;
	void boardDelete(Integer comment_num) throws Exception;
	List<TestBoardComment>boardCommentSelect(Integer postnum) throws Exception; 
	TestBoardComment boardCommentSelectOne(Integer comment_num) throws Exception;
}