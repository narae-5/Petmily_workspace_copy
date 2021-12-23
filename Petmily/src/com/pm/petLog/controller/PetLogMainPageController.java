package com.pm.petLog.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pm.common.model.vo.Attachment;
import com.pm.petLog.model.service.PetLogService;
import com.pm.petLog.model.vo.PetLog;
import com.pm.petLog.model.vo.PetsRoom;

/**
 * Servlet implementation class PetLogMainPageController
 */
@WebServlet("/main.petLog")
public class PetLogMainPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetLogMainPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<PetsRoom> prList = new PetLogService().selectPetsRoomList();
		ArrayList<PetLog> plList = new PetLogService().selectPetLogList;
		ArrayList<Attachment> attList = new PetLogService().selectAllAttachmentList();
		
		request.setAttribute("prList", prList);
		request.setAttribute("plList", prList);
		request.setAttribute("attList", prList);
		request.getRequestDispatcher("views/petLog/petLogMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
