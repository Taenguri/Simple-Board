<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>SimpleBoard</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    
		<link rel="stylesheet" href="../resources/css/main.css">
		<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  </head>

  <body>
   		    
  	    <%@include file="../include/nav.jsp" %>
  	
  	
    <div class="header"></div>
    <div class="content_area">
	    <div class="sideleft"></div>
	    <div class="content">
	    
		<div>
        <span class="list_logo">글 수정</span>
      </div>
      <hr />
	<div id="container">
				<form id="updateForm" role="form" method="post" action="/board/update">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
					<input type="hidden" id="page" name="page" value="${search.page}"> 
  					<input type="hidden" id="countPerPage" name="countPerPage" value="${search.countPerPage}"> 
 					 <input type="hidden" id="condition" name="condition" value="${search.condition}"> 
  					<input type="hidden" id="keyword" name="keyword" value="${search.keyword}">
  								<div class="form-group">
									<label for="title">제목</label>
									<input type="text" class="form-control" id="title" name="title" value="${update.title}"/>
								</div>
								<div class="form-group">
									<label for="content">내용</label>
									<textarea id="content"  class="form-control" name="content" style="height:100px;"><c:out value="${update.content}" /></textarea>
								</div>	
								<div class="form-gruop">
									<label for="writer">작성자</label>
									<input type="text" id="writer" class="form-control" name="writer" value="${update.writer}" readonly="readonly"/>
								</div>
								<div class="form-group" style="margin-top:20px;">			
									<label for="memberId">작성자Id</label>
									<input type="text" id="memberId" name="memberId" class="form-control" value="${update.memberId}"  readonly="readonly"/>
								</div>
					<div class="button_line">
						<button type="button" id="updatebtn" class="update_btn btn btn-warning">저장</button>
						<button type="submit" class="cancel_btn btn btn-warning">취소</button>
					</div>
				</form>
			</div>
	    
	    
	    
	    
	    
	    </div>
	   	<div class="sideright"></div>
   </div>
     	<div class="clerafix"></div>

<script>
$(document).ready(function(){
	
	$(".cancel_btn").on("click", function(){
		event.preventDefault();
		location.href = "/board/content?bno=${update.bno}"
			   + "&page=${search.page}"
			   + "&countPerPage=${search.countPerPage}"
			   + "&condition=${search.condition}"
			   + "&keyword=${search.keyword}";
	})



	$("#updatebtn").on("click",function(){
		
		let titleCk = false;
		let contentCk = false;
		
		let title = $("input[name='title']").val();
		let content = $("textarea#content").val();
		
		if(title){
			titleCk = true;
		} else {
			alert("제목을 입력해주세요.");
			titleCk = false;
		}
		if(content){
			contentCk = true;
		} else {
			alert("내용을 입력해주세요.");
			contentCk = false;
		}
		
		
		if(titleCk && contentCk){
			updateForm.submit();
		}else{
			return false;
		}
		
	});










})
	
	</script>
	

  </body>
</html>
