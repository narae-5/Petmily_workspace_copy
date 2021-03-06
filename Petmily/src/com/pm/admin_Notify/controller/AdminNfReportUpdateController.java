package com.pm.admin_Notify.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pm.admin_Notify.model.service.AdminNotifyService;

/**
 * Servlet implementation class AdminNfReportUpdateController
 */
@WebServlet("/reportUd.ad")
public class AdminNfReportUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNfReportUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int reportNo = Integer.parseInt(request.getParameter("rnum"));
	
		int result = new AdminNotifyService().updateReportCount(reportNo);
	
		if(result > 0) {
			request.getSession().setAttribute("alert", "경고처리를 완료 했습니다.");
			
			response.sendRedirect(request.getContextPath() + "/nfList.ad?cpage=1");
		}else {
			request.setAttribute("errorMsg", "에러났다 야.");
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
