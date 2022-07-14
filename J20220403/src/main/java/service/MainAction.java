package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Classe;
import dao.ClasseDao;
import dao.LocMaster;
import dao.LocMasterDao;
import dao.Subject;
import dao.SubjectDao;

public class MainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("MainAction start...");
		ClasseDao cd = ClasseDao.getInstance();
		request.setCharacterEncoding("utf-8");
		
		try {
			HttpSession session = request.getSession();
			String stu_id = (String) session.getAttribute("stu_id");
			System.out.println("MainAction stu_id -> " + stu_id);
			String tch_id = (String) session.getAttribute("tch_id");
			System.out.println("MainAction tch_id -> " + tch_id);
			
			
			
			String grade = request.getParameter("grade");
			if(grade==null || grade.equals("")) {
				grade="0";
			} 
			
			
			String subjectno = "%";
			String locno = "%";
			
			String b_subject = request.getParameter("b_subject");
			String s_subject400 = request.getParameter("s_subject400");
			String s_subject500 = request.getParameter("s_subject500");
			
			String b_loc = request.getParameter("b_loc");
			String s_loc100 = request.getParameter("s_loc100");
			String s_loc200 = request.getParameter("s_loc200");
			
			if(b_subject==null || b_subject.equals("")) {
				b_subject = "%";
			}
			if(s_subject400==null || s_subject400.equals("")) {
				s_subject400 = "4%";
			}
			if(s_subject500==null || s_subject500.equals("")) {
				s_subject500 = "5%";
			}
			if(b_loc==null || b_loc.equals("")) {
				b_loc = "%";
			}
			if(s_loc100==null || s_loc100.equals("")) {
				s_loc100 = "1%";
			}
			if(s_loc200==null || s_loc200.equals("")) {
				s_loc200 = "2%";
			}
			
			
			if(b_subject.equals("%") || b_subject.equals("%100") || b_subject.equals("%200") || b_subject.equals("%300")) {
				subjectno = b_subject;
			} else if(b_subject.equals("%400")){
				subjectno = s_subject400;
			} else if(b_subject.equals("%500")){
				subjectno = s_subject500;
			}
			
			if(b_loc.equals("%")) {
				locno = b_loc;
			} else if(b_loc.equals("%100")) {
				locno = s_loc100;
			} else if(b_loc.equals("%200")){
				locno = s_loc200;
			}
			
			int totCnt = cd.getTotalCnt(grade, subjectno, locno);

			List<Classe> list = cd.classList(grade, subjectno, locno);
			
			SubjectDao sd = SubjectDao.getInstance();
			List<Subject> b_subj_list = sd.select_b();
			List<Subject> s_subj_list400 = sd.select_s(400);
			List<Subject> s_subj_list500 = sd.select_s(500);
			
			LocMasterDao ld = LocMasterDao.getInstance();
			List<LocMaster> b_loc_list = ld.select_b();
			List<LocMaster> s_loc_list100 = ld.select_s(100);
			List<LocMaster> s_loc_list200 = ld.select_s(200);
			
			
			
			String context = request.getContextPath();
			int isSearch = 0;
			

			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("list", list);
			request.setAttribute("b_subj_list", b_subj_list);
			request.setAttribute("s_subj_list400", s_subj_list400);
			request.setAttribute("s_subj_list500", s_subj_list500);
			request.setAttribute("b_loc_list", b_loc_list);
			request.setAttribute("s_loc_list100", s_loc_list100);
			request.setAttribute("s_loc_list200", s_loc_list200);
			request.setAttribute("grade", grade);
			request.setAttribute("context", context);
			request.setAttribute("isSearch", isSearch);			
			
			System.out.println("-----------------------------------------------");   
			System.out.println("totCnt-->" + totCnt);  
			System.out.println("grade-->"+grade);
			System.out.println("b_subject-->"+b_subject);
			System.out.println("s_subject400-->"+s_subject400);
			System.out.println("s_subject500-->"+s_subject500);
			System.out.println("b_loc-->"+b_loc);
			System.out.println("s_loc100-->"+s_loc100);
			System.out.println("s_loc200-->"+s_loc200);
			System.out.println("subjectno-->"+subjectno);
			System.out.println("locno-->"+locno);
			System.out.println("list.length-->"+list.size());
			System.out.println();
			System.out.println();
			
			
			// 회원 유형이 학생일 경우에만 세션에 id, pw, name, studno 담아주기
			if (stu_id != null && tch_id == null) {
				String password = (String) session.getAttribute("password");
				String stuName = (String) session.getAttribute("stuName");
				//Integer studno = (Integer) session.getAttribute("studno");
				int studno = (int) session.getAttribute("studno");
				System.out.println(studno);
				System.out.println("MainAction password -> " + password);
				System.out.println("MainAction name -> " + stuName);
				System.out.println("MainAction studno -> " + studno);
				
				// request 객체에 id, pw, name 담아주기 -> clsList.jsp에 값 전달
				request.setAttribute("stu_id", stu_id);
				request.setAttribute("password", password);
				request.setAttribute("stuName", stuName);

			} else if (tch_id != null) 
				// 교사센터에서 학생 서비스 페이지로 이동 시 ' 님 | 로그아웃' --> 선생 회원정보 노출 X
				return "clsList.jsp";
			
		} catch (Exception e) {
			System.out.println("MainAction Exception -> " + e.getMessage());
		}
		return "clsList.jsp";
	}

}
