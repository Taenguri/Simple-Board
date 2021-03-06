# Simple-Board  <br>

### 회원제 게시판 만들기 <hr>

### 기획의도
팀프로젝트를 시작하기전에<br> 
개인 스스로 공부하여 <br>
웹개발의 기본기가 되는 게시판을 만들어서<br>
그동안 배웠던 내용들을 복습합니다.<hr>

### 개요
프로젝트 이름 : Simple Board <br>
개발 인원 :  1명 <br>
개발 기간 :  2022.01.10 ~ 2022.02.01 <br>
주요 기능  -  회원가입 및 로그인 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    -  게시글 등록, 수정, 삭제		 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    -  페이징 및 검색기능  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    -  책 상세보기 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   -  댓글 작성, 수정, 삭제 기능 <br>
개발 환경  : Spring Legacy, Java 1.8, HTML5,CSS3, Jquery, oracle, Maven, bootstrap, Jsp, Mybatis, eclipse<br>

간단 소개  :  회원제 게시판(CRUD) 입니다.  <hr>



### 요구사항 분석

- 회원가입 및 로그인
   
   -  회원가입은 항목들의 공백여부를 판단하여 값을 입력하지 않으면 메시지 출력
   -  회원가입시 비밀번호가 DB에 들어갈때 암호화 적용
   -  회원가입시 아이디 중복체크는 실시간 중복체크 기능 적용
   -  회원탈퇴시 비밀번호 입력해야 회원탈퇴 가능

- 글 조회, 등록, 수정, 삭제
  -  로그인 하지 않은 사용자는 글 조회만 가능
  -  글 수정,삭제시 작정사 본인만 가능
  -  게시글 조회시 조회수 1  증가

- 댓글 등록, 수정, 삭제
   - 로그인 하지 않는 사용자는 이용불가
   - 댓글 관련 기능은 비동기통신 사용
   - 댓글 수정,삭제시  작성자 본인만 가능
   - 로그인 하지 않는 사용자는 댓글 조회만 가능


- 검색 및 페이징 기능
   -  제목, 내용 , 작성자, 제목+내용으로 검색가능
   -  게시글 이동시 검색 및 페이징 기록 유지
   -  한 페이지당 보여줄 게시물 개수는 10개
   -  한 페이지당 보여줄 페이징 넘버는 10개 ex( 이전 1 2 3 ..... 10 다음 ) 
 

<hr>


