package com.studio.rentRoom.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller("CommonAction")
@Scope("prototype")
public class CommonAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	public String main() {
		return "main";
	}
	public String message() {
		return "message";
	}
	public String moments() {
		return "moments";
	}
	public String me() {
		return "me";
	}
	
}
