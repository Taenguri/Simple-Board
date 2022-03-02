<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>

    <title>SimpleBoard</title>
    <meta charset="utf-8" />
		<link rel="stylesheet" href="../resources/css/reply.css">		
		<link rel="stylesheet" href="../resources/css/main.css">
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>		
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  


  <script> 
  function replyList(){
 var bno = ${listContent.bno};
 $.getJSON("/board/content/replyList" + "?bno=" + bno, function(data){
  var str = "";
  
  $(data).each(function(){
   
   console.log(data);
   
   var replyRegdate = new Date(this.replyRegdate);
   replyRegdate = replyRegdate.toLocaleDateString("ko-US")
   
   str += "<li data-rno='" + this.rno + "'>"
     + "<div class='userInfo'>"
     + "<span class='memberId'>" + this.memberId + "</span>"
     + "<span class='memberName'>(" + this.memberName + ")님의 댓글</span>"
     + "<span class='date'>" + replyRegdate + "</span>"
     + "</div>"
     + "<div class='replyContentDiv'>" + this.replyContent + "</div>"
     + "<c:if test='${member != null}'>"
     + "<div class='replyButtonDiv'>"
     + "<button type='button' class='modify' data-rno='" + this.rno + "'>수정</button>"
     + "<button type='button' class='delete' data-rno='" + this.rno + "'>삭제</button>"
     + "</div>"
     + "</c:if>"
     + "</li>";           
  });
  
  $(".replyList ol").html(str);
 });
  }
</script>  
  </head>

  <body>
   		    
  	    <%@include file="../include/nav.jsp" %>
  	
  	
    <div class="header"></div>
    <div class="content_area">
	    <div class="sideleft"></div>
	    <div class="content">
	    
		<div>
        <span class="list_logo">글 상세보기</span>
      </div>
      <hr />
	<div id="container">
				<form name="contentForm" role="form" method="post">
					<input type="hidden" id="bno" name="bno" value="${listContent.bno}" />
					<input type="hidden" id="page" name="page" value="${search.page}"> 
  					<input type="hidden" id="countPerPage" name="countPerPage" value="${search.countPerPage}"> 
 					 <input type="hidden" id="condition" name="condition" value="${search.condition}"> 
  					<input type="hidden" id="keyword" name="keyword" value="${search.keyword}"> 
				</form>
      				<div class="content_header">${listContent.bno}번 게시물 내용</div>
				
					<div class="form-group">
								<label for="title">제목</label>
								<input type="text" id="title" name="title" class="form-control" value="${listContent.title}" readonly="readonly" />
					</div>
					<div class="form-group">
								<label for="content">내용</label>
								<textarea id="content" class="form-control" name="content" readonly="readonly" style="height:100px;"><c:out value="${listContent.content}" /></textarea>
					</div>
					<div class="form-group">			
								<label for="writer">작성자</label>
								<input type="text" id="writer" name="writer" class="form-control" value="${listContent.writer}"  readonly="readonly"/>
					</div>
					<div class="form-group">			
								<label for="memberId">작성자Id</label>
								<input type="text" id="memberId" name="memberId" class="form-control" value="${listContent.memberId}"  readonly="readonly"/>
					</div>				
				<div class="button_line">

          <c:if test="${member.memberId == listContent.memberId}">				
					<button type="submit"  class="update_btn btn btn-warning">수정</button>
					<button type="submit"  class="delete_btn btn btn-warning" >삭제</button>
		</c:if>
					<button type="submit"  class="list_btn btn btn-warning" >목록</button>	
				</div>
				
	
	
			<div id="reply">

 <c:if test="${member == null }">
 	<div class="replylogin">
  <span>댓글을 이용하시려면 <a href="/member/login">로그인</a>이 필요합니다.</span>
 </div>
 </c:if>
 
 <c:if test="${member != null}">
 <div class="replyForm">
  <form role="form" method="post" autocomplete="off">
  
  <input type="hidden" name="bno" id="bno"value="${listContent.bno}">
   <div class="rep1">
    <textarea name="replyContent" id="replyContent"></textarea>
   </div>
   <div class="rep2">
    <button type="button" id="reply_btn">댓글등록</button>
   </div>
   
  </form>
 </div>
 </c:if>
 
