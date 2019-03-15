package com.spring.wewind.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.wewind.service.ScheduleService;
import com.spring.wewind.vo.ScheduleVO;

/**
 * Handles requests for the application home page.
 */

@Controller
public class ScheduleController {

	@Inject
	ScheduleService scheduleService;

	@RequestMapping("/schedule/list")
	public String list(Model model) {
		List<ScheduleVO> list = scheduleService.scheduleList();
		model.addAttribute("scheduleList", list);

		return "schedule/list";
	}

	@RequestMapping("/schedule/writeView")
	public String schedule_write_view(Model model) {
		return "schedule/writeView";
	}

	@RequestMapping(value = "/schedule/write", method = RequestMethod.POST)
	public String write(ScheduleVO vo) {
		scheduleService.scheduleWrite(vo);

		return "redirect:list";
	}

	@RequestMapping(value = "/schedule/contentView", method = RequestMethod.POST)
	public String Schedule_content_view(ScheduleVO vo, Model model) {
		model.addAttribute("vo", scheduleService.scheduleContentView(vo.getSch_no()));

		return "schedule/contentView";
	}

	@RequestMapping("/schedule/delete")
	public String schedule_delete(@RequestParam String sch_no, Model model) {
		scheduleService.scheduleDelete(sch_no);

		return "redirect:list";
	}

	@RequestMapping(value = "/schedule/modifyView", method = RequestMethod.POST)
	public String schedule_modify_view(ScheduleVO vo, Model model) {
		model.addAttribute("vo", scheduleService.scheduleModifyView(vo.getSch_no()));

		return "schedule/modifyView";
	}

	@RequestMapping(value = "/schedule/modify", method = RequestMethod.POST)
	public String schedule_modify(ScheduleVO vo) {
		scheduleService.scheduleModify(vo);
		
		return "redirect:/schedule/list";
	}

}
