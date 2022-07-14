package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board;
import dao.BoardDao;

public class TchBoaWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 게시판 글쓰기 폼
		System.out.println("TchBoaWriteFormAction service start...");

		HttpSession session = request.getSession();
		String tch_id = (String) session.getAttribute("tch_id");
		System.out.println("TchUpdateFormAction session tch_id -> " + tch_id);

		if (tch_id != null) {

			try {
				int pageNum = Integer.parseInt(request.getParameter("pageNum"));
				int boardno = 0;
				int ref = 0;
				int tchno = (int) session.getAttribute("tchno");// 선생님 번호 임의 지정

				if (request.getParameter("boardno") != null) { // null이 아니다 어떤 값이 있다 -> 기존글이 있다
					boardno = Integer.parseInt(request.getParameter("boardno")); // 보드 번호 넘겨준 값을 새로지정
					BoardDao bd = BoardDao.getInstance();
					Board board = bd.select(boardno);

					ref = board.getBoardno();
				}
				request.setAttribute("boardno", boardno);// 보드번호 넘겨줄거야
				System.out.println("boardno->" + boardno);
				request.setAttribute("pageNum", pageNum); // 페이지번호를 넘겨줄거야...
				request.setAttribute("ref", ref);
				System.out.println("ref->" + ref);
				request.setAttribute("tchno", tchno);// 선생님번호 넘겨줄거야

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return "tchBoaWriteForm.jsp";

		} else {
			// 세션에 아이디가 없으면 로그인 페이지로 이동
			return "tchLoginForm.do";
		}
	}
}
