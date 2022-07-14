<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"> 

table.type01{ 
	width :70%;
	border: 1px solid #808080;
	boarder-collapse: collapse;
	boarder-spacin: 1px;
	margin: 50px 50px;
}
th, td{
	boarder: 1px solid #808080;
	padding: 10px;
	border-bottom: 1px solid #808080;
}
th{
	width:30%;
	background-color: #CDECFA;
}
td{
	width:70%
	text-align: center;
}

</style>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("입력완료");
		location.href="tchBoaList.do?pageNum=${pageNum}";
	</script>
</c:if>
<c:if test="${result==0 }">
	<script type="text/javascript">
		alert("오류야");
		location.href="tchBoaWriteForm.do?boardno=${board.boardno}&pageNum=${pageNum}";
	</script>
</c:if>
</body>
</html>