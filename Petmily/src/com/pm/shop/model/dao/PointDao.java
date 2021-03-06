package com.pm.shop.model.dao;

import static com.pm.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.pm.common.model.vo.PageInfo;
import com.pm.shop.model.vo.Point;

public class PointDao {

	private Properties prop = new Properties();
	
	public PointDao() {
		try {
			prop.loadFromXML(new FileInputStream( PointDao.class.getResource("/db/sql/shop/mp-point-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		// select문 -> ResultSet(한개) -> int 
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
	
	public ArrayList<Point> selectList(Connection conn, PageInfo pi){
		// select문 => resultset(여러행) => ArrayList<Point>

		ArrayList<Point> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			/*
			 * 시작값 : (currentPage - 1) * boardLimit + 1
			 * 끝값 : 시작값 + boardLimit - 1
			 *  
			 */
			int startRow = (pi.getCurrentPage() -1 ) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1,  startRow);
			pstmt.setInt(2,  endRow);
			
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				list.add(new Point(rset.getInt("point_no"),
								   rset.getString("point"),
								   rset.getString("point_content"),
								   rset.getDate("point_date")
						    	   ));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;

		
	}
	
	public int selectPointSum(Connection conn) {
		// select문 -> ResultSet(한개) -> int
		int pointSum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPointSum");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pointSum = rset.getInt("pointsum");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return pointSum;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
