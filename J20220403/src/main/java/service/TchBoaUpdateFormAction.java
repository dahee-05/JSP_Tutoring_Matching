package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class TchBoaUpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("TchBoardUpdateFormAction START...");
			
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String pageNum = request.getParameter("pageNum");
		
		try {
			BoardDao bd = BoardDao.getInstance();
			Board board = bd.select(boardno);
			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);
			
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "tchBoaUpdateForm.jsp";
	}

}
