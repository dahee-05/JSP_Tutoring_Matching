<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<style type="text/css"> 

#main { 
	width : 500px;
	float: left;
	border: 1px solid #ccc;
	pading:20px;
}
#container{ 
	width: 500px;
	float: right;
	border: 1px solid #ccc;
	pading: 20px;
	
}
table{
	border: clear;
	pading:20px
}
td{
	height:100px;
}
</style>
<script type="text/javascript">
	function btn(sample){
		alert(sample)
	}

/* 	function button_event(){
		if(confirm("수강신청 하시겠습니까?"==true){
			document.form.submit();
			
		} else {
			
			return;
		}
	} */

</script>
<body>
 <!-- ------------------------header 시작 --------------------------- -->

	<div id="wrap">
		<div id="margin_wrap">
		    <header>
		        <div id="logo">
		            <a href="main.do"><img src="images/logo.svg" class="logo"></a>
		        </div>
		        <div id="search_box">
		            <form>
		                <fieldset>
		                    <legend class="visually-hidden">검색</legend>
		                    <img alt="검색아이콘" src="images/icons/front_search.svg">
		                    <input type="text" maxlength="340" tabindex="1" placeholder="찾으시는 클래스가 있나요?"/>
		                </fieldset>
		            </form>
		        </div>
		        
	            <nav>
	                <div id="nav_items1">
	                    <ul class="clearfix">
	                        <li><a href="stuClsList.do">클래스</a></li>
	                        <li><a href="comboard.do">공지사항</a></li>
	                        <li><a href="stumypage.do">마이클래스</a></li>
	                        <c:if test="${id == null}">
		                        <li><a href="stuJoinForm.do">회원가입</a></li>
		                        <li><a href="stuLoginForm.do">로그인</a></li>
	                        </c:if>
	                        <c:if test="${id != null}">
		                        <li class="userName">${name} 님</li>
		                        <li><a href="stuLogoutPro.do">로그아웃</a></li>
	                        </c:if>
	                    </ul>
	                </div>
	                
	            </nav>
		        
		    </header>
		    
		    <div id="gnb">
	            <ul class="clearfix">
	                <li><a href="#"><h2>고1</h2></a></li>
	                <li><a href="#"><h2>고2</h2></a></li>
	                <li><a href="#"><h2>고3</h2></a></li>
	            </ul>
		    </div>
		    
		    <hr>	
 <!-- ------------------------header 끝 --------------------------- -->
<!-- ------------------------------------------------------	Main 시작 ---------------------------------------------------------->

<form  action="clsMtch.do">
	<div id="main">
		<table>
			<tr><td><img src="${classe.main_img}" alt="루피쓰"></td></tr>
			<tr><td><font size="3" color=black>수강가능지역<br>"${loc.loc_name } </font></td>
		 	<tr><td><font size="3" color=black>수강가능시간<br> ${classe.lec_time }</font></td></tr>
			<tr><td><font size="3" color=black>커리큘럼<br><br></font>${classe.curriculum}</td></tr>
		</table>
	
	</div> <!-- class="type01" -->
	<div id="container">
		<table>
			<tr><td>${teacher.name }선생님 </td></tr>
			<tr><td><font size="5" color=black>${classe.class_name}</font></td></tr>
			<tr><td>${classe.keyword }</td></tr>
			<tr><td><a href="tchResumeView.do">이력서 보기</a>
					<button onclick="javascript:btn('수강신청이 완료되었습니다');">수강신청</button></td></tr> <!-- "location.href='clsMtch.do'" -->
		</div>

</form>

<!-- ------------------------------------------------------	Main 끝 ---------------------------------------------------------->	

	   
</body>
</html>