### UI설계
![image](https://user-images.githubusercontent.com/100080583/156967936-69efb73f-3a72-449a-8d58-fe243640b12c.png)<hr>


### DB설계
![image](https://user-images.githubusercontent.com/100080583/156282212-36363a42-24c5-4fd1-abaf-4806fd27e4dc.png)<hr>


### 게시판 테이블
![image](https://user-images.githubusercontent.com/100080583/156968120-8318a16e-95fd-41ca-a39a-a424f132e1f4.png)<hr>

### 회원 테이블
![image](https://user-images.githubusercontent.com/100080583/156968146-80ae7df3-1aa9-48be-8505-feb3c8ae593d.png)<hr>

### 댓글 테이블
![image](https://user-images.githubusercontent.com/100080583/156968174-1035acbc-0486-4432-8e2f-d6b0c96efb26.png)<hr>



### 기술상세
<hr>

### 인터셉터활용


![image](https://user-images.githubusercontent.com/100080583/156282449-11482550-a496-437c-b42e-3c68f6115b08.png)
![image](https://user-images.githubusercontent.com/100080583/156282545-712eb693-4c00-4bcc-bd20-9395e57c00e4.png)

회원제 게시판이므로 로그인을 하지 않은 사용자가 로그인이 필요한 서비스에 접근 할 경우를 대비해
인터셉터를 활용하여 비회원의 접근을 제한합니다.<hr>


### 회원가입


![image](https://user-images.githubusercontent.com/100080583/156282619-9e8f9c4c-89e9-4fee-a30b-d6dd1fc36f96.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156282630-150a7fc2-e571-46d1-b14e-67030c6e43b3.png)<br>
회원가입시 유효성체크를 통해
공백문자가 없도록 구현했습니다.<hr>
### 회원가입
![image](https://user-images.githubusercontent.com/100080583/156282785-321449f5-4af7-43f1-8dde-e14856e61320.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156282789-be55de52-59b6-4a62-89ae-fe2b5c6ae918.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156282793-5822e61c-cf4c-456d-8b8e-920f80ed4ddc.png)<br>
 Ajax 를 활용하여
실시간 아이디 중복검사를
구현했습니다.       <hr>                                                                                           

### 회원가입

![image](https://user-images.githubusercontent.com/100080583/156283335-47cd3b19-d5e1-4d6d-b108-877def4b7380.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156283346-55bfb8a5-bbfd-4212-84df-1da682ea2b3c.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156283357-e1772fb3-9818-47ac-84ce-4b144fac5a62.png)<br>
스프링 시큐리티 프레임워크에서
제공하는 클래스 중 하나로  비밀번호를 암호화하는 데 사용 할수 있는 메서드를 가진 클래스인 BcryptPasswordEncoder 를 사용하여 회원가입시 비밀번호를
암호화합니다<hr>


### 로그인

![image](https://user-images.githubusercontent.com/100080583/156283387-31909cff-a880-4042-9ea2-90d8e09e6973.png)
![image](https://user-images.githubusercontent.com/100080583/156283395-b62219f8-9934-4e79-830c-1a57f076898b.png)<br>

로그인시 입력받은 데이터와
DB데이터를 비교한후
입력값이같으면 로그인이 가능합니다.<hr>

### 회원탈퇴
![image](https://user-images.githubusercontent.com/100080583/156283634-5b228119-e2e1-4376-915c-2cddca883146.png)<br>
회원탈퇴시 입력받은 비밀번호와
DB비밀번호를 비교하여
비밀번호가 일치하면
회원탈퇴가 가능합니다.<hr>

### 글쓰기

![image](https://user-images.githubusercontent.com/100080583/156283667-4b6ed9b6-eaa0-4f6e-8e0a-fc21a1e414aa.png)<br>
글 작성은
로그인한 사용자만 가능하며
로그인 한상태로 글 작성을 누르면
세션을 이용하여
작성자이름과 작성자Id를 가져옵니다. <hr>

### 글수정
![image](https://user-images.githubusercontent.com/100080583/156283741-1c0c4f05-1acb-470d-a52f-fba5c20427e3.png)
![image](https://user-images.githubusercontent.com/100080583/156283752-2c347301-bfac-4ca0-8881-a91b4a91d92e.png)<br>
글 수정은 
작성자 본인만 가능하며
글 수정 완료시
글번호, 페이지번호, 검색 관련정보를
가지고 상세보기 페이지로 이동합니다.<hr>


### 글삭제

![image](https://user-images.githubusercontent.com/100080583/156283808-28c83149-7a0b-4641-8941-9c715ebd3d55.png)<br>
 글 삭제 역시 
작성자 본인만 가능하며
글 삭제 완료시
글번호, 페이지번호, 검색 관련정보를
가지고 상세보기 페이지로 이동합니다.<hr>

### 검색기능
![image](https://user-images.githubusercontent.com/100080583/156283858-28b62dc5-f32f-425b-ae3c-04b71bb4d262.png)
![image](https://user-images.githubusercontent.com/100080583/156283867-7ffe8ef9-078d-43d9-be25-6bbb69836d2e.png)<br>
동적 sql문을 사용하여
제목, 내용, 작성자, 제목+내용으로
검색 할 수 있습니다.<hr>

### 페이징기능
![image](https://user-images.githubusercontent.com/100080583/156283964-e300c89b-ac41-41f6-ad93-ee9fbabd224e.png)<br>

PageVO 와 PageCreaterVO를 만든후 페이징 알고리즘을 적용시켰습니다.<hr>

### 댓글 등록

![image](https://user-images.githubusercontent.com/100080583/156283993-8fb686a8-958b-4a41-951f-cd8f390eca98.png)
![image](https://user-images.githubusercontent.com/100080583/156283997-726159f9-f4da-4667-a7db-f11ceac58b2b.png)<br>
세션을 활용하여 로그인한 사용자만 댓글기능을 이용할수 있고
비동기통신을 위해
ajax를 사용했습니다.<hr>

### 댓글 수정
![image](https://user-images.githubusercontent.com/100080583/156284028-f0231ce5-a569-408e-88f1-b5388ec643e8.png)
![image](https://user-images.githubusercontent.com/100080583/156970264-7bc20950-ace3-4d4d-bf13-80b8b2014d63.png)<br>
댓글 수정은 
작성자 본인만 가능하도록 
세션을 활용하여 회원Id 값을 비교해 값이 일치하면 수정이 가능합니다.<hr>

### 댓글 삭제

![image](https://user-images.githubusercontent.com/100080583/156284057-a2285ab9-5837-41d8-8813-6ee768b3f0ea.png)
![image](https://user-images.githubusercontent.com/100080583/156970272-0ea36c7e-884b-47a8-9d56-ae0c5cd47c89.png)<br>
댓글 삭제 역시 
작성자 본인만 가능하도록 
세션을 활용하여 회원Id 값을 비교해 값이 일치하면 삭제가 가능합니다.<hr>

### 느낀점

혼자 프로젝트를 진행하면서<br>
게시판을 만들며 기본기를 다졌던 프로젝트였습니다.<br>
학원에서 배우지 않았던<br>
Interceptor 와 BCryptPasswordEncoder 기능들을 <br>
배우면서 사용함으로써 제가 몰랐었던 기능들이 매우 많단 걸 깨달았고<br>
계속 새로운 것을 배우면서 개발자의 길로 조금 더 들어선 걸 느꼈습니다.<br>
비록 이번 프로젝트에서 더 다양한 기능들을 사용하진 못했지만<br>
다음 팀 프로젝트가 끝나면 제가 몰랐던 여려가지 기능들을 혼자 공부하며 사용해볼 생각입니다.<br>















