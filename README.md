# Simple-Board  <br>

간단한 회원제 게시판 만들기 <br>

프로젝트 이름 : Simple Board <br>
개발 인원 :  1명 <br>
개발 기간 :  2022.01.10 ~ 20.02.01 <br>
주요 기능  -  회원가입 및 로그인 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    -  게시글 등록, 수정, 삭제		 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    -  페이징 및 검색기능  <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    -  책 상세보기 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   -  댓글 작성, 수정, 삭제 기능 <br>
개발 환경  :  Spring framework, Java,, HTML5,CSS3, Jquery, oracle,  bootstrap <br>

간단 소개  :  회원제 게시판(CRUD) 입니다. 

### DB설계
![image](https://user-images.githubusercontent.com/100080583/156282212-36363a42-24c5-4fd1-abaf-4806fd27e4dc.png)



### 기술상세


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
![image](https://user-images.githubusercontent.com/100080583/156284032-2ea16d63-93f5-4801-90da-fb0e7eb11476.png)<br>
댓글 수정은 
작성자 본인만 가능하도록 
세션을 활용하여 회원Id 값을 비교해 값이 일치하면 수정이 가능합니다.<hr>

### 댓글 삭제

![image](https://user-images.githubusercontent.com/100080583/156284057-a2285ab9-5837-41d8-8813-6ee768b3f0ea.png)
![image](https://user-images.githubusercontent.com/100080583/156284063-4504ed48-a010-487d-906d-5baa747d7d45.png)<br>
댓글 삭제 역시 
작성자 본인만 가능하도록 
세션을 활용하여 회원Id 값을 비교해 값이 일치하면 삭제가 가능합니다.<hr>















