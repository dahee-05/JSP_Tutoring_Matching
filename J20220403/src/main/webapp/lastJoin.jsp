<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>학생 회원가입 Page</title>
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/lastJoin.css">
</head>
<body>
	<div id="wrap">
		<div id="margin_wrap">
		    <jsp:include page="stu_header.jsp"/>
		    
		        	
			<main>
				<form action="stuLoginForm.do" >
			<div class="lastjoin">
			    <p>회원가입이 성공적으로 완료 되었습니다!</p>
				<input class="button_area" type="submit" value="로그인 후 이용하기"	>
			</div>    	
			</form>
			</main>
		    
		     <jsp:include page="stu_footer.jsp"/>
    	</div>
    	<!-- margin_wrap 끝 -->
    </div>
    <!-- wrap 끝 -->
</body>
</html>