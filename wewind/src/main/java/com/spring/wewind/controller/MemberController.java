package com.spring.wewind.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.wewind.annotation.Auth;
import com.spring.wewind.service.MemberService;
import com.spring.wewind.utility.Gmail;
import com.spring.wewind.vo.BaramVO;
import com.spring.wewind.vo.MemberAuthVO;
import com.spring.wewind.vo.MemberVO;
import com.spring.wewind.vo.UserVO;

@Controller
public class MemberController {
	
	@Inject
	MemberService service;
	final String addr = "@naver.com"; //나중에 @kt.com
	@RequestMapping("/member/contestAdd")
	public String memberContestAdd() {
		return "member/contestAdd";
	}
	
	// @RequestMapping == handlerMapping
	@RequestMapping("/member/login")
	public String memberLogin() {
		return "member/login";
	}
	
	@RequestMapping("/member/join")
	public String memberInsert() {
		return "member/join";
	}
	
	@RequestMapping("/member/password/find")
	public String passwordFind() {
		return "member/passwordF";
	}
	
	
	@RequestMapping(value = "/member/insert", method = RequestMethod.POST)
	public String insertMember(MemberAuthVO param, Model model) {
		String email = param.getAuth_email();
		email+=addr;
		
		MemberVO member = new MemberVO(param.getAuth_id(), param.getAuth_name(), param.getAuth_password(), email, param.getAuth());
		try {
			service.insertMember(member);
		}catch(Exception e) {
			;
		}
		return "redirect:/member/login";
	}
	
	@RequestMapping(value= "/member/password/update/{auth_id}")
	public String passwordUpdate(Model model, @PathVariable("auth_id") String auth_id) {
		model.addAttribute("id", auth_id);
		return "member/passwordM";
	}
	
