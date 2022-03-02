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
  	
  	
    <div class="content_area">
	   <div class="sideleft"></div>
	    <div class="content">
	    
		<div>
        <span class="list_logo">Simple board</span>
      </div>
      <hr />
			<div id="container">
				<form role="form" method="get">
					<table class="table table-hover">
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성자ID</th><th>등록일</th><th>조회수</th></tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								<td>
									<a style="color:#FFB900" href="/board/content?bno=${list.bno}&page=${pc.paging.page}&countPerPage=${pc.paging.countPerPage}&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}"><c:out value="${list.title}" /></a>
								</td>
								<td><c:out value="${list.writer}" /></td>
								<td><c:out value="${list.memberId}" /></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${list.hit }"/></td>
							</tr>
						</c:forEach>
						
					</table>
								<div class="search row">
								 	<div class="col-md-2">
				                    <select id="condition"  name="condition" class="form-control" >    
			                            <option value="title" ${param.condition == 'title' ? 'selected' : ''}>제목</option>
			                            <option value="content" ${param.condition == 'content' ? 'selected' : ''}>내용</option>
			                            <option value="writer" ${param.condition == 'writer' ? 'selected' : ''}>작성자</option>
			                            <option value="titleContent" ${param.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
			                        </select>
			                       </div>
			                        <div class="col-md-4">
			                        	<div class="input-group">
						   				 <input class="form-control" type="text" name="keyword" id="keywordInput" value="${param.keyword}"/>
						    				<span class="input-group-btn">
						    				<button id="searchBtn" type="button" class="btn btn-default">검색</button>
				 							</span>
				 						</div>	
				 					</div>
				 					<div class="col-md-6">
				 						<div class="writebtn">
				 						    <c:if test="${ member != null }">
				 							<button id="writeBtn" type="button" onclick="location.href='/board/write'">글쓰기</button>
				 							</c:if>
				 						</div>
				 					</div>
				 				 </div>
				 				 
								<div >
								  <ul class="pagination">
								    <c:if test="${pc.prev}">
								    	<li><a style="background-color: #FFB900; margin-top: 0; height: 40px; color: white; border: 0px solid #FFB900;"
								    	 href="list${pc.makeURI(pc.startPage - 1)}">이전</a></li>
								    </c:if> 
								
								    <c:forEach begin="${pc.startPage}" end="${pc.endPage}" var="idx">
								<li <c:out value="${pc.paging.page == idx ? 'class=active' : ''}" />>
								<a style="margin-top: 0; height: 40px; color: #FFB900; border: 1px solid #FFB900;"
								href="list${pc.makeURI(idx)}">${idx}</a></li>
								    </c:forEach>
								
								    <c:if test="${pc.next}">
								    	<li><a style="background-color: #FFB900; margin-top: 0; height: 40px; color: white; border: 0px solid #FFB900; "
								    	 href="list${pc.makeURI(pc.endPage + 1)}">다음</a></li>
								    </c:if> 
								  </ul>
								</div>
						
				</form>
			</div>
	    
	    
	    
	    
	    
	    </div>
	   	<div class="sideright"></div>
   </div>
     	<div class="clerafix"></div>
     	<div class="footer"><</div>

    <script>
	$("#searchBtn").click(function() {
	const keyword = $("#keywordInput").val();
	const condition = $("#condition option:selected").val();
	
	location.href="/board/list?keyword="+keyword
			+"&condition=" + condition;
	
}); 
	
					
		const result = "${msg}";
		if(result === "deletebno") {
			alert("게시물 삭제 성공");
		}
		if(result === "registerbno") {
			alert("게시물 등록 완료");
		}
</script>

  </body>
</html>
