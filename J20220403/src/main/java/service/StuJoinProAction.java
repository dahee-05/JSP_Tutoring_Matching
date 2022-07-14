package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Student;
import dao.StudentDao;

public class StuJoinProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		try {
		request.setCharacterEncoding("utf-8");
		
		
		String stu_id2 = request.getParameter("stu_id2");
		String n_password = request.getParameter("n_password");

		request.setAttribute("stu_id2", stu_id2);
		request.setAttribute("n_password", n_password);
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "stuJoinPro.jsp";
	}

}
