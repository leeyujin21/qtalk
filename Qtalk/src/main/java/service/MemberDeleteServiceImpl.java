package service;

import java.util.List;

public class MemberDeleteServiceImpl implements MemberDeleteService {
	
	@Override
	public void deleteAll(String id) throws Exception {
		// 게시판 댓글 삭제
		FreeBoardCommentService fbcs = new FreeBoardCommentServiceImpl();
		fbcs.commentDeleteAll(id);
		TestBoardCommentService tbcs = new TestBoardCommentServiceImpl();
		tbcs.commentDeleteAll(id);
		
		// 탈퇴하는 member가 작성한 게시판 모두 삭제
		// 자유게시판 삭제
		FreeBoardService freeBoardService = new FreeBoardServiceImpl();
		FreeBoardCommentService freeBoardCommentService = new FreeBoardCommentServiceImpl();
		List<String> freeNumList = freeBoardService.boardNumList(id);
		for(String num : freeNumList) {
			freeBoardCommentService.commentDeleteAll(num);			
		}
		freeBoardService.boardDeleteAll(id);
		
		// 시험게시판 삭제
		TestBoardService testBoardService = new TestBoardServiceImpl();
		TestBoardCommentService testBoardCommentService = new TestBoardCommentServiceImpl();
		List<String> testNnumList = testBoardService.boardNumList(id);
		for(String num : testNnumList) {
			testBoardCommentService.commentDeleteAll(num);			
		}
		testBoardService.boardDeleteAll(id);
		
		// 한 줄 게시판 삭제
		new OneLineBoardServiceImpl().boardDeleteAll(id);
		
		// 북마크 삭제
		new BookMarkServiceImpl().bookMarkDeleteAll(id);
		
		// member 삭제
		new MemberServiceImpl().memberDelete(id);
	}

}
