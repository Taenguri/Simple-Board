<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>SimpleBoard</title>
    <meta charset="utf-8" />
		<link rel="stylesheet" href="resources/css/main.css">
		<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  </head>

  <body>
   		    
  	    <%@include file="include/nav.jsp" %>	
  	
    <div class="content_area">
	    <div class="sideleft"></div>
	    <div class="content"></div>
	   	<div class="sideright"></div>
   </div>
     	<div class="clerafix"></div>
       	<div class="footer"></div>
<script>

const result = "${msg}";

if(result === "loginSuccess") {
	alert("로그인 성공");
}
if(result === "logoutSuccess") {
	alert("로그아웃 성공");
}
if(result === "registerSuccess") {
	alert("회원가입 성공");
} 
if(result === "deleteok") {
	alert("회원탈퇴 성공");
}


</script>  
  </body>
</html>
