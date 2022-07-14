package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Classe;
import dao.ClassSearchDao;

public class ClsSearchAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		System.out.println("ClsSearchAction Service Start...");
		ClassSearchDao csd = ClassSearchDao.getInstance();
		String sword = (String)request.getParameter("search");
		System.out.println(sword);
		try {
			int totCnt = csd.getTotalCnt(sword);	//40
			
			int isSearch = 1;
			
			List<Classe> list = csd.classList(sword); 	
			
			String context = request.getContextPath();
			request.setAttribute("context", context);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("list", list);
			request.setAttribute("isSearch", isSearch);
		
			
			System.out.println("-----------------------------------------------");   
			System.out.println("totCnt-->" + totCnt);  // /ch16/list.do

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} 
		
		
		
		
		return "clsList.jsp";
	}

}
