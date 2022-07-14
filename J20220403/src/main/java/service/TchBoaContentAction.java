package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class TchBoaContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String pageNum = request.getParameter("pageNum");
		
		try {
		BoardDao bd= BoardDao.getInstance();
		bd.readCount(boardno);
		Board board = bd.select(boardno);
		
		request.setAttribute("board", board);
		System.out.println("baord->"+board);
		request.setAttribute("boardno", boardno);
		System.out.println("baordno->"+boardno);
		request.setAttribute("pageNum", pageNum);
		System.out.println("pageNum->"+pageNum);
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		
		}
		return "tchBoaContent.jsp";
	}

}
