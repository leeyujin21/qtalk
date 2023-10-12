package service;

import dto.Member;

public interface MemberService {
	Member login(String id, String password) throws Exception;
	void join(Member member) throws Exception;
	
	void memberchange(Member member) throws Exception;

	String idforget(String email) throws Exception;
	String pwforget(String id, String email) throws Exception;
	
	/*중복체크*/
	Boolean idCheck(String id) throws Exception;
	Boolean nicknameCheck(String nickname) throws Exception;
	Boolean eamilCheck(String email) throws Exception;
}
