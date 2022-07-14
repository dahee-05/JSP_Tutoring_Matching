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
	<link rel="stylesheet" type="text/css" href="css/myPageStuUpdate.css">
	
	
	<script type="text/javascript">
		function chk() {
			if (!frm.phone.value) {
				alert("전화번호를 입력하세요.");
				frm.phone.focus();
				return false;
			}
			if (!frm.birth.value) {
				alert("생년월일을 입력하세요.");
				frm.birth.focus();
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
					<h2>개인정보 수정</h2>
					<form action="stuUpdatePro.do" name="frm" onsubmit="return chk()" method="post">
						<ul class="ul_wrapping">
							<li>
								<label for="stu_id" class="label">아이디</label>
								<input class="i-box_disable" type="text" name="stu_id" value="${student.getStu_id()}" readonly="readonly">
								<!-- disabled 로 설정하면 value값을 가져가지 못한다. -->
							</li>
							<li>
								<label for="name" class="label">이름</label>
								<input class="i-box_disable" type="text" name="name" value="${student.getName()}" readonly="readonly">
							</li>
							<li>
								<label for="phone" class="label">전화번호</label>
								<input class="i-box" type="text" name="phone" value="${student.getPhone()}"
									   placeholder="'-' 제외하고 입력" pattern="\d{11}" title="'-' 제외하고 입력" maxlength="11">
									   <!-- required="required" 조건 없애야 얼럿 노출됨 -->	   
							</li>
							<li>
								<label for="birth" class="label">생년월일</label>
								<input class="i-box" type="text" name="birth" value="${student.getBirth()}"
									   placeholder="8자리 입력 (19970205)" pattern="\d{8}" title="생년월일 8자리 입력" maxlength="8">
							</li>
							<li>
								<label for="gender" class="label">성별</label>
								<select class="i-box3" name="gender">
									<c:if test="${student.getGender() == 0 || student.getGender() == null}">
										<option value="${student.getGender()}" selected="selected">남</option>
										<option value="1">여</option>
									</c:if>
									<c:if test="${student.getGender() == 1}">
										<option value="0">남</option>
										<option value="${student.getGender()}" selected="selected">여</option>
									</c:if>
								</select>
							</li>
							<li>
								<input class="i-box-reset" type="reset" value="취소">
								<input class="i-box-submit" type="submit" value="수정 완료">
							</li>
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