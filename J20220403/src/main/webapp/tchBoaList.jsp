<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>공지사항 관리 | Class 33</title>

    <jsp:include page="tch_head.jsp"></jsp:include>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <jsp:include page="tch_menu.jsp"></jsp:include>

		<!-- ---------------------- 글 시작 되는 부분 --------------------------------------------- -->
        <!-- Layout container -->
        <div class="layout-page">

          <!-- Content wrapper -->
          <div class="content-wrapper">

            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
                <ul class="nav nav-pills flex-column flex-md-row">
                  <li class="navbar-nav-right d-flex align-items-center">
                    <h4 class="fw-bold py-3 mb-4">공지사항 관리</h4>
                  </li>
                  <li class="navbar-nav flex-row align-items-center ms-auto">
                    <button type="submit" class="btn btn-primary me-2 mb-3" onclick="location.href='tchBoaWriteForm.do?pageNum=${pageNum}'">공지사항 등록</button>
                  </li>
                </ul>

              <!-- Basic Bootstrap Table -->
              <div class="card">
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>번호</th>
                        <th>공지사항 제목</th>
                        <th>작성자</th>
                        <th>등록 날짜</th>
                        <th>조회수</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    <c:if test="${totCnt > 0}">
						<c:forEach var="board" items="${list }">
	                      <tr>
	                        <td>${startNum}</td>
	                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>
	                        	<strong><a href='tchBoaContent.do?boardno=${board.boardno }&pageNum=${currentPage }'>${board.subject }</a></strong></td>
                     	   <td>${board.name }</td>
                     	   <td>${board.write_date }</td>
                      		<td>${board.readcount }</td>
	                      </tr>
	                    <c:set var="startNum" value="${startNum - 1}" />
						</c:forEach>
					</c:if>
					<c:if test="${totCnt == 0 }">
						<tr>
							<td colspan=7>데이터가 없네</td>
						</tr>
					</c:if>
			</table>

                </div>
              </div>
              <!--/ Basic Bootstrap Table -->

              <!-- Basic Pagination -->
              <nav aria-label="Page navigation" class="container-p-y">
                <ul class="pagination justify-content-center">
                <c:if test="${startPage > blockSize }">
                  <li class="page-item prev">
                    <a class="page-link" href='tchBoaList.do?pageNum=${startPage-blockSize }'><i class="tf-icon bx bx-chevrons-left"></i></a>
                  </li>
                  </c:if>
                  	<c:forEach var="i" begin="${startPage }" end="${endPage }">
	                 <li class="page-item">
	                    <a class="page-link" href='tchBoaList.do?pageNum=${i}'>${i}</a>
	                  </li>
               	   </c:forEach>
               	  <c:if test="${endPage < pageCnt }">
                  <li class="page-item next">
                    <a class="page-link" href='tchBoaList.do?pageNum=${startPage+blockSize }'><i class="tf-icon bx bx-chevrons-right"></i></a>
                  </li>
                  </c:if>
                </ul>
              </nav>
              <!--/ Basic Pagination -->
            <!-- / Content -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <jsp:include page="tch_footer.jsp"></jsp:include>
    
    
    
  </body>
</html>