package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board;
import dao.BoardDao;

public class TchBoaListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("TchBoaListAction service start...");
		
		HttpSession session = request.getSession();
		String tch_id = (String) session.getAttribute("tch_id");
		System.out.println("TchUpdateFormAction session tch_id -> " + tch_id);
		int tchno = (int) session.getAttribute("tchno");
		System.out.println("TchUpdateFormAction session tchno -> " + tchno);
		
		if (tch_id != null) {
		
			try {
				request.setAttribute("menu_num", "2");
				
				BoardDao bd = BoardDao.getInstance();
				int totCnt = bd.getTotalCnt(tchno);
				System.out.println("TchBoaListAction totCnt=>"+totCnt); //6?
				String pageNum=request.getParameter("pageNum");
				if(pageNum==null || pageNum.equals("")) { pageNum = "1";}  
		
				int currentPage = Integer.parseInt(pageNum); 
				int pageSize = 10, blockSize = 10;
				int startRow = (currentPage - 1) * pageSize + 1; 
				int endRow = startRow + pageSize - 1; 
				int startNum = totCnt - startRow + 1; 
				
				//Board 조회 dto 						
				List<Board> list = bd.tchBoardList(tchno, startRow, endRow);
				int pageCnt = (int)Math.ceil((double)totCnt/pageSize); 
				int startPage = (int)(currentPage-1)/blockSize*blockSize +1; 
				int endPage = startPage + blockSize -1; 
				//공갈페이지방지
				if (endPage > pageCnt) endPage = pageCnt; 
				System.out.println("startPage->"+startPage);
				System.out.println("endPage->"+endPage);
				System.out.println("TchBoaListAction list.size()->"+list.size()); //리스트 사이즈 구할 때 
				
				request.setAttribute("totCnt", totCnt);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("startNum", startNum);
				request.setAttribute("list", list);
				request.setAttribute("blockSize", blockSize);
				request.setAttribute("pageCnt", pageCnt);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				
			} catch(SQLException e) {
				System.out.println("ListAction SQLException ->"+e.getMessage());
			}
			
			return "tchBoaList.jsp";
				
		} else {
			// 세션에 아이디가 없으면 로그인 페이지로 이동
			return "tchLoginForm.do";
		}
	}
}
