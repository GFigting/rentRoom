package com.studio.rentRoom.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class FactorsUtils {

	
	/*
	 * �ⷿ���ͣ����⡢����
	 */
	private static Map<String, String> rooms = new HashMap<>();
	public static Map<String, String> addRooms(){
		rooms.put("y", "����");
		rooms.put("z", "����");
		rooms.put("h", "����");
		rooms.put("g", "��Ԣ");
		rooms.put("t", "ͨ���ҷ�");
		rooms.put("f", "ȫ����Դ");
		
		return rooms;
	}
	
	/*
	 * select����
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
		roomType.add("һ��һ��");
		roomType.add("����һ��");
		roomType.add("����һ��");
		roomType.add("����һ��");
		roomType.add("���Ҷ���");
		roomType.add("��������");
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
