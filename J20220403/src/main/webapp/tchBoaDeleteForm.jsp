<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html
  lang="utf-8"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <title>공지사항 삭제 | Class 33</title>
    <jsp:include page="tch_head.jsp"></jsp:include>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <jsp:include page="tch_menu.jsp"></jsp:include>
        
         <!-- Layout container -->
        <div class="layout-page">

          <!-- Content wrapper -->
          <div class="content-wrapper">

            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
                <h4 class="fw-bold py-3 mb-4">공지사항 삭제</h4>
                
                <!-- Basic Layout -->
                <div class="col-xxl">
                    <div class="card mb-4">
                      <div class="card-header d-flex align-items-center justify-content-between">
                        <h5 class="mb-0">정말 삭제하시겠습니까?</h5>
                        <!-- <small class="text-muted float-end">Default label</small> -->
                      </div>
                     </div>
                   </div>
                   <div class="card-body">				
                      <form action="tchBoaDeletePro.do">
						<input type="hidden" name="pageNum" value="${pageNum }"><br>
						<input type="hidden" name="boardno" value="${boardno }"><br>
					
		           	<div class="row justify-content-end">
		              <div class="mt-2">
		                <button type="button" class="btn btn-outline-secondary" onclick="location.href='tchBoaContent.do?boardno=${boardno }&pageNum=${pageNum }'">취소</button>
		                <button type="submit" class="btn btn-primary me-2" >확인</button>
		              </div>
		            </div>
	           		 </form>
	           </div>
	            
                                       
	</main>
	<jsp:include page="tch_footer.jsp"></jsp:include>
</body>
</html>