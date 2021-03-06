package com.pm.boards.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pm.boards.qna.model.service.QnaService;
import com.pm.boards.qna.model.vo.Qna;
import com.pm.common.model.vo.Attachment;

/**
 * Servlet implementation class QnaUpdateFormController
 */
@WebServlet("/updateForm.qna")
public class QnaUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qnaNo = Integer.parseInt(request.getParameter("qno"));
		
		Qna q = new QnaService().selectQna(qnaNo);
		Attachment at = new QnaService().selectAttachment(qnaNo);
		
		request.setAttribute("q", q);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("views/boards/qna/qnaUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
