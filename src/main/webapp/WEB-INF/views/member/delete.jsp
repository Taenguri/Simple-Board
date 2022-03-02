<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/delete.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

 
<form id="delete_form" method="post">
  <div class="delete_form">
      <div>
      <input type="text" class="input_id" name="memberId" value="${member.memberId}" readonly="readonly"><br>
      </div>
      <div>
      <input type="text" class="input_name" name="memberName" value="${member.memberName}" readonly="readonly"><br>
      </div>
      <div>
      <input type="password" class="input_pw" name="memberPw" placeholder="비밀번호"><br>
      </div>
			<c:if test="${msg == 'nomatchpw'}">
                <div class = "delete_no">비밀번호를 잘못 입력하셨습니다.</div>
            </c:if>

      <input type="button" value="회원탈퇴" class="delete_button">
      <input type="button" value="돌아가기" class="return_button" onclick="location.href='../board/list'"	>

  </div>
</form>



 
<script>

    $(".delete_button").click(function(){
        
		if(confirm("회원탈퇴 하시겠습니까?") ){
        $("#delete_form").attr("action", "/member/delete");
        $("#delete_form").submit();
			
		}
    	 
        
    });
    
 


</script>
</body>
</html>

