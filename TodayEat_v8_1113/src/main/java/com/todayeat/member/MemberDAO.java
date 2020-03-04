package com.todayeat.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import com.todayeat.dbconn.TodayeatDBConn;

@Repository
public class MemberDAO implements MemberService {

	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public MemberDAO() throws ClassNotFoundException, SQLException {
		con = new TodayeatDBConn().getConnection();
	}
	
	public void pstmtClose() throws SQLException {
		if(pstmt != null) {
			pstmt.close();
		}
	}
	
	public void allClose() throws SQLException {
		if(rs != null) {
			rs.close();
		}
		if(pstmt != null) {
			pstmt.close();
		}
		if(con != null) {
			con.close();
		}
	}
	
	/* (non-Javadoc)
	 * @see com.todayeat.member.MemberService#joinMember(com.todayeat.member.MemberVO)
	 */
	@Override
	public boolean joinMember(MemberVO mvo) {
		
		String sql ="insert into TodayeatMember (id,password,name,nickname,phone,email,address) values(?,?,?,?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mvo.getId());
			pstmt.setString(2, mvo.getPassword());
			pstmt.setString(3, mvo.getName());
			pstmt.setString(4, mvo.getNickname());
			pstmt.setString(5, mvo.getPhone());
			pstmt.setString(6, mvo.getEmail()+"@"+ mvo.getEmail02());
			pstmt.setString(7, mvo.getAddress());			
			pstmt.executeUpdate();
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("DAO");
		return true;
	}

	/* (non-Javadoc)
	 * @see com.todayeat.member.MemberService#loginCheck(com.todayeat.member.MemberVO)
	 */
//		준상씨 코드
//	@Override
//	public boolean loginCheck(MemberVO mvo) {
//
//		String sql ="select * from TodayeatMember where id=? and password=?";
//		
//		try {
//			pstmt = con.prepareStatement(sql);					
//			pstmt.setString(1, mvo.getId());
//			pstmt.setString(2, mvo.getPassword()); 
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				
//				return true;
//				
//			
//							} 
//		}catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return false;  
//	}
	
//		윤동 수정 코드 , 관심레시피,  나의 레시피에서 nickname을 사용하는데 null 값으로 처리 되서, 
//		로그인시 , nickname도 session에 넣기 위한 작업
	@Override
	public MemberVO loginCheck(MemberVO mvo) {

		String sql ="select * from TodayeatMember where id=? and password=?";
		MemberVO vo = new MemberVO();
		try {
			pstmt = con.prepareStatement(sql);					
			pstmt.setString(1, mvo.getId());
			pstmt.setString(2, mvo.getPassword()); 
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				vo.setId(rs.getString("id"));
				vo.setPassword(rs.getString("password"));
				vo.setNickname(rs.getString("nickname"));
			
							} 
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;  
	}
	
	
	/* (non-Javadoc)
	 * @see com.todayeat.member.MemberService#myPage_info(java.lang.String)
	 */
	@Override
	public MemberVO myPage_info(String login) {
		MemberVO mbvo = new MemberVO();
		String sql = "select * from TodayeatMember where id=?";
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login);		
			rs = pstmt.executeQuery();		
			if(rs.next()) {
				mbvo.setId(rs.getString("id"));
				mbvo.setPassword(rs.getString("password"));
				mbvo.setName(rs.getString("name"));
				mbvo.setNickname(rs.getString("nickname"));
				mbvo.setPhone(rs.getString("phone"));
				mbvo.setEmail(rs.getString("email"));
				mbvo.setAddress(rs.getString("address"));
				mbvo.setProfile(rs.getString("member_profile"));
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return mbvo;
	}
	
	/* (non-Javadoc)
	 * @see com.todayeat.member.MemberService#dbPwd(java.lang.String)
	 */
	@Override
	public MemberVO dbPwd(String login) {
		MemberVO mbvo = new MemberVO();
		String sql = "select * from TodayeatMember where id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login);		
			rs = pstmt.executeQuery();		
			if(rs.next()) {
				mbvo.setId(rs.getString("id"));
				mbvo.setPassword(rs.getString("password"));
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
		return mbvo;	
	}

	/* (non-Javadoc)
	 * @see com.todayeat.member.MemberService#searchId(com.todayeat.member.MemberVO)
	 */
	@Override
	public MemberVO searchId(MemberVO mvo) {
		
		MemberVO membervo = new MemberVO();
		String sql =" select id from TodayeatMember where name=? and email=?";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mvo.getName());
			pstmt.setString(2, mvo.getEmail());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println(rs.getString("id"));
				membervo.setId(rs.getString("id"));
				System.out.println(membervo.getId());
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return membervo;
	}

