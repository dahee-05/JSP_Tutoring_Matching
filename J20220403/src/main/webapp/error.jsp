<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<% response.setStatus(200); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#error_box{
		width:60%;
		margin:0 auto;
		margin-top:60px;
		margin-bottom:20px;
	}
	#error_box img {
		width:100%;
	}
	
	#btnBack {
		width:150px;
		margin:0 auto;
		margin-bottom:80px;
		cursor:pointer;
	}
	#btnBack img {
		width:100%;
	}

</style>

<script type="text/javascript">
	function back(){
		history.go(-1);
		/* location.href="main.do"; */
	}
</script>

</head>
<body>
	<div id="wrap">
		<div id="margin_wrap">
		    <jsp:include page="stu_header.jsp"/>
		    
			<div id="error_box">
				<img alt="에러이미지" src="images/error.png">
			</div>
			
			<div id="btnBack"  onclick="back()">
				<img alt="이전페이지" src="images/back.png">
			</div>
			
		    <jsp:include page="stu_footer.jsp"/>
    	</div>
    	<!-- margin_wrap 끝 -->
    </div>
    <!-- wrap 끝 -->
</body>
</html>