package com.shopping.f4mall;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping("main/list.do")
	public String list(){
		
		return "main/main";
	}
}
