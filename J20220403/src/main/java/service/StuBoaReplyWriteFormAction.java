package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.StuReplyBoardDao;

public class StuBoaReplyWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			int boardno = 0, ref = 0, re_level = 0, re_step = 0, result=0;
			
			int studno=Integer.parseInt(request.getParameter("studno"));
			System.out.println("studno->"+studno);
			
			String pageNum=request.getParameter("pageNum");
			System.out.println("pageNum->"+pageNum);
			
			
			if(request.getParameter("boardno")!=null) {
				boardno=Integer.parseInt(request.getParameter("boardno"));
				System.out.println("boardno->"+boardno);
				
				StuReplyBoardDao bd=StuReplyBoardDao.getInstance();
				
				result=bd.check(studno); 
				// 회원확인 stundo>0 큰지만 확인해주면 됨 
				// 지금은 게시판의 studno로 체크하니까 다 쓸 수 있지만 여기서 session에서 담아온 studno 를 확인시켜야함
				Board board=bd.select2(boardno); // 객체정보
				
				ref=board.getRef(); // 게시물에 댓글 정보를 불러옴 
				System.out.println("ref->"+ref);
				
				re_level=board.getRe_level();
				System.out.println("re_level->"+re_level);
				
				re_step=board.getRe_step();
				System.out.println("re_step->"+re_step);
				
				
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("studno", studno);
				request.setAttribute("boardno", boardno);
				request.setAttribute("board", board);
				
				request.setAttribute("ref", ref);
				request.setAttribute("re_level", re_level);
				request.setAttribute("re_step", re_step);
				
				request.setAttribute("result", result);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "stuBoaReplyWriteForm.jsp";
	}

}
