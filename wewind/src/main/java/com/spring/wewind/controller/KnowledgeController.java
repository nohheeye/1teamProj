package com.spring.wewind.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.wewind.Criteria;
import com.spring.wewind.PageMaker;
import com.spring.wewind.service.BaramInfoService;
import com.spring.wewind.service.KnowledgeService;
import com.spring.wewind.vo.ActivityVO;
import com.spring.wewind.vo.BaramInfoVO;
import com.spring.wewind.vo.KnowledgeVO;

@Controller
@RequestMapping("/baram/{b_no}")
public class KnowledgeController {

	@Inject
	private KnowledgeService service;

	@Inject
	private BaramInfoService infoservice;
	
	// ���İ��� ����Ʈ ������.
	@RequestMapping(value = "/knowledge")
	public String knowledge(Model model, HttpServletRequest request,
			Criteria criteria, @PathVariable("b_no") int b_no) throws Exception {

		PageMaker pageMaker = new PageMaker();		
		pageMaker.setCriteria(criteria);
    	pageMaker.setTotalCount(service.knowledgeCount(b_no));
    
    	criteria.setKnow_b_no(b_no);
		List<KnowledgeVO> knowledgeList = service.knowledgeListPaging(criteria);
    	
		model.addAttribute("b_no",b_no);
		model.addAttribute("knowledgeList", knowledgeList);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("criteria",criteria);
		
		//Ȱ���ϴ� ����� ����.
		List<BaramInfoVO> baraminfoList = infoservice.select(b_no);
	    int baraminfoSize =baraminfoList.size(); 
	    model.addAttribute("baraminfoList", baraminfoList);
        model.addAttribute("baraminfoSize", baraminfoSize);
		
		return "/knowledge/knowList";
	}

	// ���İ��� ����� ��ư ������ ��
	@RequestMapping(value = "/knowledge/create", method = RequestMethod.GET)
	public String create(Model model, @PathVariable("b_no") int b_no) throws Exception {
		
		model.addAttribute("b_no",b_no);
		
		//Ȱ���ϴ� ����� ����.
		List<BaramInfoVO> baraminfoList = infoservice.select(b_no);
	    int baraminfoSize =baraminfoList.size(); 
	    model.addAttribute("baraminfoList", baraminfoList);
        model.addAttribute("baraminfoSize", baraminfoSize);
        
        
		return "/knowledge/knowRegist";
	}

	// ���İ��� ���� ��ư ������ ��
	@RequestMapping(value = "/knowledge", method = RequestMethod.POST)
	public String insert(KnowledgeVO knowledgeVO, Model model,
			@PathVariable("b_no") int b_no) throws Exception {
		// ���⼭ �ؾ� �Ұ� ��ȿ�� �˻� Ȥ�� �𸣴ϱ�!
		
		knowledgeVO.setKnow_writer("�����");
		model.addAttribute("b_no",b_no);
		
		int result = service.create(knowledgeVO);

		if (result == 0)
			System.out.println("0�̴�!");
		else
			System.out.println("������Ʈ �ȵ�");

		return "redirect:/baram/"+b_no+"/knowledge";
	}

	// ���İ��� 1�� ���� ��������
	@RequestMapping(value = "/knowledge/{know_no}")
	public String view(Model model, @PathVariable("know_no") int know_no
			,@PathVariable("b_no") int b_no) throws Exception {

		KnowledgeVO knowledgeVO = service.selectOne(know_no);

		model.addAttribute("knowledgeVO", knowledgeVO);

		model.addAttribute("b_no",b_no);
		
		//Ȱ���ϴ� ����� ����.
		List<BaramInfoVO> baraminfoList = infoservice.select(b_no);
	    int baraminfoSize =baraminfoList.size(); 
	    model.addAttribute("baraminfoList", baraminfoList);
        model.addAttribute("baraminfoSize", baraminfoSize);
        
        
		return "/knowledge/knowDetail";
	}

	// ���İ��� ���� ������
	@RequestMapping(value = "/knowledge/{know_no}/edit", method = RequestMethod.GET)
	public String edit(Model model, @PathVariable("know_no") int know_no,
			@PathVariable("b_no") int b_no) throws Exception {
		
		KnowledgeVO knowledgeVO = service.selectOne(know_no);

		model.addAttribute("knowledgeVO", knowledgeVO);
		model.addAttribute("b_no",b_no);
		model.addAttribute("know_no",know_no);
   		
		//Ȱ���ϴ� ����� ����.
		List<BaramInfoVO> baraminfoList = infoservice.select(b_no);
	    int baraminfoSize =baraminfoList.size(); 
	    model.addAttribute("baraminfoList", baraminfoList);
        model.addAttribute("baraminfoSize", baraminfoSize);
        
		
		
		return "/knowledge/knowEdit";
	}

	// ���� ��ư ������ ��
	@RequestMapping(value = "/knowledge/{know_no}", method = RequestMethod.POST)
	public String update(KnowledgeVO knowledgeVO, Model model,
			@PathVariable("b_no") int b_no) throws Exception {

		System.out.println(" ����? ����? ����?");
		int result = service.update(knowledgeVO);

		model.addAttribute("b_no",b_no);
		
		return "redirect:/baram/"+b_no+"/knowledge";
	}

	// ���� ��ư ������ ��
	@RequestMapping(value = "/knowledge/{know_no}/delete") //method = RequestMethod.DELETE)
	public String delete(Model model, 
			@PathVariable("know_no") int know_no,
			@PathVariable("b_no") int b_no) throws Exception {

		int result = service.delete(know_no);
		model.addAttribute("b_no",b_no);
		
		return "redirect:/baram/"+b_no+"/knowledge";
	}

	@RequestMapping(value = "/join")
	public String view(Model model, HttpServletRequest request) throws Exception {

		return "/join";
	}

}
