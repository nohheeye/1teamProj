package com.spring.wewind.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.wewind.Criteria;
import com.spring.wewind.PageMaker;
import com.spring.wewind.service.AdminPageService;
import com.spring.wewind.vo.AwardVO;
import com.spring.wewind.vo.BaramInfoVO;
import com.spring.wewind.vo.BaramVO;

@Controller
public class AdminPageController {

	
	@Inject
	private AdminPageService adminpageservice;
	
	///@Inject
	//private PageMaker pageMaker;
	/////////////////////// Ȱ������ ����////////////////////////////////

    //������ ������ Ȱ������ �������� �Լ�.
    @RequestMapping(value = "/admin/activity")
    public String adminActivity(Model model, HttpServletRequest request,
    		Criteria criteria) throws Exception{
   
		String year = request.getParameter("year");
    	System.out.println("year is "+year);
		
    	PageMaker pageMaker = new PageMaker();
    	//
    	pageMaker.setCriteria(criteria);
    	pageMaker.setTotalCount(adminpageservice.activityCount(criteria));
    	
    	List<BaramVO> baramList = adminpageservice.activityListPaging(criteria); //�ٶ����� �� ����.
    
		model.addAttribute("baramList", baramList); 
    	model.addAttribute("pageMaker",pageMaker);
    	
		System.out.println("����~");
		return "/admin/activity";
    }   
    
    @RequestMapping(value= "/baraminfo", method=RequestMethod.GET)
       public @ResponseBody List<BaramInfoVO> AjaxView(
       	Model model, @RequestParam("info_b_no") int info_b_no) throws Exception  {
    	//System.out.println("����
    	//���� �ٶ����� ��ȣ ������ b_no
    	//select�� ���� ���� b_no����
    	//�����δ� acti_b_no�� �˻��Ѵ�.
    	
    	return adminpageservice.selectBaramInfo(info_b_no);
       
    }
	/////////////////////// Ȱ������ ��////////////////////////////////

    
    
	/////////////////////// ���󳻿� ����////////////////////////////////
    //������ ������ ���� ���� �������� �Լ�.
    @RequestMapping(value = "/admin/award")
    public String adminAward(Model model, Criteria criteria) throws Exception{

    	PageMaker pageMaker = new PageMaker();
    	
    	pageMaker.setCriteria(criteria);
    	System.out.println("�Ѱ��� : "+adminpageservice.awardCount(criteria));
    	pageMaker.setTotalCount(adminpageservice.awardCount(criteria));
    	
    	List<AwardVO> awardList = adminpageservice.awardListPaging(criteria); //�ٶ����� �� ����.
    	// List<AwardVO> awardList = adminpageservice.selectAward(); //�ٶ����� �� ����.
        
		model.addAttribute("awardList",awardList);
    	model.addAttribute("pageMaker",pageMaker);
		
    	System.out.println("����~");
    	
		return "/admin/award";
		
    }   
    
    
 
    //insert
    @RequestMapping(value="/admin/award",method=RequestMethod.POST)
    public String createAward(AwardVO awardVO, Model model) throws Exception {
    	System.out.println("hi"+ awardVO.getB_name());
    	int result = adminpageservice.createAward(awardVO);
    	return "redirect:/admin/award";
          	
    }
    
    
    
    //���� Ȯ�� ��ư �������� == �����Ϸ�?��ư
    @RequestMapping(value="/admin/award/{a_no}",method=RequestMethod.POST)
    public String update(AwardVO awardVO, Model model) throws Exception {
    	int result = adminpageservice.updateAward(awardVO);
    	return "redirect:/admin/award";
          	
    }
    
    @RequestMapping(value="/admin/award/{a_no}/delete",method=RequestMethod.GET)
    public String deleteAward(Model model, @PathVariable("a_no") int a_no) throws Exception{

    	System.out.println("����� �Դ�");
     	int result = adminpageservice.deleteAward(a_no);
        
     	return "redirect:/admin/award";
    }   
    
    
    
   
    //�������� ���� �� 
    @RequestMapping(value = "/demo")
    public String demo(Model model, HttpServletRequest request) throws Exception{
		return "/admin/demo";
		
    }   
    
    
    //ajax�� ������ �͵�
    
    //update 1�� �ϼ��� ajax�������ߴ�.
    //�ٵ� �����ߴ�. �ϴ� �ڵ�� ���д�.
    @RequestMapping(value = "/admin2/award/{a_no}", method = RequestMethod.POST)
    @ResponseBody int
    updateAward(@RequestBody AwardVO awardVO) throws Exception {

    	return adminpageservice.updateAward(awardVO);
    }
    
    //insert
    @RequestMapping(value = "/admin2/award", method = RequestMethod.POST)
    @ResponseBody int
    searchPost(@RequestBody AwardVO awardVO) throws Exception {

    	
    	System.out.println("����� �μ�Ʈ");
        
    	return adminpageservice.createAward(awardVO);
    }


    //paging test
    @RequestMapping(value = "/admin/award_page")
    public String adminAwardpagin(Model model, Criteria criteria) throws Exception{

    
    	PageMaker pageMaker = new PageMaker();
    	pageMaker.setCriteria(criteria);
    	pageMaker.setTotalCount(100);
    	// 
    	
//    	List<AwardVO> awardList = adminpageservice.selectAward(); //�ٶ����� �� ����.
    
		model.addAttribute("awardList",adminpageservice.awardListPaging(criteria));
    	model.addAttribute("pageMaker",pageMaker);
		
    	System.out.println("����~");
		return "/admin/award_page";
		
    }   

    //paging test
    @RequestMapping(value = "/admin/award_page2")
    public String adminAwardpagin2(Model model, Criteria criteria) throws Exception{

    
    	List<AwardVO> awardList = adminpageservice.selectAward(); //�ٶ����� �� ����.
    
		model.addAttribute("awardList",adminpageservice.awardListPaging(criteria));
    	
    	System.out.println("����~");
		return "/admin/award_page";
		
    }   
}
