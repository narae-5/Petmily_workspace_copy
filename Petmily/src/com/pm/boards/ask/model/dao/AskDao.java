package com.pm.boards.ask.model.dao;

import static com.pm.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.pm.boards.ask.model.vo.Ask;
import com.pm.common.model.vo.Attachment;

public class AskDao {

	private Properties prop = new Properties();
	
	public AskDao() {
		try {
			prop.loadFromXML(new FileInputStream(AskDao.class.getResource("/db/sql/boards/ask-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertAsk(Connection conn, Ask a) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAsk");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a.getWriterNo());
			pstmt.setInt(2, a.getCategory());
			pstmt.setString(3, a.getAskTitle());
			pstmt.setString(4, a.getAskContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {
		
		if(list.isEmpty()) {
			return 1;
		}
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachmentList");
		
		try {
			
			for(Attachment att : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, att.getOriginName());
				pstmt.setString(2, att.getChangeName());
				pstmt.setString(3, att.getFilePath());
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Ask> selectAskList(Connection conn) {
		ArrayList<Ask> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAskList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Ask a = new Ask();
				a.setAskNo(rset.getInt("ask_no"));
				a.setWriterNo(rset.getInt("ask_writer"));
				a.setAskWriterNickName(rset.getString("nickname"));
				a.setCategory(rset.getInt("category"));
				a.setAskTitle(rset.getString("ask_title"));
				a.setAskContent(rset.getString("ask_content"));
				a.setEnrollDate(rset.getString("enroll_date"));
				a.setTitleImg(rset.getString("titleimg"));
				a.setCount(rset.getInt("count"));
				
				list.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int increaseCount(Connection conn, int ano) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ano);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public Ask selectAsk(Connection conn, int ano) {
		Ask a = new Ask();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAsk");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ano);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				a.setAskNo(rset.getInt("ask_no"));
				a.setWriterNo(rset.getInt("ask_writer"));
				a.setAskWriterNickName(rset.getString("nickname"));
				a.setCategory(rset.getInt("category"));
				a.setAskTitle(rset.getString("ask_title"));
				a.setAskContent(rset.getString("ask_content"));
				a.setEnrollDate(rset.getString("enroll_date"));
				a.setCount(rset.getInt("count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return a;
	}

	public ArrayList<Attachment> selectAttachmentList(Connection conn, int ano) {
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ano);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment att = new Attachment();
				att.setAttachmentNo(rset.getInt("attachment_no"));
				att.setOriginName(rset.getString("origin_name"));
				att.setChangeName(rset.getString("change_name"));
				att.setFilePath(rset.getString("file_path"));
				
				list.add(att);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int deleteAsk(Connection conn, int ano) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAsk");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ano);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