<div class="replyList">
 <ol>
   
  </ol>
  <script>
 replyList();
</script>


</div>



</div>
			
				
			
			
			
			
	</div>
	    
	    
	    
	    
	    
	    </div>
	   	<div class="sideright"></div>
   </div>
     	<div class="clerafix"></div>

<script>


		$(document).ready(function(){
			var formObj = $("form[name='contentForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/update");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				if(confirm("정말로 삭제 하시겠습니까?") ){
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
				}
			})
			
			$(".list_btn").click(function () {
				location.href= '/board/list?page=${search.page}' 
								+ '&countPerPage=${search.countPerPage}'
								+ '&keyword=${search.keyword}'
								+ '&condition=${search.condition}';
			});
		})
		
		
		 

		
		
			

 $("#reply_btn").click(function(){
  
  var formObj = $(".replyForm form[role='form']");
  var bno = $("#bno").val();
  var replyContent = $("#replyContent").val();
  var data = {
	  bno : bno,
	  replyContent : replyContent
    };
  
  $.ajax({
   url : "/board/content/registReply",
   type : "post",
   data : data,
   success : function(){
	   alert("댓글 작성 완료")
    replyList();
    $("#replyContent").val("");

   }
  });
 });
		
		
		
 $(document).on("click", ".delete", function(){
  
	 var dconfirm = confirm("정말로 삭제 하시겠습니까?");
	 if (dconfirm){
  var data = {rno : $(this).attr("data-rno")};
	  $.ajax({
		  url : "/board/content/deleteReply",
		  type : "post",
		  data : data,
		  success : function(result){
		   
		   if(result == 1) {
		    replyList();
		    alert("댓글 삭제 완료")
		   } else {
		    alert("작성자 본인만 할 수 있습니다.");    
		   }
		  },
		  error : function(){
		   alert("로그인이 필요합니다.")
		  }
		 });
	 }
 });
 </script>
 
 <div class="replyModal">

 <div class="modalContent">
  
  <div>
   <textarea class="modal_repCon" name="modal_repCon"></textarea>
  </div>
  
  <div>
   <button type="button" class="modal_modify_btn">수정</button>
   <button type="button" class="modal_cancel">취소</button>
  </div>
  
 </div>

 <div class="modalBackground"></div>
 
</div>
 <script>
 // 댓글  수정
	 
	 
	 $(document).on("click", ".modify", function(){
		 $(".replyModal").attr("style", "display:block;");
		 
		 var rno = $(this).attr("data-rno");
		 var replyContent = $(this).parent().parent().children(".replyContentDiv").text();
		 
		 $(".modal_repCon").val(replyContent);
		 $(".modal_modify_btn").attr("data-rno", rno);
		 
		});
	 
	 
 
 $(".modal_cancel").click(function(){
  $(".replyModal").attr("style", "display:none;");
 });
 
 
 
 $(".modal_modify_btn").click(function(){
	 var modifyConfirm = confirm("정말로 수정하시겠습니까?");
	 
	 if(modifyConfirm) {
	  var data = {
	     rno : $(this).attr("data-rno"),
	     replyContent : $(".modal_repCon").val()
	    };  // ReplyVO 형태로 데이터 생성
	  
	  $.ajax({
	   url : "/board/content/modifyReply",
	   type : "post",
	   data : data,
	   success : function(result){
	    
	    if(result == 1) {
	     replyList();
	     $(".replyModal").attr("style", "display:none;");
	     	alert("댓글 수정 완료!");
	    } else {
	     alert("작성자 본인만 할 수 있습니다.");       
	    }
	   },
	   error : function(){
	    alert("로그인하셔야합니다.")
	   }
	  });
	 }
	 
	});
 
 
 
 const result = "${msg}";

 if(result === "modifybno") {
 	alert("수정 완료");
 }
 
</script>



  </body>
</html>
