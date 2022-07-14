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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>공지사항 등록 | Class 33</title>
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
						<h4 class="fw-bold py-3 mb-4">공지사항 보기</h4>

						<!-- Basic Layout -->
						<div class="col-xxl">
							<div class="card mb-4">
								<div
									class="card-header d-flex align-items-center justify-content-between">
									<h5 class="mb-0">Board Content</h5>
									<small class="text-muted float-end">공지사항</small>
								</div>
								<div class="card-body">
									<input type="hidden" name="tchno" value="${board.tchno}">
									<input type="hidden" name="readcount"
										value="${board.readcount }">
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label"
											for="basic-default-name">글번호</label>
										<div class="col-sm-10">${board.boardno }</div>
									</div>
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label"
											for="basic-default-name">작성자</label>
										<div class="col-sm-10">${board.name }</div>
									</div>
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label"
											for="basic-default-name">제목</label>
										<div class="col-sm-10">${board.subject }</div>
									</div>
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label"
											for="basic-default-name">내용</label>
										<div class="col-sm-10">${board.content }</div>
									</div>
								</div>
							</div>
						</div>  <!--  end of basic layout-->
						<div class="row justify-content-end">
							<div class="mt-2">
								<button type="button" class="btn btn-outline-secondary"
									onclick="location.href='tchBoaDeleteForm.do?boardno=${board.boardno}&pageNum=${pageNum }'">삭제</button>
								<button type="button" class="btn btn-outline-secondary"
									onclick="location.href='tchBoaList.do?pageNum=${pageNum }'">취소</button>
								<button type="button" class="btn btn-primary me-2"
									onclick="location.href='tchBoaUpdateForm.do?boardno=${board.boardno}&pageNum=${pageNum }'">수정</button>
							</div>
						</div>
					</div>
					<!-- end of content -->
				</div>
				<!-- end of content wrapper -->
			</div>
			<!--  end of layout container -->
		</div>
	</div>
	<!--  end of layout wrapper -->
	<jsp:include page="tch_footer.jsp"></jsp:include>
</body>
</html>