package com.studio.rentRoom.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.studio.rentRoom.beans.UserInfo;
import com.studio.rentRoom.beans.UserLogin;
import com.studio.rentRoom.service.UploadService;
import com.studio.rentRoom.service.UserService;
import com.studio.rentRoom.utils.LoginSession;

import net.sf.json.JSONObject;

@Controller("LoginAction")
@Scope("prototype")
public class LoginAction extends ActionSupport
		implements SessionAware, RequestAware, ModelDriven<UserLogin>, Preparable {

	private static final long serialVersionUID = 1L;

	private UserLogin userLogin;
	@Autowired
	private UserService userService;
	@Autowired
	private UploadService uploadService;

	public void prepareRegister() {
		userLogin = new UserLogin();
	}

	public String register() {
		userService.saveUser(userLogin);
		return SUCCESS;
	}

	private String name;// 昵称

	public void setName(String name) {
		this.name = name;
	}

	public String changeName() {
		UserLogin userSession = (UserLogin) session.get("userLogin");
		System.out.println("userSession---"+userSession);
		UserInfo changeName = userService.changeName(name,userSession);
		userSession.setUserInfo(changeName);
//		session.put("userLogin", userSession);
		return SUCCESS;
	}

	private File file;
	private String fileContentType;
	private String fileFileName;

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public void setFileFileName(String fileFileName) {
		long date = new Date().getTime();
		int i = fileFileName.lastIndexOf(".");
		String newFileName = date + fileFileName.substring(i, fileFileName.length());
		this.fileFileName = newFileName;
	}

	/*
	 * 上传头像
	 */
	public void changeHeadImg() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();

		JSONObject jsonobj = new JSONObject();
		System.out.println("fileFileName---" + fileFileName);
		UserLogin userSession = (UserLogin) session.get("userLogin");
		String uploadSort = "HeadImg";
		if (uploadService.uploadImg(file, fileFileName, uploadSort, userSession)) {
			jsonobj.put("code", 0);
			jsonobj.put("msg", "替换成功");
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd/");
			Date date=new Date();
			String datePath=sdf.format(date);
			
			String sqlPath = "Images/"+ uploadSort +"/"+datePath + fileFileName;
			System.out.println("sqlPath---"+sqlPath);
			userSession.getUserInfo().setHeadImg(sqlPath);

		} else {
			jsonobj.put("code", 1);
			jsonobj.put("msg", "替换失败");
		}
		
		System.out.println(jsonobj);
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().println(jsonobj.toString());// 重要.toString()
	}

	public void prepareResetPasswd() {
		userLogin = new UserLogin();
	}

	public String resetPasswd() {
		System.out.println("userLogin---" + userLogin);
		userService.changePasswd(userLogin);
		return SUCCESS;
	}

	public void prepareFindback() {
		userLogin = new UserLogin();
	}

	public String findback() {
		System.out.println("phone---" + userLogin.getPhone());
		request.put("phone", userLogin.getPhone());
		return SUCCESS;
	}

	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	public void prepareCheckPhone() {
		userLogin = new UserLogin();
	}

	public String checkPhone() {
		System.out.println("phone" + userLogin.getPhone());
		boolean existPhone = userService.isExistPhone(userLogin.getPhone());
		if (existPhone) {
			try {
				inputStream = new ByteArrayInputStream("existPhoneY".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else {
			try {
				inputStream = new ByteArrayInputStream("existPhoneN".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		return "checkPhone-success";
	}

	public void prepareLogin() {
		userLogin = new UserLogin();
	}

	public String login() throws IOException {
		System.out.println("userLogin---" + userLogin);
		HttpServletResponse response = ServletActionContext.getResponse();
		UserLogin checkUserLogin = userService.check(userLogin);
		System.out.println("checkUserLogin---"+checkUserLogin);
		// JSONObject jsonobj = new JSONObject();
		// if (!loginSuccess) {
		// jsonobj.put("msg", "账户或密码错误");
		// jsonobj.put("code", 0);
		// return "login-fail";
		// }else {
		// jsonobj.put("msg", "登录成功");
		// jsonobj.put("code", 1);
		// }
		// System.out.println("jsonobj---"+jsonobj);
		// response.setContentType("application/json;charset=utf-8");
		// response.getWriter().println(jsonobj.toString());//重要.toString()
		
		if(checkUserLogin == null) {
			return "login-fail";
		}else {
			session.put("userLogin", checkUserLogin);
			return "login-success";
		}
		
	}

	@Override
	public void prepare() throws Exception {
	}

	@Override
	public UserLogin getModel() {
		return userLogin;
	}

	public String logout(){
		LoginSession.invalidate(session);
		return SUCCESS;
	}
	
	
	
	private Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}

	private Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

}
