<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file ="stuDeleteForm.jsp" %>   --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원탈퇴 | CLASS 33</title>
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/myPageStuUpdate.css">
	
	<script type="text/javascript">
		function deleteCheck(url) {
			var answer = confirm("확인을 누르시면 탈퇴가 완료됩니다.");
			
			if (answer == true) //확인
				location = url;
			else // 취소
				return false;
		}
	</script>
</head>
<body>
	<div id="wrap">
		<div id="margin_wrap">
			<jsp:include page="stu_header.jsp"/>
		    <main>
				<jsp:include page="stu_myPageSNB.jsp"/>
				<!-- 컨텐츠 영역------------------------------------------------------------------------>	
				<section class="section_com"> 
					<h2>회원탈퇴</h2>
					<div class="ul_wrapping">
						<p class="go">정말 회원을 탈퇴 하시겠습니까? 탈퇴를 원하시면 
							<a href="javascript:deleteCheck('stuDeletePro.do')">탈퇴하기</a>를 눌러주세요.</p>
					</div>
				</section>
				<!-- / 컨텐츠 영역------------------------------------------------------------------------>	
			</main>
		    <jsp:include page="stu_footer.jsp"/>
    	</div>
    	<!-- margin_wrap 끝 -->
    </div>
    <!-- wrap 끝 -->	
</body>
</html>