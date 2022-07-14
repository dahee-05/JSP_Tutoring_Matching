package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class TchBoaWriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("tchBoaWriteProAction start...");
		
		request.setCharacterEncoding("utf-8");
		String pageNum = request.getParameter("pageNum");
		System.out.println("pageNum->"+pageNum);

		
		try {
			Board board = new Board();
			board.setBoardno(Integer.parseInt(request.getParameter("boardno")));
			System.out.println("boardno ->"+request.getParameter("boardno"));  

			board.setTchno(Integer.parseInt(request.getParameter("tchno")));
			System.out.println("tchno ->"+request.getParameter("tchno"));
			
			board.setSubject(request.getParameter("subject"));
			System.out.println("subject ->"+request.getParameter("subject"));

			board.setContent(request.getParameter("content"));
			System.out.println("content ->"+request.getParameter("content"));

			board.setRef(Integer.parseInt(request.getParameter("ref")));
			System.out.println("ref->"+request.getParameter("ref"));
//			
//			board.setRe_step(Integer.parseInt(request.getParameter("re_step")));
//			board.setRe_level(Integer.parseInt(request.getParameter("re_level")));
			
			BoardDao bd = BoardDao.getInstance(); //DB
			
			int result = bd.insert(board);  //dao
			request.setAttribute("boardno", board.getBoardno());
			System.out.println("boardno=>"+board.getBoardno());

			request.setAttribute("result", result);
			System.out.println("result=>"+result);
			
			request.setAttribute("pageNum", pageNum);
			System.out.println("pageNum=>"+pageNum);
			
		} catch (Exception e) {
			System.out.println("e.getMessage()->"+e.getMessage());
		} 
		
		return "tchBoaWritePro.jsp";
	}

}
