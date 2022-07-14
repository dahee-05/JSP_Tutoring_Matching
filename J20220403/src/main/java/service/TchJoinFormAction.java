package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TchJoinFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String checked_status= "0";
		System.out.println("TchJoinFormAction start...");
		
		request.setAttribute("checked_status", checked_status);
		
		return "tchJoinForm.jsp";
	}

}
