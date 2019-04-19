package com.studio.rentRoom.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class FactorsUtils {

	
	/*
	 * 租房类型：月租、整租
	 */
	private static Map<String, String> rooms = new HashMap<>();
	public static Map<String, String> addRooms(){
		rooms.put("y", "月租");
		rooms.put("z", "整租");
		rooms.put("h", "合租");
		rooms.put("g", "公寓");
		rooms.put("t", "通勤找房");
		rooms.put("f", "全部房源");
		
		return rooms;
	}
	
	/*
	 * select参数
	 */
	private static Map<Integer, ArrayList<String>> map = new HashMap<>();
	public static Map<Integer, ArrayList<String>> addFactors() {
		ArrayList<String> area = new ArrayList<>();
		area.add("");
		area.add("10");
		area.add("30");
		area.add("50");
		area.add("70");
		area.add("90");
		area.add("110");
		map.put(1, area);
		ArrayList<String> roomType = new ArrayList<>();
		roomType.add("");
		roomType.add("一室一厅");
		roomType.add("二室一厅");
		roomType.add("三室一厅");
		roomType.add("四室一厅");
		roomType.add("四室二厅");
		roomType.add("四室三厅");
		map.put(2, roomType);
		ArrayList<String> rent = new ArrayList<>();
		rent.add("");
		rent.add("100");
		rent.add("500");
		rent.add("800");
		rent.add("1100");
		rent.add("1400");
		rent.add("1700");
		rent.add("2000");
		map.put(3, rent);
		
		return map;
	}
	
}
