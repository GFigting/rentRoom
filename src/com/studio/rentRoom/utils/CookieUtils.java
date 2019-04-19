package com.studio.rentRoom.utils;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studio.rentRoom.beans.RoomDetail;

public class CookieUtils {
	
	//��ȡ����cookie
	public static List<Integer> getAllCookie(HttpServletRequest request) {
		Cookie [] cookies = request.getCookies();
	
		List<Integer> lDetails = new ArrayList<>();
		if(cookies != null && cookies.length > 0){
			for(Cookie c: cookies){
				String cookieName = c.getName();
				if(cookieName.startsWith("roomDetail_")){
					lDetails.add(Integer.parseInt(c.getValue()));
				}
			}
		}
		
		return lDetails;
	}

	private static RoomDetail getRoomDetail(String value) {
		RoomDetail roomDetail = new RoomDetail();
		System.out.println(roomDetail);
		String[] split = value.split(",");
		System.out.println("roomSplit---"+split);
		
		roomDetail.setId(Integer.valueOf(split[0]));
		roomDetail.setRoomName(split[1]);
		roomDetail.setPrice(Float.parseFloat(split[2]));
		roomDetail.setRoomType(split[3]);
		roomDetail.setRoomArea(Float.parseFloat(split[4]));
		roomDetail.setTowards(split[5]);
		roomDetail.setLocation(split[6]);
		
		return roomDetail;
	}

	//ɾ��Cookie
	public static void delAllCookie(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				cookie.setValue("");
				cookie.setMaxAge(0);
			}
		}
	}
	
	//���Cookie
	public static void addCookie(HttpServletRequest request, HttpServletResponse rep, String name, RoomDetail roomDetail) {
		Cookie[] cookies = request.getCookies();
		
		System.out.println("roomDetail---"+roomDetail);
		//�������е�roomDetail ��ͷ�� Cookie
		List<Cookie> roomCookies = new ArrayList<Cookie>();
		//��������� books.jsp ����� book ƥ����Ǹ� Cookie
		Cookie tempCookie = null;
		
		if(cookies != null && cookies.length > 0){
			for(Cookie c: cookies){
				String cookieName = c.getName();
				if(cookieName.startsWith("roomDetail_")){
					roomCookies.add(c);
					
					if(c.getValue().equals(roomDetail.toString())){
						tempCookie = c;
					}
				}
			}
		}
		
		//��. ������ ҳ�洫��� roomDetail ���� roomDetail_ �� Cookie ����ɾ��������Ǹ� Cookie
		if(roomCookies.size() >= 20 && tempCookie == null){
			tempCookie = roomCookies.get(0);
		}
		
		//��. �������У���ɾ���� Cookie
		if(tempCookie != null){
			tempCookie.setMaxAge(0);
			rep.addCookie(tempCookie);
		}
		Cookie cookie = new Cookie(name, roomDetail.getId().toString());
		cookie.setMaxAge(60*60*24*30);
		rep.addCookie(cookie);
	}

}
