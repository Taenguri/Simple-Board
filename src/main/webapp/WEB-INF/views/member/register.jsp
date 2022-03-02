<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/register.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<form id="register_form" method="post">
  	<div class="register-form">
      <div>
      <input type="text" name="memberId" class="input_id" placeholder="아이디"><br>
      			<span class="input_id_ok">사용 가능한 아이디입니다.</span>
				<span class="input_id_no">아이디가 이미 존재합니다.</span>
				<span class="id_check">아이디를 입력해주세요.</span>
				
      </div>
      <div>
      <input type="text" name="memberName" class="input_name" placeholder="이름"><br>
      			<span class="name_check">이름을 입력해주세요.</span>
      </div>
      <div>
      <input type="password" name="memberPw" class="input_pw" placeholder="비밀번호"><br>
      			<span class="pw_check">비밀번호를 입력해주세요.</span>
      </div>
      <div>
      <input type="password"  class="input_pwCheck" placeholder="비밀번호확인"><br>
      			<span class="pwCheck_check">비밀번호 확인을 입력해주세요.</span>
                <span class="input_pwCheck_ok">비밀번호가 일치합니다.</span>
                <span class="input_pwCheck_no">비밀번호가 일치하지 않습니다.</span>      			
      </div>
      <input type="button" value="회원가입" class="register-button">
      <input type="button" value="돌아가기" class="return-button"  class="return_button" onclick="location.href='../board/list'">

	  </div>
    </form>
<script>
/* 유효성 검사 통과유무 변수 */
var idChecking = false;			// 아이디
var idCheckChecking = false;			// 아이디 중복 검사
var pwChecking = false;			// 비번
var pwCheckChecking = false;			// 비번 확인
var pwEqualsChecking = false;		// 비번 확인 일치 확인
var nameChecking = false;			// 이름


$(document).ready(function(){
		
	
	$(".return-button").click(function(){
		
		
	});
	//회원가입 버튼(회원가입 기능 작동)
	$(".register-button").click(function(){
		
	       /* 입력값 변수 */
        var id = $('.input_id').val();                 // id 입력란
        var pw = $('.input_pw').val();                // 비밀번호 입력란
        var pwCheck = $('.input_pwCheck').val();            // 비밀번호 확인 입력란
        var name = $('.input_name').val();            // 이름 입력란
		

        
        /* 아이디 유효성검사 */
        if(id == ""){
            $('.id_check').css('display','block');
            idChecking = false;
        }else{
            $('.id_check').css('display', 'none');
            idChecking = true;
        }
		
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.pw_check').css('display','block');
            pwChecking = false;
        }else{
            $('.pw_check').css('display', 'none');
            pwChecking = true;
        }
 

        
        /* 비밀번호 확인 유효성 검사 */
        if(pwCheck == ""){
            $('.pwCheck_check').css('display','block');
            pwCheckChecking = false;
        }else{
            $('.pwCheck_check').css('display', 'none');
            pwCheckChecking = true;
        }
 

        
        /* 이름 유효성 검사 */
        if(name == ""){
            $('.name_check').css('display','block');
            nameChecking = false;
        }else{
            $('.name_check').css('display', 'none');
            nameChecking = true;
        }

        
        /* 최종 유효성 검사 */
        if(idChecking&&idCheckChecking&&pwChecking&&pwCheckChecking&&pwEqualsChecking&&nameChecking ){
 
		$("#register_form").attr("action", "/member/register");
		$("#register_form").submit();
        }    
		
        return false;

	});
});
//아이디 중복검사
$('.input_id').on("propertychange change keyup paste input", function(){
	/* console.log("keyup 테스트"); */
	
	var memberId = $('.input_id').val();			// .input_id에 입력되는 값
	var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.input_id에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/member/memberIdChk",
		data : data,
		success : function(result){
			// console.log("성공 여부" + result);
			if(result != 'fail'){
				$('.input_id_ok').css("display","inline-block");
				$('.input_id_no').css("display", "none");	
				idCheckChecking = true;
			} else {
				$('.input_id_no').css("display","inline-block");
				$('.input_id_ok').css("display", "none");
				idCheckChecking = false;
			}	
		}// success 종료
	}); // ajax 종료	
});// function 종료




 
/* 비밀번호 확인 일치 유효성 검사 */
 
$('.input_pwCheck').on("propertychange change keyup paste input", function(){
 
    var pw = $('.input_pw').val();
    var pwCheck = $('.input_pwCheck').val();
    $('.pwCheck_check').css('display', 'none');
 
    if(pw == pwCheck){
        $('.input_pwCheck_ok').css('display','block');
        $('.input_pwCheck_no').css('display','none');
        pwEqualsChecking = true;
    }else{
        $('.input_pwCheck_ok').css('display','none');
        $('.input_pwCheck_no').css('display','block');
        pwEqualsChecking = false;
    }        
    
});    
 


</script>
</body>
</html>