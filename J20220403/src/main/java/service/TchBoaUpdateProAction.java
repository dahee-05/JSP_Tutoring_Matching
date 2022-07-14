package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class TchBoaUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("TchBoaUpdateProAction start...");
		
		request.setCharacterEncoding("utf-8");
		Board board = new Board();
		String pageNum = request.getParameter("pageNum");
		System.out.println("pageNum=>"+pageNum);
		
		board.setBoardno(Integer.parseInt(request.getParameter("boardno")));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		
		try {
			BoardDao bd = BoardDao.getInstance();
			
			int result = bd.update(board);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("boardno", board.getBoardno());
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "tchBoaUpdatePro.jsp";
	}

}
