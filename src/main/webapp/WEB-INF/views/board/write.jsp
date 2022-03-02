<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
        <span class="list_logo">글 작성</span>
      </div>
      <hr />
          <div id="container">
        <form role="form" method="post" action="/board/write" id="registerform">
     		<div class="form-gruop" style="margin-top:20px;">
                  <label for="title">제목</label>
                  <input type="text" id="title" name="title" class="form-control"/>
            </div>
            <div class="form-gruop" style="margin-top:20px;">      
                  <label for="content">내용</label>
                  <textarea id="content" name="content" class="form-control"></textarea>
            </div>      
            <div class="form-gruop" style="margin-top:20px;">      
                  <label for="writer">작성자</label>
                  <input type="text" id="writer" name="writer" value="${member.memberName }" class="form-control" readonly="readonly" />
             </div>
             <div class="form-gruop" style="margin-top:20px;">      
                  <label for="memberID">작성자ID</label>
         <input type="text" id="memberId" name="memberId" value="${member.memberId }"   class="form-control"readonly="readonly"/>
             </div>
                
			<div class="button_line">     
                  <button type="button" id="registerbtn" class="btn btn-warning">작성</button>
       		</div>
        </form>
      </div>
	    
	    
	    
	    
	    
	    </div>
	   	<div class="sideright"></div>
   </div>
     	<div class="clerafix"></div>


<script>
$(document).ready(function(){
	
	
	$("#registerbtn").on("click",function(){
	
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
			registerform.submit();
		}else{
			return false;
		}
		
	});





});


</script>

  </body>
</html>
