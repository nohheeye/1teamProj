package com.spring.wewind.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.wewind.service.BaramInfoService;
import com.spring.wewind.service.BaramService;
import com.spring.wewind.vo.BaramInfoVO;
import com.spring.wewind.vo.BaramVO;
import com.spring.wewind.vo.CategoryVO;

@Controller
public class BaramController {
	@Inject
	private BaramService service;
	
	@Inject
	private BaramInfoService infoservice;
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
		
	public String getTime() throws Exception {
		return service.getTime();
	}
	
  
    
    //바람개비 만들기 버튼 눌렀을 때
    @RequestMapping(value = "/baram/create",method = RequestMethod.GET)
    public String createButton(Model model) throws Exception{
    	//category 가져온다.
    	List<CategoryVO> categoryList = service.selectCate(); 
    	List<CategoryVO> categoryPar = service.selectCatePar(); 

    	String change_b_cate_parent="";
    	model.addAttribute("categoryList",categoryList);
    	model.addAttribute("categoryPar",categoryPar);
    	model.addAttribute("change_b_cate_parent",change_b_cate_parent);
    	
        return "/baram/createNew";
    }   
    

    
    //바람개비 저장 버튼 눌렀을 떄
    @RequestMapping(value="/baram",method = RequestMethod.POST)
    public String insert(BaramVO baramVO, Model model) throws Exception {
    	//여기서 해야 할게 유효성 검사 혹시 모르니까!
    	
    	baramVO.setB_mader("김용희"); //값 넘겨야함
    	baramVO.setB_owner("김용희"); //값 넘겨야함
    	
    	System.out.println("좀 봐도!"+baramVO.getB_name()+baramVO.getB_cate());
        	
    	int result = service.create(baramVO);
    	System.out.println("좀 봐도222!");
         
    	if(result==0) System.out.println("0이다!");
    	else System.out.println("업데이트 된듯");
    	
    	return "redirect:/baram"; //이거 라우팅 다시 해야함 .0313 10:55
    }
    
    
    //바람개비 1개 정보 가져오기
    @RequestMapping(value = "/baram/{b_no}")
    public String get(Model model, @PathVariable("b_no") int b_no) throws Exception{
    	   
    	BaramVO baram = service.selectOne(b_no);
        model.addAttribute("baram", baram);
        
        List<BaramInfoVO> baraminfoList = infoservice.select(b_no);
        int baraminfoSize =baraminfoList.size(); 
        model.addAttribute("baraminfoList", baraminfoList);
        model.addAttribute("baraminfoSize", baraminfoSize);
        
  
        //사람데꼬오기.
        
        
        
        return "/baram/baramintro"; //
    }   
    
    
    @RequestMapping(value="/baram/{b_no}/edit",method=RequestMethod.GET)
    public String edit( Model model, @PathVariable("b_no") int b_no) throws Exception {
    	
    	BaramVO baram = service.selectOne(b_no); //하나만 가져옴
    	model.addAttribute("baram",baram);
    
        List<BaramInfoVO> baraminfoList = infoservice.select(b_no);
        int baraminfoSize =baraminfoList.size(); 
        model.addAttribute("baraminfoList", baraminfoList);
        model.addAttribute("baraminfoSize", baraminfoSize);

        
    	return "/baram/baramIntroUpdate";
    }
    
   
    //수정 버튼 눌렀을 때
    @RequestMapping(value="/baram/{b_no}",method=RequestMethod.POST)
    public String update(BaramVO baramVO, Model model, @PathVariable("b_no") int b_no) throws Exception {
    	
    	System.out.println(" 여기? 여기? 오ㄸ?"+baramVO.getB_introduce());
    	
    	baramVO.setB_no(b_no);
    	int result = service.update(baramVO);
    	
    	if(result==0) System.out.println("0이다!");
    	else System.out.println("업데이트 된듯"+baramVO.getB_name());

    	
        List<BaramInfoVO> baraminfoList = infoservice.select(b_no);
        int baraminfoSize =baraminfoList.size(); 
        model.addAttribute("baraminfoList", baraminfoList);
        model.addAttribute("baraminfoSize", baraminfoSize);

    	
    	return "redirect:/baram/"+b_no;
          	
    }
    @RequestMapping(value = "/baram", method = RequestMethod.GET)
    public String getBaramList(Locale locale, Model model) throws Exception{
    	
    	List<BaramVO> baramList = service.select();
        model.addAttribute("baramList", baramList);
        return "home";
    }	
  
    
    @RequestMapping(value="/baram/{b_no}",method=RequestMethod.DELETE)
    public String delete_test(Model model, @PathVariable("b_no") int b_no) throws Exception{
        

     	System.out.println("여기는 Controller"+b_no);
     	
     	int result = service.delete(b_no);
         
       
 
        return "redirect:/baram";
    }   
    
    
    @RequestMapping(value = "/baram/deleteform")
    public String deleteForm2(Model model, HttpServletRequest request) throws Exception{
    	
 //   	model.addAttribute("b_no",17);
 
        return "/baram/deleteform";
    }
    /*
    @RequestMapping(value = "/admin2/award/{a_no}", method = RequestMethod.POST)
    @ResponseBody int
    updateAward(@RequestBody AwardVO awardVO) throws Exception {

    	System.out.println("여기는 업데이트");
       System.out.println("award "+awardVO.getA_no());
       System.out.println("award "+awardVO.getB_name());
   //    int result = ; 
    	return adminpageservice.updateAward(awardVO);
    }
    */
    
    @RequestMapping(value="/baram/idcheck", method=RequestMethod.POST)
    @ResponseBody  public Map<Object, Object>
    idCheck(@RequestBody String b_name ) throws Exception {

        Map<Object, Object> map = new HashMap<Object, Object>();
        System.out.println("userID is "+b_name);
      //  System.out.println(typeof(userId));
    	int count = 0;
        count = (int) service.idCheck(b_name);
        System.out.println("count is "+count);
        map.put("count", count);
        return map;
    
    }
    
    
    @RequestMapping(value="/baram/makecate", method=RequestMethod.POST)
    @ResponseBody  public Map<Object, Object>
    makeCate(@RequestBody String b_cate_parent ) throws Exception {

        Map<Object, Object> map = new HashMap<Object, Object>();
        
        List<CategoryVO> categorylist = service.makeCate(b_cate_parent);
        System.out.println("this is makecate"+categorylist);
        map.put("categorylist", categorylist);
        return map;
    
    }
}
