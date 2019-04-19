package com.studio.rentRoom.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.solr.client.solrj.SolrServerException;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.studio.rentRoom.beans.Images;
import com.studio.rentRoom.beans.RoomDetail;
import com.studio.rentRoom.service.SearchService;
import com.studio.rentRoom.service.UploadService;
import com.studio.rentRoom.utils.CookieUtils;
import com.studio.rentRoom.utils.FactorsUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller("MainAction")
@Scope("prototype")
public class MainAction extends ActionSupport implements RequestAware{

	private static final long serialVersionUID = 1L;

	@Autowired
	private SearchService searchService;
	@Autowired
	private UploadService uploadService;
	
	public String search() {
		return "search";
	}

	private String sort;
	public void setSort(String sort) {
		this.sort = sort;
	}

	public String list() {
		List<RoomDetail> rooms = searchService.getAllRoom();
		String condition = "room_detail_keywords:";
		request.put("sort", FactorsUtils.addRooms().get(sort));
		request.put("pages", searchService.getCount(condition,search) / 2);
		request.put("count", searchService.getCount(condition,search));
		request.put("roomDetails", rooms);
		return "list";
	}

	public String main() {
		return "main";
	}

	public String id;

	public void setId(String id) {
		this.id = id;
	}

	public String roomDetail() {
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse rep = ServletActionContext.getResponse();
		int roomId = Integer.parseInt(id);
		RoomDetail roomDetail = searchService.getRoomDetailById(roomId);
		request.put("roomDetail", roomDetail);
		//获取图片
		List<Images> images = uploadService.getImage(roomId);
		request.put("images", images);

		CookieUtils.addCookie(req, rep, "roomDetail_" + roomId, roomDetail);

		return SUCCESS;
	}

	public String search;

	public void setSearch(String search) {
		this.search = search;
	}


    private String data;
    private String time;
	public void setData(String data) {
		this.data = data;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	public String resultSearch() throws SolrServerException, IOException {
		System.out.println("search---" + search);
		String condition = "room_detail_keywords:";
		List<RoomDetail> rooms = searchService.getResult(condition,search);
		request.put("pages", searchService.getCount(condition, search) / 2);
		request.put("count", searchService.getCount(condition, search));
		request.put("roomDetails", rooms);
		return SUCCESS;
	}

	public String select() throws IOException {
		System.out.println("selectdata---" + data);
		HttpServletResponse response = ServletActionContext.getResponse();
		
//		List rooms = new ArrayList<>();
//		rooms.add("fafaf");
//		rooms.add("fa_fa");
//		rooms.add("afafa");
		List<RoomDetail> rooms = searchService.select(data,time);
		int resultNum = searchService.selectNum(data,time);
		System.out.println("rooms---"+rooms);
		System.out.println("resultNum---"+resultNum);
		for (RoomDetail rDetail : rooms) {
			rDetail.setAgents(null);
			rDetail.setOwner(null);
			rDetail.setImages(null);
		}
//		request.put("pages", resultNum / 2);
//		request.put("count", resultNum);
//		JSONArray jsonArray = new JSONArray();
		JSONObject jsonobj = new JSONObject();
		if (resultNum != 0) {
			jsonobj.put("code", 0);
			jsonobj.put("msg", resultNum+"条结果");

		} else {
			jsonobj.put("code", 1);
			jsonobj.put("msg", "0条结果");
		}
		jsonobj.put("pages", resultNum / 2);
		jsonobj.put("count", resultNum);
//		JSONObject jsonobj2 = JSONObject.fromObject(rooms.get(1));
		jsonobj.put("roomDetails2", rooms);
//		jsonArray.add(jsonobj);
//		jsonArray.add(JSONArray.fromObject(rooms));
//		JSONArray jsonArray2 = new JSONArray();
//		for (RoomDetail rDetail : rooms) {
//			JSONObject jsonobj2 = JSONObject.fromObject(rDetail);
//			System.out.println("jsonobj2---"+jsonobj2);
//			jsonArray2.add(jsonobj2);
//		}
//		jsonArray.add(jsonArray2);
		
		System.out.println(jsonobj);
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().flush();
		response.getWriter().println(jsonobj.toString());// 重要.toString()
//		response.getWriter().println(jsonArray.toString());// 重要.toString()
		response.getWriter().close();
		return SUCCESS;
	}

	private Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}

}
