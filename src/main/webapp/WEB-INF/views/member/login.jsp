<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/login.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

 
<form id="login_form" method="post">
  <div class="login-form">
      <div>
      <input type="text" class="input_id" name="memberId" placeholder="아이디"><br>
      </div>
      <div>
      <input type="password" class="input_pw" name="memberPw" placeholder="비밀번호"><br>
      </div>
            <c:if test = "${result == 0 }">
                <div class = "login_no">ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            </c:if>

      <input type="button" value="로그인" class="login_button">
      <input type="button" value="돌아가기" class="return_button"  onclick="location.href='../board/list'">

  </div>
</form>



 
<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
        

    	 
        $("#login_form").attr("action", "/member/login");
        $("#login_form").submit();
        
    });
 
    
</script>
</body>
</html>

