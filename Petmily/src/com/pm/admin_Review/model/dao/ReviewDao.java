package com.pm.admin_Review.model.dao;

import static com.pm.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.pm.admin_Review.model.vo.Review;
import com.pm.common.model.vo.PageInfo;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
	
	try {
		prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/db/sql/admin/review-mapper.xml").getPath() ));
	} catch (IOException e) {
		e.printStackTrace();
	}
	
	
}

	/* 1. Review 전체게시글 수 */
	public int selectListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
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
	
	/* 2. 최신글순으로 페이징바에 맞게 조회 */
	public ArrayList<Review> selectList(Connection conn, PageInfo pi) {
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("review_no"),
								 	rset.getString("product_no"),
								 	rset.getString("product_name"),
								 	rset.getString("mem_no"),
								 	rset.getString("mem_nick"),
								 	rset.getString("review_content"),
								 	rset.getString("review_grade"),
								 	rset.getString("review_date"),
								 	rset.getString("manager_no"),
								 	rset.getString("reply_content"),
								 	rset.getString("reply_date"),
								 	rset.getInt("count"),
								 	rset.getString("status")));
			}
	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return  list;
		
	}
	
}
