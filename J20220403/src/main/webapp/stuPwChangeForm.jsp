<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>개인정보 수정 | CLASS 33</title>
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/myPageStuPwChange.css">
	
	<script type="text/javascript">
		 function chk() {
			 if(!frm.oldPw.value){
				 alert("기존 비밀번호를 입력해주세요")
				 frm.oldPw.focus();
				return false;
			 }
	
			if (frm.newPw.value != frm.newPwCheck.value) {
				alert("변경할 비밀번호가 일치하지않습니다.");
				frm.newPwCheck.focus();				
			return false;
			} 
			
			return true;
		}
	</script>
</head>
<body>
	<div id="wrap">
		<div id="margin_wrap">
			<jsp:include page="stu_header.jsp"/>
			
		    <main>
				<jsp:include page="stu_myPageSNB.jsp"/>
	
				<!-- 개인정보 수정 컨텐츠 영역---------------------------------------------------------------------- -->	
				<section class="section_com"> 
					<h2>비밀번호 변경</h2>
					<form action="stuPwChangePro.do" name="frm" onsubmit="return chk()" method="post">
						<ul class="ul_wrapping">
							<li>
								<label for="password" class="label">기존 비밀번호</label>
								<input class="i-box" type="password" name="oldPw" >
							</li><p>
							<li>
								<label for="password2" class="label">변경할 비밀번호</label>
								<input class="i-box" type="password" name="newPw">
							</li><p>
							<li>
								<label for="password2" class="label">비밀번호 확인</label>
								<input class="i-box" type="password" name="newPwCheck" >
								<p class="pwtext">
							</li><p>
							<li>
								<input class="i-box-reset" type="reset" value="취소">
								<input class="i-box-submit" type="submit" value="수정 완료">
							</li><p>
						</ul>
					</form>
					
				</section>
				<!-- 끝 ------------------------------------------------------------------------------------- -->
			</main>
		    <jsp:include page="stu_footer.jsp"/>
    	</div>
    	<!-- margin_wrap 끝 -->
    </div>
    <!-- wrap 끝 -->
</body>
</html>