	/* (non-Javadoc)
	 * @see com.todayeat.member.MemberService#searchPwd(com.todayeat.member.MemberVO)
	 */
	@Override
	public MemberVO searchPwd(MemberVO mvo) {
		MemberVO membervo = new MemberVO();
		String sql = "select password from TodayeatMember where id=? and name=? and email=?";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mvo.getId());
			pstmt.setString(2, mvo.getName());
			pstmt.setString(3, mvo.getEmail());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				membervo.setPassword(rs.getString("password"));
			}
		}catch (SQLException e) {			
			e.printStackTrace();
		}
		
		
		return membervo;
	}

	/* (non-Javadoc)
	 * @see com.todayeat.member.MemberService#confirmId(com.todayeat.member.MemberVO)
	 */
	@Override
	public int confirmId(MemberVO mvo) {		
		int x=-1;
		String sql ="select id from TodayeatMember where id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mvo.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x=1;
				return x;
			}else {
				x=-1;
				return x;
			}		
		}catch (SQLException e) {			
			e.printStackTrace();
		}
		return x;
	}

	/* (non-Javadoc)
	 * @see com.todayeat.member.MemberService#confirmNick(com.todayeat.member.MemberVO)
	 */
	@Override
	public int confirmNick(MemberVO mvo) {
		int x= 0;
		String sql = "select nickname from TodayeatMember where nickname=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mvo.getNickname());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x=1;
				return x;
			}else {
				x=0;
				return x;
			}
			
		}catch (SQLException e) {			
			e.printStackTrace();
		}
		return x;
	}
	
	/* (non-Javadoc)
	 * @see com.todayeat.member.MemberService#deleteId(com.todayeat.member.MemberVO)
	 */
	@Override
	public int deleteId(MemberVO mvo) {
		String dbpwd = "";
		int x= -1;
		
		try {
			pstmt = con.prepareStatement("select password from TodayeatMember where id=?");
			pstmt.setString(1, mvo.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbpwd = rs.getString("password");
				if(dbpwd.equals(mvo.getPassword())) {
					pstmt = con.prepareStatement("delete from TodayeatMember where id=?");
					pstmt.setString(1, mvo.getId());
					x = pstmt.executeUpdate();
					
				}else {
					x = 0;
				}
			}
			
		}catch (SQLException e) {			
			e.printStackTrace();
		}
		
		return x;
	}
	
	/* (non-Javadoc)
	 * @see com.todayeat.member.MemberService#updatePwd(com.todayeat.member.MemberVO, java.lang.String)
	 */
	@Override
	public int updatePwd(MemberVO mvo, String newPwd) {
		String up_pwd ="";
		int x=-1;
		System.out.println(newPwd);
		
		try {
			pstmt = con.prepareStatement("select password from TodayeatMember where id=?");		
			pstmt.setString(1, mvo.getId());
			rs = pstmt.executeQuery();	
			if(rs.next()) {
				up_pwd= rs.getString("password");
				if(up_pwd.equals(mvo.getPassword())) {
					pstmt= con.prepareStatement("update TodayeatMember set password=? where id=?");
					pstmt.setString(1, newPwd);
					pstmt.setString(2, mvo.getId());
					x = pstmt.executeUpdate();
					
				}else {
					x=0;
				}
			}
			
			
			}catch (SQLException e) {			
				e.printStackTrace();
			}
		
		return x;
		
	}
	
	/* (non-Javadoc)
	 * @see com.todayeat.member.MemberService#updateMember(com.todayeat.member.MemberVO)
	 */
	@Override
	public MemberVO updateMember(MemberVO mvo) {
		
		MemberVO mbvo = new MemberVO();
		String sql = "update TodayeatMember set nickname=?, email=? where id=?";
			
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mvo.getNickname());
			pstmt.setString(2, mvo.getEmail());
			pstmt.setString(3, mvo.getId());
			pstmt.executeUpdate();	
			
			mbvo = myPage_info(mvo.getId());
			}catch (SQLException e) {			
				e.printStackTrace();
			}
		return mbvo;	
	}

	/* (non-Javadoc)
	 * @see com.todayeat.member.MemberService#up_Pwd(java.lang.String)
	 */
	@Override
	public MemberVO up_Pwd(String login) {
		MemberVO mbvo = new MemberVO();
		String sql = "select * from TodayeatMember where id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login);		
			rs = pstmt.executeQuery();		
			if(rs.next()) {
				mbvo.setId(rs.getString("id"));
				mbvo.setPassword(rs.getString("password"));
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
		return mbvo;
	}

	@Override
	public void upload_profile (String id, String member_profile) throws SQLException {
		
		String sql = "update todayeatmember set member_profile = ? where id like ?";
				
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, member_profile);
		pstmt.setString(2, id);
		System.out.println(id);
		System.out.println(member_profile);
		
		pstmt.executeUpdate();
		System.out.println("프로필 업로드 성공!");
		
	}
	
	@Override
	public String del_profile(String id) throws SQLException {
		
		String sql = "select member_profile from todayeatmember where id like ?";
		String pro = "";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			pro = rs.getString("member_profile");
		}
		
		if(pro.equals("pro_male.jpg")) {
			return "1";

		} else {
			String sql2 = "update todayeatmember set member_profile = 'pro_male.jpg' where id like ?";
			
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
			return "0";
		}
	}
	
	
}
