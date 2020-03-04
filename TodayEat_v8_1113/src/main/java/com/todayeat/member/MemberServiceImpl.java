package com.todayeat.member;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired 
	private MemberService memberDAO;

	@Override
	public boolean joinMember(MemberVO mvo) {
		System.out.println("확인 : " + mvo.getId());
		return memberDAO.joinMember(mvo);
	}
	
	@Override
	public MemberVO loginCheck(MemberVO mvo) {
		return memberDAO.loginCheck(mvo);
	}
	
	@Override
	public MemberVO searchId(MemberVO mvo) {
		return memberDAO.searchId(mvo);
	}
	
	@Override
	public MemberVO searchPwd(MemberVO mvo) {
		return memberDAO.searchPwd(mvo);
	}
	
	@Override
	public int confirmId(MemberVO mvo) {
		return memberDAO.confirmId(mvo);
	}
	
	@Override
	public int confirmNick(MemberVO mvo) {
		return memberDAO.confirmNick(mvo);
	}
	
	@Override
	public MemberVO myPage_info(String login) {
		return memberDAO.myPage_info(login);
	}
	
	@Override
	public int deleteId(MemberVO mvo) {
		return memberDAO.deleteId(mvo);
	}
	
	@Override
	public MemberVO dbPwd(String login) {
		return memberDAO.dbPwd(login);
		
	}

	@Override
	public int updatePwd(MemberVO mvo, String newPwd) {
		return memberDAO.updatePwd(mvo, newPwd);
	}

	@Override
	public MemberVO updateMember(MemberVO mvo) {
		return memberDAO.updateMember(mvo);
	}

	@Override
	public MemberVO up_Pwd(String login) {
		return memberDAO.up_Pwd(login);
	}
	
	@Override
	public void upload_profile(String id, String member_profile) throws SQLException {
		memberDAO.upload_profile(id, member_profile);
		
	}

	@Override
	public String del_profile(String id) throws SQLException {
		return memberDAO.del_profile(id);
		
	}
	
}
	

