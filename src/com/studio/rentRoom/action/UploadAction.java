package com.studio.rentRoom.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
import com.studio.rentRoom.beans.Agents;
import com.studio.rentRoom.beans.Images;
import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.RoomDetail;
import com.studio.rentRoom.beans.UserLogin;
import com.studio.rentRoom.service.SearchService;
import com.studio.rentRoom.service.UploadService;

import net.sf.json.JSONObject;

@Controller("UploadAction")
@Scope("prototype")
public class UploadAction extends ActionSupport implements ModelDriven<RoomDetail>, SessionAware,Preparable,RequestAware{

	private static final long serialVersionUID = 1L;
	private RoomDetail roomDetail;
	private Agents agents;
	
	@Autowired
	private UploadService uploadService;
	@Autowired
	private SearchService searchService;
	
	private File file;
	private String fileFileName;
	
	
	public void setFile(File file) {
		this.file = file;
	}
	
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public void upload() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		
		JSONObject jsonobj = new JSONObject();
		String uploadSort = "RoomImg";
		if(uploadService.uploadImg(file,fileFileName,uploadSort)) {
			jsonobj.put("code", 0);
			jsonobj.put("msg", "上传成功");
			
		}else {
			jsonobj.put("code", 1);
			jsonobj.put("msg", "以上图片未上传成功，请重新上传！");
		}
		System.out.println(jsonobj);
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().println(jsonobj.toString());//重要.toString()
	}
	
	private String name;
	private String phone;
	private String sex;
	private Integer roomId;
	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void prepareDone(){
		roomDetail = new RoomDetail();
	}
	
	public String done() {
		agents = new Agents();
		agents.setName(name);
		agents.setPhone(phone);
		agents.setSex(sex);
		System.out.println(agents);
		roomDetail.setAgents(agents);
		
		roomDetail.setPubDate(new Date());
		UserLogin userLogin = (UserLogin) session.get("userLogin");
		roomDetail.setOwner(userLogin.getOwner());
		System.out.println("roomDetail---"+roomDetail);
		roomId = uploadService.saveRoom(roomDetail);
		request.put("roomId", roomId);
		return "done";
	}
	
	public String display() {
		//获取room和经纪人
		RoomDetail roomDetail = searchService.getRoomDetailById(roomId);
		request.put("roomDetail", roomDetail);
		System.out.println("display--"+roomId);
		System.out.println("display--"+roomDetail);
		//获取图片
		List<Images> images = uploadService.getImage(roomId);
		request.put("images", images);
		System.out.println("display--"+images);
		return "display";
	}
	
	public String backmain() {
		return "main";
	}
	
	
	@Override
	public void prepare() throws Exception {}


	@Override
	public RoomDetail getModel() {
		return roomDetail;
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
