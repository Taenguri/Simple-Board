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
인터셉터를 활용하여 비회원의 접근을 제한합니다.


### 회원가입


![image](https://user-images.githubusercontent.com/100080583/156282619-9e8f9c4c-89e9-4fee-a30b-d6dd1fc36f96.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156282630-150a7fc2-e571-46d1-b14e-67030c6e43b3.png)<br>
회원가입시 유효성체크를 통해
공백문자가 없도록 구현했습니다.
### 회원가입
![image](https://user-images.githubusercontent.com/100080583/156282785-321449f5-4af7-43f1-8dde-e14856e61320.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156282789-be55de52-59b6-4a62-89ae-fe2b5c6ae918.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156282793-5822e61c-cf4c-456d-8b8e-920f80ed4ddc.png)<br>
 Ajax 를 활용하여
실시간 아이디 중복검사를
구현했습니다.                                                                                                         



