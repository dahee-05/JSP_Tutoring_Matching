package service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Teacher;
import dao.TeacherDao;

public class TchUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("TchUpdateProAction start...");
		
		HttpSession session = request.getSession();
		String tch_id = (String) session.getAttribute("tch_id");
		System.out.println("TchUpdateProAction tch_id -> " + tch_id);
		
		try {
			Teacher teacher = new Teacher();

			request.setCharacterEncoding("utf-8");
			String filename = "";				// 파일명 초기화
			int maxSize = 10 * 1024 * 1024;		// 파일 최대 용량 사이즈 지정 10MB
			String fileSave = "/fileSave/profile";		// 파일이 저장될 서버 경로
			String realPath = request.getSession().getServletContext().getRealPath(fileSave);
			System.out.println("TchUpdateProAction realPath->" +realPath);
			
			MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration en = multi.getFileNames();
			
			while (en.hasMoreElements()) {
				String filename1 = (String) en.nextElement();
				filename = multi.getFilesystemName(filename1);
				String original = multi.getOriginalFileName(filename1);
				String type = multi.getContentType(filename1);
				
				File file = multi.getFile(filename1);
				
				System.out.println("TchUpdateProAction 파라미터 이름->" + filename1);
				System.out.println("TchUpdateProAction 실제 파일 이름->" + original);
				System.out.println("TchUpdateProAction 저장된 파일 이름->" + filename);
				System.out.println("TchUpdateProAction 파일 타입->" + type);
				
				if (file != null) {
					System.out.println("크기 -> " + file.length());
					teacher.setResume(filename);
				} else {
					teacher.setResume(multi.getParameter("orgRes"));
				}
					
			}
			
			System.out.println(multi.getParameter("tch_id"));
			System.out.println(multi.getParameter("name"));
			System.out.println(multi.getParameter("phone"));
			System.out.println(multi.getParameter("birth"));
			System.out.println(multi.getParameter("gender"));
			System.out.println(filename);

			
			teacher.setTch_id(multi.getParameter("tch_id"));
			teacher.setName(multi.getParameter("name"));
			teacher.setPhone(multi.getParameter("phone"));
			teacher.setBirth(multi.getParameter("birth"));
			teacher.setGender(Integer.parseInt(multi.getParameter("gender")));
//			teacher.setResume(filename);
			System.out.println("ok");
			
			TeacherDao tchDao = TeacherDao.getInstance();
			int result = tchDao.update(teacher);
			System.out.println("TchUpdateProAction update result -> " + result);
			// 확인
			System.out.println("TchUpdateProAction id -> " + teacher.getTch_id());
			System.out.println("TchUpdateProAction name -> " + teacher.getName());
			System.out.println("TchUpdateProAction phone -> " + teacher.getPhone());
			System.out.println("TchUpdateProAction birth -> " + teacher.getBirth());
			System.out.println("TchUpdateProAction gender -> " + teacher.getGender());
			System.out.println("TchUpdateProAction resume -> " + teacher.getResume());
			
			request.setAttribute("result", result);
			//request.setAttribute(filename, "fileSave\\" + filename);
			
		} catch (SQLException e) {
			System.out.println("TchUpdateProAction SQLException -> " + e.getMessage());
		}
		return "tchUpdatePro.jsp";
	}

}
