package com.spring.wewind.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.wewind.Criteria;
import com.spring.wewind.PageMaker;
import com.spring.wewind.service.ActivityService;
import com.spring.wewind.service.BaramInfoService;
import com.spring.wewind.vo.ActivityVO;
import com.spring.wewind.vo.AwardVO;
import com.spring.wewind.vo.BaramInfoVO;

@Controller
@RequestMapping("/baram/{b_no}")
public class ActivityController {

	@Inject
	private ActivityService service;
	
	@Inject
	private BaramInfoService infoservice;
	
	
	@ModelAttribute("path")
	public String getContextPath(HttpServletRequest request,@PathVariable("b_no") int b_no) {
		return "/baram/"+b_no;
	}
	@ModelAttribute("currentpath")
	public String getCurrentPath(HttpServletRequest request) {
		return request.getContextPath();
	}
	
	
	
	@RequestMapping(value = "/activity", method = RequestMethod.GET)
	public String getList(Model model, Criteria criteria,
			@PathVariable("b_no") int b_no
		) throws Exception {
		
		
		
		PageMaker pageMaker = new PageMaker();		
		
		pageMaker.setCriteria(criteria);
    	pageMaker.setTotalCount(service.activityCount(b_no));
    	System.out.println(service.activityCount(b_no));
    	
    	criteria.setActi_b_no(b_no);
		List<ActivityVO> activityList = service.activityListPaging(criteria);
				
		
		model.addAttribute("activityList", activityList);
		model.addAttribute("b_no",b_no);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("criteria",criteria);
		
		//Ȱ���ϴ� ����� ����.
		List<BaramInfoVO> baraminfoList = infoservice.select(b_no);
	    int baraminfoSize =baraminfoList.size(); 
	    model.addAttribute("baraminfoList", baraminfoList);
        model.addAttribute("baraminfoSize", baraminfoSize);
        
		
		System.out.println("getDisplayPageNum");
		return "/activity/activityList";
	}

	// �ٶ����� 1�� ���� ��������
	@RequestMapping(value = "/activity/{acti_no}")
	public String get(Model model, @PathVariable("b_no") int b_no, @PathVariable("acti_no") int acti_no) throws Exception {

		ActivityVO activity = service.selectOne(acti_no);

		model.addAttribute("activity", activity);
		model.addAttribute("b_no",b_no);
		model.addAttribute("acti_no",acti_no);
    	
		//Ȱ���ϴ� ����� ����.
		List<BaramInfoVO> baraminfoList = infoservice.select(b_no);
	    int baraminfoSize =baraminfoList.size(); 
	    model.addAttribute("baraminfoList", baraminfoList);
        model.addAttribute("baraminfoSize", baraminfoSize);
        
        
		return "/activity/activityDetail"; //
	}
	
	@RequestMapping(value="/activity/{acti_no}/edit",method=RequestMethod.GET)
    public String edit( 
    		Model model,@PathVariable("acti_no") int acti_no,
    		@PathVariable("b_no") int b_no) throws Exception {
    	
    	ActivityVO activity = service.selectOne(acti_no); //�ϳ��� ������
    	model.addAttribute("activity",activity);
    	model.addAttribute("b_no",b_no);
    	model.addAttribute("acti_no",acti_no);
    	
		//Ȱ���ϴ� ����� ����.
		List<BaramInfoVO> baraminfoList = infoservice.select(b_no);
	    int baraminfoSize =baraminfoList.size(); 
	    model.addAttribute("baraminfoList", baraminfoList);
        model.addAttribute("baraminfoSize", baraminfoSize);
        
    	return "/activity/activityUpdate";
    }
    //���� ��ư ������ ��
    @RequestMapping(value="/activity/{acti_no}",method=RequestMethod.POST)
    public String update(ActivityVO activityVO, Model model,
    		@PathVariable("acti_no") int acti_no,
    		@PathVariable("b_no") int b_no) throws Exception {
    	
    	System.out.println(" ����? ����? ����?");
    	activityVO.setActi_no(acti_no);
    	int result = service.update(activityVO);


    	
    	return "redirect:/baram/"+b_no+"/activity";
    }
  //�ٶ����� ����� ��ư ������ ��
    @RequestMapping(value = "/activity/create",method = RequestMethod.GET)
    public String createButton(Model model, @PathVariable("b_no") int b_no) throws Exception{
       
    	//���⼭ ���� acti_b_no�� �Ѱ������. �������� ����־�� �ұ�?
    	//������ ����Ʈ�� �Ѱ������. 
    	//���� �α����� ��� �̸��� �־����.
    	model.addAttribute("b_no",b_no);
		//Ȱ���ϴ� ����� ����.
		List<BaramInfoVO> baraminfoList = infoservice.select(b_no);
	    int baraminfoSize =baraminfoList.size(); 
	    model.addAttribute("baraminfoList", baraminfoList);
        model.addAttribute("baraminfoSize", baraminfoSize);
        
    	
        return "/activity/activityWrite";
    }   
    
  //Ȱ������ ���� ��ư ������ ��
    @RequestMapping(value="/activity",method = RequestMethod.POST)
    public String insert(ActivityVO activityVO, Model model, @PathVariable("b_no") int b_no) throws Exception {
    	//���⼭ �ؾ� �Ұ� ��ȿ�� �˻� Ȥ�� �𸣴ϱ�!
    	//System.out.println("month : "+activityVO.getMonth());
    	//System.out.println("acti_date"+acti_date);
    	
    	String acti_date = "2019-"+activityVO.getMonth()+"-"+activityVO.getDay();
    	activityVO.setActi_date(acti_date);
    	activityVO.setActi_writer("�����"); //�̸� ���� ���Ƿ� �س���. ������� ���� �Ѿ���ų�. ����־����.	
    	activityVO.setActi_b_no(b_no);
    	
    	int result = service.create(activityVO);
    	 
    	if(result==0) System.out.println("0�̴�!");
    	else System.out.println("������Ʈ �ȵ�");
    	
    	return "redirect:/baram/"+b_no+"/activity";
    }
    
    
    @RequestMapping(value = "/activity/deleteform")
    public String deleteForm(Model model, HttpServletRequest request) throws Exception{
    	
 
        return "/activity/deleteform";
    }
    //delete 
    @RequestMapping(value="/activity/{acti_no}",method=RequestMethod.DELETE)
    public String delete(Model model, @PathVariable("acti_no") int acti_no,
    		@PathVariable("b_no") int b_no) throws Exception{

     	
     	int result = service.delete(acti_no);
         
       
 
      	return "redirect:/baram/"+b_no+"/activity";
     }   
 
    @RequestMapping(value="/activity/{acti_no}/delete")
    public String delete2(Model model, @PathVariable("acti_no") int acti_no,
    		@PathVariable("b_no") int b_no) throws Exception{

     	int result = service.delete(acti_no);
         
       
      	return "redirect:/baram/"+b_no+"/activity";
      }   
 
}

