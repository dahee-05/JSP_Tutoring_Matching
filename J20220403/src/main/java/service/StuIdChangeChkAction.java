package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StuIdChangeChkAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String checked_status = "0";
		String stu_id2 = request.getParameter("stu_id2");
		String n_password = request.getParameter("n_password");
		String n_password2 = request.getParameter("n_password2");
		
		
		request.setAttribute("checked_status", checked_status);
		request.setAttribute("stu_id2", stu_id2);
		request.setAttribute("n_password", n_password);
		request.setAttribute("n_password2", n_password2);
		
		
		
		return "stuJoinForm.jsp";
	}

}
