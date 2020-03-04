package com.todayeat.member;

import java.sql.SQLException;

public interface MemberService {

	boolean joinMember(MemberVO mvo);

	MemberVO loginCheck(MemberVO mvo);

	MemberVO myPage_info(String login);

	MemberVO dbPwd(String login);

	MemberVO searchId(MemberVO mvo);

	MemberVO searchPwd(MemberVO mvo);

	int confirmId(MemberVO mvo);

	int confirmNick(MemberVO mvo);

	int deleteId(MemberVO mvo);

	int updatePwd(MemberVO mvo, String newPwd);

	MemberVO updateMember(MemberVO mvo);

	MemberVO up_Pwd(String login);
	
	void upload_profile(String id, String member_profile) throws SQLException;

	String del_profile(String id) throws SQLException;
}