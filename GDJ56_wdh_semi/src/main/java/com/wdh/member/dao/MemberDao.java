package com.wdh.member.dao;

import static com.wdh.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.Properties;

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

	private Member getMember(ResultSet rs) throws SQLException {
		Member m = new Member();
		
		m.setMember_no(rs.getInt("MEMBER_NO"));
		m.setMember_id(rs.getString("MEMBER_ID"));
		m.setMember_nickname(rs.getString("MEMBER_NICKNAME"));
		m.setName(rs.getString("NAME"));
		m.setPassword(rs.getString("PASSWORD"));
		m.setGender(rs.getString("GENDER").charAt(0));
		m.setBirth(rs.getDate("BIRTH"));
		m.setEmail(rs.getString("EMAIL"));
		m.setPhone(rs.getString("PHONE"));
		m.setAddress(rs.getString("ADDRESS"));
		m.setGrade(rs.getInt("GRADE"));
		return m;
	}



}