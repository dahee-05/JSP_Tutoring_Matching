<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class 33</title>
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function getSSubject(b_subjectno){
		var s_subj400 = document.getElementById("s_subject400");
		var s_subj500 = document.getElementById("s_subject500");
		
		if(b_subjectno == "%400") {
			s_subj400.style.display = "inline";
		} else {
			s_subj400.style.display = "none";
		}
		
		if(b_subjectno == "%500") {
			s_subj500.style.display = "inline";
		} else {
			s_subj500.style.display = "none";
		}
	}
	
	function getSLoc(upper_locno) {
		var s_loc100 = document.getElementById("s_loc100");
		var s_loc200 = document.getElementById("s_loc200");
		
		if(upper_locno == "%100") {
			s_loc100.style.display = "inline";
		} else {
			s_loc100.style.display = "none";
		}
		
		if(upper_locno == "%200") {
			s_loc200.style.display = "inline";
		} else {
			s_loc200.style.display = "none";
		}
		
	}
	


</script>	
	
	
</head>

<body>
	<div id="wrap">
		<div id="margin_wrap">
		    <jsp:include page="stu_header.jsp"/>
		    <!-- ------------------------header 끝 --------------------------- -->
		    
		        	
<!-- ------------------------------------------------------	Main 시작 ---------------------------------------------------------->
		    <main>

				<c:if test="${isSearch==0 }">
					<div id="sorting_box">
						<form action="main.do?">
							<table>
								
								<input type="text" name="grade" value="${grade }" style="display:none">
								
								<tr>
									<th>과목</th>
									<td>
										<select id="b_subject" name="b_subject" onchange="getSSubject(this.value)">
											<option value="%" selected="selected">전체</option>
											<c:forEach var="b_subj" items="${b_subj_list }">
												<option value="%${b_subj.subjectno }">${b_subj.subject_name }</option>
											</c:forEach>										
										</select>
										
										<select id="s_subject400" name="s_subject400" style="display:none">
											<option value="4%" selected="selected">전체</option>
											<c:forEach var="s_subj" items="${s_subj_list400 }">
												<option value="%${s_subj.subjectno }">${s_subj.subject_name }</option>
											</c:forEach>
										</select>
											
										<select id="s_subject500" name="s_subject500" style="display:none">
											<option value="5%" selected="selected">전체</option>
											<c:forEach var="s_subj" items="${s_subj_list500 }">
												<option value="%${s_subj.subjectno }">${s_subj.subject_name }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								
								<tr>
									<th>지역</th>
									<td>
										<select id="b_loc" name="b_loc" onchange="getSLoc(this.value)">
											<option value="%" selected="selected">전체</option>
											<c:forEach var="b_loc" items="${b_loc_list }">
												<option value="%${b_loc.locno }">${b_loc.loc_name }</option>
											</c:forEach>										
										</select>
										
										<select id="s_loc100" name="s_loc100" style="display:none">
											<option value="1%" selected="selected">전체</option>
											<c:forEach var="s_loc" items="${s_loc_list100 }">
												<option value="%${s_loc.locno }">${s_loc.loc_name }</option>
											</c:forEach>
										</select>
										
										<select id="s_loc200" name="s_loc200" style="display:none">
											<option value="2%" selected="selected">전체</option>
											<c:forEach var="s_loc" items="${s_loc_list200 }">
												<option value="%${s_loc.locno }">${s_loc.loc_name }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								
								<tr id="btn_submit">
									<td colspan="2">
										<input type="submit" value="적용">
										<input type="reset"  value="취소">
									</td>
								</tr>
								
								
							</table>
						</form>
					</div> <!-- sorting_box 끝 -->
				</c:if>
				
				
				
				
				<div id="class_box">
					
					<c:if test="${totCnt > 0 }">
						<ul class="clearfix">
							<c:forEach var="classe" items="${list }">
								<li>
									<a href="clsMtch.do?classno=${classe.classno }">
										<c:if test="${classe.main_img != null }">
											<div id="img"><img alt="본문이미지" src="${context }/${classe.main_img}"></div> 
										</c:if>
										
										<c:if test="${classe.main_img == null }">
											<div id="no_image">No Image</div>
										</c:if>
									
										<span class="text_box">
											<h4>${classe.class_name }</h4>
											<p>${classe.keyword }</p>
										</span>
									</a>
								</li>
							</c:forEach>
				 		</ul>
				 	</c:if>
				 	
				 	<c:if test="${totCnt == 0 }">
			 			<div id="no_data">
			 				<p>클래스가 존재하지 않습니다</p>
			 			</div>
		 			</c:if>
				 	
				 	
				 	
					 <%-- <div id="page_num" style="text-align:center">
					 	<c:if test="${startPage > blockSize }">
					 		<a href="clsList.do?pageNum=${startPage-blockSize }&grade=${grade}&b_subject=${b_subject}&s_subject400=${s_subject400}&s_subject500=${s_subject500}&b_loc=${b_loc}&s_loc100=${s_loc100}&s_loc200=${s_loc200}">[이전]</a>
					 	</c:if>
					 	
					 	<c:forEach var="i" begin="${startPage }" end="${endPage }">
					 		<a href="clsList.do?pageNum=${i }&grade=${grade}&b_subject=${b_subject}&s_subject400=${s_subject400}&s_subject500=${s_subject500}&b_loc=${b_loc}&s_loc100=${s_loc100}&s_loc200=${s_loc200}">[${i }]</a>
					 	</c:forEach>
					 	
					 	<c:if test="${endPage < pageCnt }">
					 		<a href="clsList.do?pageNum=${startPage+blockSize }&grade=${grade}&b_subject=${b_subject}&s_subject400=${s_subject400}&s_subject500=${s_subject500}&b_loc=${b_loc}&s_loc100=${s_loc100}&s_loc200=${s_loc200}">[다음]</a>
					 	</c:if>
					 </div> --%>
				
				</div>
					
				 
				
			
			</main>
<!-- ------------------------------------------------------	Main 끝 ---------------------------------------------------------->		    
		    
		    <jsp:include page="stu_footer.jsp"/>
    	</div>
    	<!-- margin_wrap 끝 -->
    </div>
    <!-- wrap 끝 -->
</body>
</html>