package com.studio.rentRoom.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.RoomDetail;
import com.studio.rentRoom.beans.UserLogin;
import com.studio.rentRoom.service.SearchService;
import com.studio.rentRoom.service.UploadService;
import com.studio.rentRoom.service.UserService;
import com.studio.rentRoom.utils.CookieUtils;
import com.studio.rentRoom.utils.LoginSession;

import net.sf.json.JSONObject;
@Controller("MeAction")
@Scope("prototype")
public class MeAction extends ActionSupport implements RequestAware,SessionAware,Preparable, ModelDriven<Owner>{

	private static final long serialVersionUID = 1L;

	private Owner owner;
	@Autowired
	private UserService userService;
	@Autowired
	private UploadService uploadService;
	@Autowired
	private SearchService searchService;
	
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

	private String imgNames;
	private String imgNames2;
	
	public void setImgNames(String imgNames) {
		this.imgNames = imgNames;
	}
	public void setImgNames2(String imgNames2) {
		this.imgNames2 = imgNames2;
	}

	
	public void owner() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		JSONObject jsonobj = new JSONObject();
		System.out.println("fileFileName---" + fileFileName);
		String uploadSort = "Identification";
		if(uploadService.uploadImg(file,fileFileName,uploadSort)) {
			jsonobj.put("code", 0);
			jsonobj.put("msg", "上传成功");
			jsonobj.put("filename", fileFileName);
			
		}else {
			jsonobj.put("code", 1);
			jsonobj.put("msg", "上传失败");
		}
			
		System.out.println(jsonobj);
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().println(jsonobj.toString());//重要.toString()
	}
	
	//房主注册
	public void prepareOwneregis(){
		owner = new Owner();
	}
	public String owneregis() {
		System.out.println("owner---" + owner);
		UserLogin userLogin = (UserLogin) session.get("userLogin");
		System.out.println("userLogin---" + userLogin);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd/");
		Date date=new Date();
		String datePath=sdf.format(date);
		String sqlPath = "Images/Identification/"+datePath + imgNames;
		String sqlPath2 = "Images/Identification/"+datePath + imgNames2;
		System.out.println("sqlPath---" + sqlPath);
		System.out.println("sqlPath2---" + sqlPath2);
		owner.setImages(sqlPath+ ";" +sqlPath2);
		owner.setUserLogin(userLogin);
		userService.saveOwner(owner);
		
		return "main";
	}
	
	public String changeName() {
		return "changeName";
	}
	public String info() {
		return "info";
	}
	public String upload() {
		if(!LoginSession.isLogin(session)) {
			return "toLogin";
		}
		UserLogin userLogin = (UserLogin) session.get("userLogin");
		if(userLogin.getOwner() == null) {
			return "identific";
		}
		return "upload";
	}
	public String identific() {
		if(!LoginSession.isLogin(session)) {
			return "toLogin";
		}
		return "identific";
	}
	public String contract() {
		if(!LoginSession.isLogin(session)) {
			return "toLogin";
		}
		return "contract";
	}
	public String history() {
//		if(!LoginSession.isLogin(session)) {
//			return "toLogin";
//		}
		HttpServletRequest req = ServletActionContext.getRequest();
		List<Integer> allCookieId = CookieUtils.getAllCookie(req);
		List<RoomDetail> roomDetails = new ArrayList<>();
		for (int i = 0; i < allCookieId.size(); i++) {
			RoomDetail roomDetail = searchService.getRoomDetailById(allCookieId.get(i));
			System.out.println(roomDetail);
			roomDetails.add(roomDetail);
		}
		request.put("roomDetails",roomDetails );
		return "history";
	}
	public String appointment() {
		if(!LoginSession.isLogin(session)) {
			return "toLogin";
		}
		return "appointment";
	}
	public String collections() {
		if(!LoginSession.isLogin(session)) {
			return "toLogin";
		}
		return "collections";
	}
	public String coupons() {
		if(!LoginSession.isLogin(session)) {
			return "toLogin";
		}
		return "coupons";
	}
	//发布房源
	public String room() {
		if(!LoginSession.isLogin(session)) {
			return "toLogin";
		}
		UserLogin userLogin = (UserLogin) session.get("userLogin");
		Owner owner = userLogin.getOwner();
		List<RoomDetail> roomDetails = (List<RoomDetail>) searchService.getOwnerRoom(owner);
		request.put("myRooms", roomDetails);
		return "room";
	}
	public String service() {
		return "service";
	}
	public String helps() {
		return "helps";
	}
	public String about() {
		return "about";
	}
	public String setting() {
		return "setting";
	}
	@Override
	public Owner getModel() {
		return owner;
	}
	
	private String content;
	private String email;
	
	public void setContent(String content) {
		this.content = content;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String reflection() {
		uploadService.uploadReflection(content,email);
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
	@Override
	public void prepare() throws Exception {}
	
}
