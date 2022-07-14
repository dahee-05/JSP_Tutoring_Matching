<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
</head>
<body>
<form action="stuBoaReplyWritePro.do?" method="post">

	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="studno" value="${studno }">
	<input type="hidden" name="boardno" value="${boardno }">

	<input type="hidden" name="tchno" value="${board.tchno }">
	<input type="hidden" name="subject" value="${board.subject }">
	<input type="hidden" name="write_date" value="${board.write_date }">
	<input type="hidden" name="readcount" value="${board.readcount }">
	
	<input type="hidden" name="ref" value="${ref}">
	<input type="hidden" name="re_step" value="${re_step}">
	<input type="hidden" name="re_level" value="${re_level}">
	
	<c:if test="${result >= 0 }">
		<input type="text" width="500" name="content" required="required">
		<input type="submit" value="입력">
	</c:if>	
	
	<c:if test="${result < 0 }">
	<!-- result==0으로 변경해야함 -->
		<script type="text/javascript">
			alert("회원만 이용할 수 있습니다.");
			location.href="stuBoaContent.do?studno=${studno}&pageNum=${pageNum}&boardno=${boardno}&ref=${ref}";
		</script>
	</c:if>
</form>
</body>
</html>