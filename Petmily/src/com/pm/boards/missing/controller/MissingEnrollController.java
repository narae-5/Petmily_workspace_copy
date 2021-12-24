package com.pm.boards.missing.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.pm.boards.missing.modle.service.MissingService;
import com.pm.boards.missing.modle.vo.Missing;
import com.pm.common.MyFileRenamePolicy;
import com.pm.common.model.vo.Attachment;

/**
 * Servlet implementation class MissingEnrollController
 */
@WebServlet("/enroll.missing")
public class MissingEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MissingEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 30 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/boards_upfiles/missing_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Missing mi = new Missing();
			mi.setMissingWriter(multiRequest.getParameter("uno"));
			mi.setdCategory(Integer.parseInt(multiRequest.getParameter("d-category")));
			mi.setCategory(Integer.parseInt(multiRequest.getParameter("category")));
			mi.setpGender(multiRequest.getParameter("gender"));
			mi.setpName(multiRequest.getParameter("mpName"));
			mi.setpAgeFrom(Integer.parseInt(multiRequest.getParameter("mpAgeFrom")));
			mi.setpAgeTo(Integer.parseInt(multiRequest.getParameter("mpAgeTo")));
			mi.setMissingDate(multiRequest.getParameter("miDate"));
			mi.setLocation(multiRequest.getParameter("mpPlace"));
			mi.setFeature(multiRequest.getParameter("feature"));
			
			ArrayList<Attachment> list = new ArrayList<>();
			
			int fileCount = Integer.parseInt(multiRequest.getParameter("file-count"));
			
			for(int i=1; i<=fileCount; i++) {
				
				String key = "file"+i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					Attachment att = new Attachment();
					att.setOriginName(multiRequest.getOriginalFileName(key));
					att.setChangeName(multiRequest.getFilesystemName(key));
					att.setFilePath("resources/boards_upfiles/missing_upfiles/");
					
					list.add(att);
				}
			}
			
			int result = new MissingService().enrollMissing(mi, list);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/main.missing?page=1");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
