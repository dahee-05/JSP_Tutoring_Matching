package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;

public class TchBoaDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");


		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String pageNum = request.getParameter("pageNum");
		
		try {
		BoardDao bd = BoardDao.getInstance();
		
		int result = bd.delete(boardno);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("boardno", boardno);
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "tchBoaDeletePro.jsp";
	}

}
