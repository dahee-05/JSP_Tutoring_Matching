<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원 로그인 | CLASS 33</title>
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/loginMain.css">
</head>
<body>
	<div id="wrap">
		<div id="margin_wrap">
			<jsp:include page="stu_header.jsp"/>
		    <main>
		    	<div class="input_area">
					<h2 class="main-h1">로그인</h2>
					<form action="stuLoginPro.do" method="post">
						<input class="input" type="text" name="stu_id" placeholder="아이디" required="required">
						<input class="input" type="password" name="password" placeholder="비밀번호" required="required">
						<input class="button_area" type="submit" value="로그인">
						<div class="joingo">
							아직 회원이 아니신가요? <a href="stuJoinForm.do">회원가입하기</a></p>
						</div>
					</form>
		    	</div>
			</main>
		    
		    <jsp:include page="stu_footer.jsp"/>
    	</div>
    	<!-- margin_wrap 끝 -->
    </div>
    <!-- wrap 끝 -->
</body>
</html>