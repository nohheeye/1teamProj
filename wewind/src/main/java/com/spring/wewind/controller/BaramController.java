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
	
  
    
    //�ٶ����� ����� ��ư ������ ��
    @RequestMapping(value = "/baram/create",method = RequestMethod.GET)
    public String createButton(Model model) throws Exception{
    	//category �����´�.
    	List<CategoryVO> categoryList = service.selectCate(); 
    	List<CategoryVO> categoryPar = service.selectCatePar(); 

    	String change_b_cate_parent="";
    	model.addAttribute("categoryList",categoryList);
    	model.addAttribute("categoryPar",categoryPar);
    	model.addAttribute("change_b_cate_parent",change_b_cate_parent);
    	
        return "/baram/createNew";
    }   
    

    
    //�ٶ����� ���� ��ư ������ ��
    @RequestMapping(value="/baram",method = RequestMethod.POST)
    public String insert(BaramVO baramVO, Model model) throws Exception {
    	//���⼭ �ؾ� �Ұ� ��ȿ�� �˻� Ȥ�� �𸣴ϱ�!
    	
    	baramVO.setB_mader("�����"); //�� �Ѱܾ���
    	baramVO.setB_owner("�����"); //�� �Ѱܾ���
    	
    	System.out.println("�� ����!"+baramVO.getB_name()+baramVO.getB_cate());
        	
    	int result = service.create(baramVO);
    	System.out.println("�� ����222!");
         
    	if(result==0) System.out.println("0�̴�!");
    	else System.out.println("������Ʈ �ȵ�");
    	
    	return "redirect:/baram"; //�̰� ����� �ٽ� �ؾ��� .0313 10:55
    }
    
    
    //�ٶ����� 1�� ���� ��������
    @RequestMapping(value = "/baram/{b_no}")
    public String get(Model model, @PathVariable("b_no") int b_no) throws Exception{
    	   
    	BaramVO baram = service.selectOne(b_no);
        model.addAttribute("baram", baram);
        
        List<BaramInfoVO> baraminfoList = infoservice.select(b_no);
        int baraminfoSize =baraminfoList.size(); 
        model.addAttribute("baraminfoList", baraminfoList);
        model.addAttribute("baraminfoSize", baraminfoSize);
        
  
        //�����������.
        
        
        
        return "/baram/baramintro"; //
    }   
    
    
    @RequestMapping(value="/baram/{b_no}/edit",method=RequestMethod.GET)
    public String edit( Model model, @PathVariable("b_no") int b_no) throws Exception {
    	
    	BaramVO baram = service.selectOne(b_no); //�ϳ��� ������
    	model.addAttribute("baram",baram);
    
        List<BaramInfoVO> baraminfoList = infoservice.select(b_no);
        int baraminfoSize =baraminfoList.size(); 
        model.addAttribute("baraminfoList", baraminfoList);
        model.addAttribute("baraminfoSize", baraminfoSize);

        
    	return "/baram/baramIntroUpdate";
    }
    
   
    //���� ��ư ������ ��
    @RequestMapping(value="/baram/{b_no}",method=RequestMethod.POST)
    public String update(BaramVO baramVO, Model model, @PathVariable("b_no") int b_no) throws Exception {
    	
    	System.out.println(" ����? ����? ����?"+baramVO.getB_introduce());
    	
    	baramVO.setB_no(b_no);
    	int result = service.update(baramVO);
    	
    	if(result==0) System.out.println("0�̴�!");
    	else System.out.println("������Ʈ �ȵ�"+baramVO.getB_name());

    	
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
        

     	System.out.println("����� Controller"+b_no);
     	
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

    	System.out.println("����� ������Ʈ");
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
