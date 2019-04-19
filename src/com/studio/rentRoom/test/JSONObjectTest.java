package com.studio.rentRoom.test;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.aspectj.weaver.loadtime.Agent;
import org.junit.jupiter.api.Test;

import com.mysql.fabric.xmlrpc.base.Data;
import com.studio.rentRoom.beans.Images;
import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.RoomDetail;

import net.sf.json.JSONObject;

class JSONObjectTest {

	
	@Test
	void testIO() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd/");
		Date date=new Date();
		String datePath=sdf.format(date);
		String dir = "D:/apache-tomcat-9.0.11/UploadFiles/reflection/" + datePath;
		String data ="要保存的数据";
		File fileDir = new File(dir);
		if (!fileDir.isDirectory() && !fileDir.exists()) { //如果不存在 则创建
			fileDir.mkdirs();
		}
		try {
			PrintWriter pw=new PrintWriter(fileDir+"/"+System.currentTimeMillis()+".txt");
			pw.write(data);
			pw.flush();
			pw.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	void test() {
		Set<Images> set = new HashSet<Images>();
		RoomDetail rDetail = new RoomDetail();
		rDetail.setPrice(25);
		JSONObject jsonobj2 = JSONObject.fromObject(rDetail);
		System.out.println("jsonobj2---"+jsonobj2);
	}

}
