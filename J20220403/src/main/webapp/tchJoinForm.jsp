<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입 | CLASS 33</title>
	<link rel="stylesheet" type="text/css" href="assets/css/TchLogin.css">
	
	<script type="text/javascript"> 
		function chk(){
			if(frm.n_password.value != frm.n_password2.value){
				alert("암호가 다릅니다");
				frm.n_password2.focus();
				return false;
			}
			if(frm.checked_status.value== '0' || frm.checked_status.value ==null){
				alert("중복체크(사용가능한 ID)를 수행해주세요");
				frm.tch_id2.focus();
			    return false;
			}
			return true;
		}
		function winop(){
			if(!frm.tch_id2.value){
				alert("id를 입력하고 사용하세요")
				frm.tch_id2.focus();
				return false;
			}
			 location.href="tchIdCheck.do?tch_id2=" +frm.tch_id2.value+"&n_password="+frm.n_password.value+"&n_password2="+frm.n_password2.value;
		}    
		function idChangeChk() {
			if(${checked_status == 1}){
				location.href="tchIdChangeChk.do?checked_status=${checked_status}&tch_id2="+frm.tch_id2.value+"&n_password="+frm.n_password.value+"&n_password2="+frm.n_password2.value;
			}
		}
			
</script> 
</head>
<body>
	<div class="authentication-inner">
        <div class="card">
            <div>
            	<a href="main.do">
                	<img src="images/admin_logo2.svg">
                </a>
            </div>
            <div>
                <h3>Special edu starts here 🚀</h3>
                <p>특별한 교육 매칭을 시작하세요!</p>
            </div>
            <div>
                <form action="tchJoinForm2.do" name="frm" onsubmit="return chk()" method="post">
                <div>
                    <input class="input_id" type="text" name="tch_id2" maxlength="20" value="${tch_id2}" title="20글자내외로 입력하시오" 
                    	   placeholder="아이디" required="required" onchange="idChangeChk()">
                    <input class="duplicateCheck" type="button" value="중복확인" onclick="winop()">
                    <input type="hidden" name="checked_status" value="${checked_status}">  
            		<span class="msg">
            			<c:if test="${result == 0}"> 사용가능한 ID입니다.</c:if>
            			<c:if test="${result == 1}"> 사용불가한 ID입니다.</c:if>
            		</span>	
                 </div>   
                    <input class="input" type="password" name="n_password" placeholder="비밀번호" required="required" value="${n_password}">
                    <input class="input" type="password" name="n_password2" placeholder="비밀번호 확인" required="required" value="${n_password2}">
                    <input class="button_area" type="submit" value="회원가입">
                    <div class="joingo">
                        이미 회원이신가요? <a href="tchLoginForm.do">로그인하기</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>