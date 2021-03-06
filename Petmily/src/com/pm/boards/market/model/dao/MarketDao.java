package com.pm.boards.market.model.dao;

import static com.pm.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.pm.boards.market.model.vo.Market;
import com.pm.common.model.vo.Attachment;
import com.pm.common.model.vo.PageInfo;
import com.pm.common.model.vo.Reply;

public class MarketDao {
	
	private Properties prop = new Properties();
	
	public MarketDao() {
		try {
			prop.loadFromXML(new FileInputStream(MarketDao.class.getResource("/db/sql/boards/market-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMarket(Connection conn, Market m) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMarket");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(m.getMarketWriter()));
			pstmt.setInt(2, Integer.parseInt(m.getCategory()));
			pstmt.setInt(3, Integer.parseInt(m.getdCategory()));
			pstmt.setString(4, m.getMarketTitle());
			pstmt.setString(5, m.getMarketContent());
			pstmt.setInt(6, Integer.parseInt(m.getPrice()));
			
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
				
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
					
				result = pstmt.executeUpdate();
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Market> selectMarketList(Connection conn, PageInfo pi){
		ArrayList<Market> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMarketList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Market m = new Market();
				
				m.setMarketNo(rset.getInt("market_no"));
				m.setCategory(rset.getString("category"));
				m.setdCategory(rset.getString("d_category"));
				m.setMarketTitle(rset.getString("market_title"));
				m.setMarketContent(rset.getString("market_content"));
				m.setPrice(rset.getString("price"));
				m.setTitleImg(rset.getString("titleImg"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int increaseCount(Connection conn, int marketNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, marketNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Market selectMarket(Connection conn, int marketNo) {
		
		Market m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMarket");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, marketNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Market(rset.getInt("market_no"),
						       rset.getString("nickname"),
						       rset.getString("category"),
						       rset.getString("d_category"),
						       rset.getString("market_title"),
						       rset.getString("market_content"),
						       rset.getString("pricetxt"),
						       rset.getInt("price"),
						       rset.getInt("count"),
						       rset.getString("enroll_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	public ArrayList<Attachment> selectAttachmentList(Connection conn, int marketNo){
		ArrayList<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, marketNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setAttachmentNo(rset.getInt("attachment_no"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
				
				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int updateMarket(Connection conn, Market m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMarket");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getCategory());
			pstmt.setString(2, m.getdCategory());
			pstmt.setString(3, m.getMarketTitle());
			pstmt.setString(4, m.getMarketContent());
			pstmt.setInt(5, Integer.parseInt(m.getPrice()));
			pstmt.setInt(6, m.getMarketNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertNewAttachment(Connection conn, Attachment att) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, att.getOriginName());
			pstmt.setString(2, att.getChangeName());
			pstmt.setInt(3, att.getRefNo());
			pstmt.setString(4, att.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateAttachment(Connection conn, Attachment att) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, att.getOriginName());
			pstmt.setString(2, att.getChangeName());
			pstmt.setString(3, att.getFilePath());
			pstmt.setInt(4, att.getAttachmentNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteMarket(Connection conn, int marketNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMarket");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, marketNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectMarketCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMarketCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getReplyWriter());
			pstmt.setInt(2, r.getContentNo());
			pstmt.setString(3, r.getReplyContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectReplyCount(Connection conn, int mno) {
		int replyCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				replyCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return replyCount;
	}

	public ArrayList<Reply> selectReplyList(Connection conn, PageInfo pi, int mno) {
		ArrayList<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, mno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reply r = new Reply();
				r.setReplyNo(rset.getInt("reply_no"));
				r.setWriterNickname(rset.getString("nickname"));
				r.setWriterImg(rset.getString("mem_img"));
				r.setReplyContent(rset.getString("reply_content"));
				r.setModifyDate(rset.getString("modify_date"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return list;
	}

	public ArrayList<Market> selectMainList(Connection conn) {
		ArrayList<Market> mMarketList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Market m = new Market();
				m.setMarketNo(rset.getInt("market_no"));
				m.setdCategory(String.valueOf(rset.getInt("d_category")));
				m.setMarketTitle(rset.getString("market_title"));
				m.setMarketContent(rset.getString("market_content"));
				m.setPrice(rset.getString("pricetxt"));
				m.setTitleImg(rset.getString("titleimg"));
				
				mMarketList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mMarketList;
	}
}
