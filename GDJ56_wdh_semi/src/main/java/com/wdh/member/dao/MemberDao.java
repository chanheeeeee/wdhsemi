package com.wdh.member.dao;

import static com.wdh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import com.wdh.member.vo.Member;

public class MemberDao {

	private Properties sql = new Properties();
	
	public MemberDao() {
		try {
			String path=MemberDao.class
					.getResource("/sql/member/member_sql.properties")
					.getPath();
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public Member loginAction(Connection conn, String loginId, String password) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("login"));
			pstmt.setString(1, loginId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = getMember(rs);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return m;
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertMember"));

			pstmt.setString(1, m.getMember_id());
			pstmt.setString(2, m.getMember_nickname());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getPassword());
			pstmt.setString(5, String.valueOf(m.getGender()));
			pstmt.setDate(6, new java.sql.Date(m.getBirth().getTime()));
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getPhone());
			pstmt.setString(9, m.getAddress());
			pstmt.setInt(10, m.getGrade());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Member searchMemberId(Connection conn, String name, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;

		try {
			pstmt = conn.prepareStatement(sql.getProperty("searchId"));
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = new Member();
				m.setMember_id(rs.getString("MEMBER_ID"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	

	//멤버 정보 - 아이디 중복, 뷰
	public Member memberView(Connection conn, String member_id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("memberView"));
			pstmt.setString(1, member_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = getMember(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	
	public String memberGrade(Connection conn, String member_id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String grade = null;
		
		try {
			
			pstmt = conn.prepareStatement(sql.getProperty("memberGrade"));
			pstmt.setString(1, member_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				grade = rs.getString("GRADE_NAME");
				
			}
			
		}  catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return grade;
		
	}


	
	//닉네임 중복
	public Member NicknameDuplicate(Connection conn, String nickname) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("nickDuplicate"));
			pstmt.setString(1, nickname);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = getMember(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	
	
	
	
	
	
	
		

	public static Member getMember(ResultSet rs) throws SQLException {

		Member m = new Member();
		
		m.setMember_no(rs.getInt("MEMBER_NO"));
		m.setMember_id(rs.getString("MEMBER_ID"));
		m.setMember_nickname(rs.getString("MEMBER_NICKNAME"));
		m.setName(rs.getString("MEMBER_NAME"));
		m.setPassword(rs.getString("MEMBER_PASSWORD"));
		m.setGender(rs.getString("GENDER").charAt(0));
		m.setBirth(rs.getDate("BIRTH"));
		m.setEmail(rs.getString("EMAIL"));
		m.setPhone(rs.getString("PHONE"));
		m.setAddress(rs.getString("ADDRESS"));
		m.setGrade(rs.getInt("GRADE"));
		return m;
	}


	public Member searchMember(Connection conn, int memberNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchMember"));
			pstmt.setInt(1, memberNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}













}
