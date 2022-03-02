package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.service.MemberService;
import com.board.vo.MemberVO;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	

    @Inject
    private BCryptPasswordEncoder Encoder;
	@Inject
	private MemberService memberservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void register() {
		
		
	}
	
	
	//회원가입
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(MemberVO member, RedirectAttributes ra) throws Exception{
		
		 String encodeData = "";            
	     String dbData = ""; 
		
	     
	     dbData = member.getMemberPw();            // 비밀번호 데이터 얻음
	     encodeData = Encoder.encode(dbData);        // 비밀번호 인코딩
	     member.setMemberPw(encodeData);   
		memberservice.register(member);
        ra.addFlashAttribute("msg", "registerSuccess");  		
		
		return "redirect:/main";
		
	}
	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChk(String memberId) throws Exception{
		
		int result = memberservice.idCheck(memberId);
		
		
		if(result != 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}	
		
	} 		

	
	//로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {
		
		
	}
	

	 
    /* 로그인 */
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String login(HttpServletRequest request, MemberVO member, RedirectAttributes ra) throws Exception{
        
        HttpSession session = request.getSession();
        String inputData = "";
        String encodeData = "";
        
        
        
        MemberVO loginvo = memberservice.memberLogin(member);

        
        if(loginvo != null) {            // 일치하는 아이디 존재시
            
        	inputData = member.getMemberPw();        // 사용자가 제출한 비밀번호
        	encodeData = loginvo.getMemberPw();        // 데이터베이스에 저장한 인코딩된 비밀번호
            
            if(true == Encoder.matches(inputData, encodeData)) {        // 비밀번호 일치여부 판단
                
                session.setAttribute("member", loginvo);     // session에 사용자의 정보 저장
                ra.addFlashAttribute("msg", "loginSuccess");                      
                return "redirect:/main";        // 메인페이지 이동
                
                
            } else {
 
                ra.addFlashAttribute("result", 0);            
                return "redirect:/member/login";    // 로그인 페이지로 이동
                
            }
            
        } else {                    // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
            
            ra.addFlashAttribute("result", 0);            
            return "redirect:/member/login";    // 로그인 페이지로 이동
            
        }
 
    }


    /*	 로그아웃 */
    @RequestMapping(value="logout", method=RequestMethod.GET)
    public String logout(HttpServletRequest request, RedirectAttributes ra) throws Exception{
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        ra.addFlashAttribute("msg", "logoutSuccess");  
        return "redirect:/main";        
        
    }
 
    
 // 회원 탈퇴 get
 	@RequestMapping(value="/delete", method = RequestMethod.GET)
 	public void memberDeleteView() throws Exception{
 	}
 	
 	// 회원 탈퇴 post
 	@RequestMapping(value="/delete", method = RequestMethod.POST)
 	public String delete(MemberVO inputData, HttpSession session, RedirectAttributes ra) throws Exception{
 		
 		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
 		MemberVO sessionMember = (MemberVO) session.getAttribute("member");
 		// 세션에있는 비밀번호
 		String sessionPass = sessionMember.getMemberPw();
 		// vo로 들어오는 비밀번호
 		String inputDataPass = inputData.getMemberPw();
 		
 		if(false == Encoder.matches(inputDataPass, sessionPass)) {
 			ra.addFlashAttribute("msg", "nomatchpw");
 			return "redirect:/member/delete";
 		}
 		memberservice.memberDelete(inputData);
 		session.invalidate();
 		ra.addFlashAttribute("msg", "deleteok");
 		return "redirect:/main";
 	}

 	
 	

}
