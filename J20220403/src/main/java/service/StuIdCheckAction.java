package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Student;
import dao.StudentDao;

public class StuIdCheckAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			
		String stu_id2=request.getParameter("stu_id2");
		StudentDao stuDao = StudentDao.getInstance();
		System.out.println("stu_id2->"+stu_id2);
		
		String n_password = request.getParameter("n_password");
		String n_password2 = request.getParameter("n_password2");
		
		int result= stuDao.select(stu_id2);
		
		request.setAttribute("stu_id2", stu_id2);
		request.setAttribute("result", result);
		request.setAttribute("n_password", n_password);
		request.setAttribute("n_password2", n_password2);
		if(result ==0) {
			// 사용가능
			request.setAttribute("checked_status", "1");
			
		}else {
			// 기사용  --> 사용불가
			request.setAttribute("checked_status", "0");
			
		}
		
		
		} catch (Exception e) {
		System.out.println(e.getMessage());	
		}
	//	return "stuIdCheck.jsp";
		return "stuJoinForm.jsp";
	}

}