	@RequestMapping(value = "/member/password/update", method = RequestMethod.POST)
	public String updatePassword(MemberVO param, Model model) {
		int cnt = service.updatePw(param);
		if(cnt==1) {
			model.addAttribute("msg", "비밀번호 변경완료");
		}else {
			model.addAttribute("msg", "비밀번호 변경오류");
		}
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/mail/check", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public Map<String, Object>checkMail(MemberAuthVO param) throws Exception {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		int cnt = 0;
	    final String sender = "jy4test@gmail.com";
	    String email = param.getAuth_email();
	    
	    MemberVO vo = service.selectMember(param.getAuth_id());
	    if(vo!=null) {
	    	cnt = 2;
	    	resultMap.put("cnt", cnt);
	    }
	    
		email+=addr; 
		param.setAuth_email(email);
		
		// SMTP 
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465);  //smtp 포트번호
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new Gmail());

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));

            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 
            // Subject
            message.setSubject("인증번호입니다."); 
            // Text
            Random rand = new Random();
            String randNum = "";
            for(int i=0; i<4; i++) {
            	randNum+=rand.nextInt(10);
            }
            
            message.setText("인증을 진행해 주세요. \n인증번호: "+randNum);    //���� ������ �Է�
            // send the message
            Transport.send(message);  
            System.out.println("message sent successfully...");
            
            param.setAuth_code(randNum);
            cnt = service.insertAuthNumber(param);
            resultMap.put("cnt", cnt);
            
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
		
	    return resultMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/mail/check/member", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public Map<String, Object>checkMailForMember(MemberAuthVO param) throws Exception {
		Map<String, Object> resultMap = new HashMap<String,Object>();
		int cnt = 0;
	    final String sender = "jy4test@gmail.com";
	    String email = param.getAuth_email();
	    //String addr = param.getAuth_addr();
	    
		email+=addr; 
		param.setAuth_email(email);
		
		MemberVO vo = service.selectMember(param.getAuth_id());
		if(vo==null) {
			cnt = 2;
			resultMap.put("cnt", cnt);
			return resultMap; //email
		}else if(!vo.getEmail().equals(param.getAuth_email())) {
			cnt = 3;
			resultMap.put("cnt", cnt);
			return resultMap; //email 
		}
		
		// SMTP 
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465);  //smtp
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new Gmail());

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));

            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 
            // Subject
            message.setSubject("인증번호입니다."); 
            // Text
            Random rand = new Random();
            String randNum = "";
            for(int i=0; i<4; i++) {
            	randNum+=rand.nextInt(10);
            }
            
            message.setText("인증을 진행해 주세요. \n인증번호: "+randNum);       
            // send the message
            Transport.send(message);  
            System.out.println("message sent successfully...");
            
            //db랜덤
            param.setAuth_code(randNum);
            cnt = service.insertAuthNumber(param);
            resultMap.put("cnt", cnt);
            
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
		
	    return resultMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/num/check", method = RequestMethod.POST)
	public Map<String, Object> checkAuthNum(MemberAuthVO param){
		Map<String, Object> resultMap = new HashMap<String,Object>();
		String input_code = param.getAuth_code();
		
		String email = param.getAuth_email();
		//String addr = param.getAuth_addr();
		email += addr; 
		param.setAuth_email(email);
		
		MemberAuthVO vo = service.selectAuthNumber(param);
		int cnt = 0;
		
		if(vo==null) { //no
			cnt = 3;
		}else { //
			if(!input_code.equals(vo.getAuth_code())) {
				cnt = 2; 
			}else { //ok
				cnt = 1;
			}
		}
		resultMap.put("cnt", cnt);
		
		return resultMap;
	}
	
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String loginMember(MemberVO param, Model model, HttpSession httpSession) {
		MemberVO  vo = service.login(param);
		if(vo!=null) {
			//session login
			UserVO userVo = new UserVO();
			userVo.setUser_id(vo.getId());
			userVo.setUser_name(vo.getName());
			userVo.setUser_auth(vo.getAuth());
			
			httpSession.setAttribute("UserVO", userVo);
			model.addAttribute("msg", "로그인 완료");
		}else {
			model.addAttribute("msg", "로그인 오류");
		}
		return "redirect:/";
	}
	
	@RequestMapping("/member/logout")
	public String logoutMember(Model model, HttpSession httpSession) {
			httpSession.invalidate();
			model.addAttribute("msg", "로그아웃 완료");
		return "redirect:/";
	}

	@Auth
	@RequestMapping("/member/mypage")
	public String mypage(Model model, HttpSession httpSession) {
		UserVO userVo = (UserVO) httpSession.getAttribute("UserVO");
		String id = userVo.getUser_id();
		
		if(id!=null) {
			MemberVO vo = service.selectMember(id);
		
			if(vo!=null) {
				String email = vo.getEmail();
				StringTokenizer st = new StringTokenizer(email,"@");
				email = st.nextToken();
				
				vo.setEmail(email);
				model.addAttribute("userVO", vo);
				List<BaramVO> baramList = service.selectBaramList(id);
				model.addAttribute("baramList",baramList);
			}else {
				//db error!
			}
		}
		return "member/myPage";
	}
	
	/* @Auth(role=Role.ADMIN) */ /* 관리자 권한이 필요한 메서드의 경우는 이렇게 설정해주면 된다. */
	@Auth
	@RequestMapping(value="/member/mypage/update", method = RequestMethod.POST)
	public String updateMypage(MemberVO param, Model model, HttpSession httpSession) {
		
		UserVO userVo = (UserVO)httpSession.getAttribute("UserVO");
		String id = userVo.getUser_id();
		String email = param.getEmail();
		email+=addr;
		param.setEmail(email);
		param.setId(id);
		
		int cnt = service.updateMember(param);
		
		if(cnt==1) {
			MemberVO vo = service.selectMember(id);
			if(vo!=null) {
				email = vo.getEmail();
				StringTokenizer st = new StringTokenizer(email,"@");
				email = st.nextToken();
				
				vo.setEmail(email);
				model.addAttribute("userVO", vo);
				List<BaramVO> baramList = service.selectBaramList(id);
				model.addAttribute("baramList",baramList);
			}else {
				//db error!
			}
		}else {
			//db error!
		}
		return "member/myPage";
	}
}
