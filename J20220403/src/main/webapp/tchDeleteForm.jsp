<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <title>회원탈퇴 | Class 33</title>
	
    <jsp:include page="tch_head.jsp"></jsp:include>
	
	<script type="text/javascript">
      function deleteCheck(url) {
        var answer = confirm("확인을 누르시면 탈퇴가 완료됩니다.");
        
        if (answer == true) //확인
          location = url;
        else // 취소
          return false;
      }
    </script>
    
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
              <h4 class="fw-bold py-3 mb-4">회원탈퇴</h4>
                  <div class="card">
                    <!-- Account -->
                    <div class="card-body">

                      <p>정말 회원을 탈퇴 하시겠습니까? 탈퇴를 원하시면 
                        <a href="javascript:deleteCheck('tchDeletePro.do')">탈퇴하기</a>를 눌러주세요.</p>

                      </div>
                    <!-- /Account -->
                  </div>
            </div>
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