<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  	<div class="navbar">
  		<a href="#" id ="logo">SimpleBoard</a>
  	<c:if test = "${member == null }">
  		<ul id="menu">
        	<li><a href="/board/list">게시판</a></li>
  			<li><a href="/member/register">회원가입</a></li>
  			<li><a href="/member/login">로그인</a></li>
  		</ul>
  	</c:if>
    <c:if test="${ member != null }">
  		<ul id="menu">
        	<li><a href="/board/list">게시판</a></li>
  			<li><a href="/member/logout">로그아웃</a></li>
  			<li><a href="/member/delete">회원탈퇴</a></li>  			
  		</ul>            
    
    </c:if>
  	
  	 
  	</div>