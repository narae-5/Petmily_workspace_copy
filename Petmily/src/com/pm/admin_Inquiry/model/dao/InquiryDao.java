package com.pm.admin_Inquiry.model.dao;

import static com.pm.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.pm.admin_Inquiry.model.vo.Inquiry;
import com.pm.admin_Inquiry.model.dao.InquiryDao;
import com.pm.common.model.vo.PageInfo;

public class InquiryDao {
	
private Properties prop = new Properties();
	
	public InquiryDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(InquiryDao.class.getResource("/db/sql/admin/inquiry-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
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
	

	public ArrayList<Inquiry> selectList(Connection conn, PageInfo pi) {
		ArrayList<Inquiry> list = new ArrayList<>();
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
				list.add(new Inquiry(rset.getInt("pinquiry_no"),
					 				 rset.getString("mem_no"),
					 				 rset.getString("member_nick"),
					 				 rset.getString("product_no"),
					 				 rset.getString("product_name"),
					 				 rset.getString("pinquiry_title"),
					 				 rset.getString("pinquiry_content"),
					 				 rset.getString("pinquiry_date"),
					 				 rset.getString("manager_no"),
					 				 rset.getString("reply_content"),
					 				 rset.getString("reply_date"),
					 				 rset.getString("secret"),
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