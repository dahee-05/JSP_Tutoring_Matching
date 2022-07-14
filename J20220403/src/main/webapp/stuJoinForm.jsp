<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입 | CLASS 33</title>
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/joinMain.css">
	
	<script type="text/javascript">

		
		function chk(){
			if(frm.n_password.value !=frm.n_password2.value){
				alert("암호가 다릅니다");
				frm.n_password2.focus();
				return false;
			}
			if(frm.checked_status.value =='0' || frm.checked_status.value == null){
				alert("중복체크를 수행해주세요");
				frm.stu_id2.focus();
				return false;
			} 
	/* 		
		 	if(frm.checked_id.value==0){
				alert('ID 중복확인해주세요.');
				return false;
	 		} 
			*/
			return true; 
		}
		
		function winop(){
			if(!frm.stu_id2.value){
				alert("id를 입력하고 사용하세요")
				frm.stu_id2.focus();
			    return false; 
			}
			// window.open("stuIdCheck.do?stu_id=" +frm.stu_id.value, "","width=300 height=300");
			location.href="stuIdCheck.do?stu_id2=" +frm.stu_id2.value+"&n_password="+frm.n_password.value+"&n_password2="+frm.n_password2.value;
			
	    }    
		
		function idChangeChk() {
			if(${checked_status == 1}){
				location.href="stuIdChangeChk.do?checked_status=${checked_status}&stu_id2="+frm.stu_id2.value+"&n_password="+frm.n_password.value+"&n_password2="+frm.n_password2.value;
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
		<form action="stuJoinForm2.do" name="frm" onsubmit="return chk()">
		<div class="input_area">
				<h2 class="main-h1">회원가입</h2>
				
				<div class="join_sty">
				<input class="input" type="text" name="stu_id2" maxlength="20"  value="${stu_id2 }"
				       placeholder="아이디" required="required" title="20글자내외로 입력하시오" onchange="idChangeChk()">
				</div>
				<input class="join_sty2" type="button" value="중복확인" onclick="winop()" >
				<span class="msg">
						<c:if test="${result ==0}">사용가능한 ID입니다.</c:if>
						<c:if test="${result ==1}">사용불가한 ID입니다.</c:if>
				</span><p> 
				
			  	<input type="hidden" name="checked_status" value="${checked_status }"> 
			  	
				<input class="input" type="password" name="n_password" placeholder="비밀번호" required="required" value="${n_password }">
				<input class="input" type="password" name="n_password2" placeholder="비밀번호 확인" required="required" value="${n_password2 }">
		<input class="button_area" type="submit" value="회원가입">
		
		<div class="logingo">
		    <p>이미 회원이신가요? <a href="stuLoginForm.do">로그인하기</a></p>
		</div>
	</div>		
	</form>
	</main>
	<!-- ------------------------------------------------------	Main 끝 ---------------------------------------------------------->		    
		    
		    <jsp:include page="stu_footer.jsp"/>
    	</div>
    	<!-- margin_wrap 끝 -->
    </div>
    <!-- wrap 끝 -->
</body>
</html>