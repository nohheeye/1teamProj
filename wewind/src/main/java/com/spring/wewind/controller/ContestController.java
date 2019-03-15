package com.spring.wewind.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.wewind.service.ContestService;
import com.spring.wewind.vo.ContestVO;

@Controller
public class ContestController {

	@Inject
	ContestService contestService;

	@RequestMapping("/contest/list")
	public String list(Model model) {
		List<ContestVO> list = contestService.contestList();
		model.addAttribute("contestList", list);
		System.out.println(list.size());

		return "contest/contestList";
	}

	@RequestMapping("/contest/writeView")
	public String contest_write_view(Model model) {
		return "contest/contestWrite";
	}

	@RequestMapping(value = "/contest/write", method = RequestMethod.POST)
	public String write(ContestVO vo) {
		contestService.contestWrite(vo);

		return "redirect:list";
	}

	/*
	 * @RequestMapping(value = "/contest/contentView", method = RequestMethod.POST)
	 * public String contest_content_view(ContestVO vo, Model model) {
	 * model.addAttribute("vo",
	 * contestService.contestContentView(vo.getContest_no()));
	 * 
	 * return "contest/contentView"; }
	 * 
	 * @RequestMapping("/contest/delete") public String
	 * schedule_delete(@RequestParam String contest_no, Model model) {
	 * contestService.contestDelete(contest_no);
	 * 
	 * return "redirect:list"; }
	 * 
	 * @RequestMapping(value = "/contest/modifyView", method = RequestMethod.POST)
	 * public String schedule_modify_view(ContestVO vo, Model model) {
	 * model.addAttribute("vo",
	 * contestService.contestModifyView(vo.getContest_no()));
	 * 
	 * return "contest/modifyView"; }
	 * 
	 * @RequestMapping(value = "/schedule/modify", method = RequestMethod.POST)
	 * public String schedule_modify(ContestVO vo) {
	 * contestService.contestModify(vo);
	 * 
	 * return "redirect:/contest/list"; }
	 * 
	 */
}
