package com.studio.rentRoom.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import org.apache.log4j.Logger;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.SolrRequest.METHOD;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.request.UpdateRequest;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.junit.Before;
import org.junit.jupiter.api.Test;


/*
 * SolrService测试类
 */

class SolrTest {
	

	
	@Test
	public void insertOrUpdateIndex() throws IOException, SolrServerException {
	    // solr服务的url，tb_item是前面创建的solr core
	    String url = "http://www.325studio.cn/solr/RoomDetail";
	    // 创建HttpSolrClient
	    solrClient = new HttpSolrClient.Builder(url)
	        .withConnectionTimeout(5000)
	        .withSocketTimeout(5000)
	        .build();
		// 创建SolrQuery
		SolrQuery query = new SolrQuery();
		query.setQuery("roomArea:" + 80);
		// 执行查询并返回结果
		QueryResponse response = solrClient.query(query, METHOD.POST);
		// 获取匹配的所有结果
		SolrDocumentList list = response.getResults();
		System.out.println(list);
//	    Room_detail room_detail = new Room_detail(2, "崇文门磁器口地铁5/7号线新景家园全南一居室出租看房方便", "新景家园东区", 5000, 4000,
//				new Date(new Date().getTime()), "中楼层/16层", "南");
//	    
//	    // 创建Document对象
//	    SolrInputDocument doc = new SolrInputDocument();
//		doc.addField("id", room_detail.getId());
//		doc.addField("roomName", room_detail.getRoomName());
//		doc.addField("location", room_detail.getLocation());
//		doc.addField("maxPrice", room_detail.getMaxPrice());
//		doc.addField("minPrice", room_detail.getMinPrice());
//		doc.addField("date", room_detail.getDate());
//		doc.addField("type", room_detail.getType());
//		doc.addField("towards", room_detail.getTowards());

//		solrClient.add(doc);

		solrClient.commit();
	}
	
	
	@Test
    public void simpleSearch() throws IOException, SolrServerException {
        String url = "http://localhost:8080/solr/RoomDetail";
        HttpSolrClient client = new HttpSolrClient.Builder(url)
                .withConnectionTimeout(5000)
                .withSocketTimeout(5000)
                .build();
        // 创建SolrQuery
        SolrQuery query = new SolrQuery();
        // 输入查询条件
        query.setQuery("roomType:一室一厅一卫");
        // 执行查询并返回结果
        QueryResponse response = client.query(query);
        // 获取匹配的所有结果
        SolrDocumentList list = response.getResults();
        // 匹配结果总数
        long count = list.getNumFound();
        System.out.println("总结果数：" + count);

        for (SolrDocument document : list) {
            System.out.println(document.get("id"));
            System.out.println(document.get("roomName"));
            System.out.println(document.get("price"));
            System.out.println(document.get("roomType"));
            System.out.println(document.get("roomArea"));
            System.out.println(document.get("towards"));
            System.out.println(document.get("roomWay"));
            System.out.println(document.get("lookTime"));
            System.out.println(document.get("pubDate"));
            System.out.println(document.get("location"));
            System.out.println("================");
        }
        
//        for (SolrDocument document : list) {
//            System.out.println(document.get("id"));
//            System.out.println(document.get("roomName"));
//            System.out.println(document.get("location"));
//            System.out.println(document.get("maxPrice"));
//            System.out.println(document.get("minPrice"));
//            System.out.println(document.get("date"));
//            System.out.println(document.get("type"));
//            System.out.println(document.get("towards"));
//            System.out.println("================");
//        }

    }
	
	private HttpSolrClient solrClient;
	private Logger logger = Logger.getLogger(getClass());
	
//	@Before
//	public void setUp() throws Exception {
//		// solr服务的url，Room是前面创建的solr core
//		String solrUrl = "http://localhost:8080/solr/Room";
//		//Builder builder = new Builder(solrUrl);
//		solrClient = new HttpSolrClient.Builder(solrUrl)
//				.withConnectionTimeout(5000)//设置连接超时时间
//				.withSocketTimeout(5000).build(); // 定义solr的客户端
//	}

	/**
	 * 增加文档
	 * 
	 * @throws Exception
	 */
	@Test
	public void testAdd() throws Exception {
		//创建一个SolrInputDocument类型的集合
//		Collection<SolrInputDocument> docList = new ArrayList<>();
//		//此处是多条数据添加
//		for (int i = 0; i < 5; i++) {
//		}
//		solrClient.add(docList);
		
//		Room_detail room_detail = new Room_detail(2, "崇文门磁器口地铁5/7号线新景家园全南一居室出租看房方便", "新景家园东区", 5000, 4000,
//				new Date(new Date().getTime()), "中楼层/16层", "南");
		//此处是单条数据添加
		/*Person person = new Person();
		person.setId(UUIDUtils.getUUIDStr());
		person.setName("王五");
		person.setAge(30);
		
		SolrInputDocument doc = new SolrInputDocument();
		doc.addField("id", person.getId());
		doc.addField("p_name", person.getName());
		doc.addField("p_age", person.getAge());
        solrClient.add(doc);*/
//		SolrInputDocument doc = new SolrInputDocument();
//		doc.addField("id", room_detail.getId());
//		doc.addField("roomName", room_detail.getRoomName());
//		doc.addField("location", room_detail.getLocation());
//		doc.addField("maxPrice", room_detail.getMaxPrice());
//		doc.addField("minPrice", room_detail.getMinPrice());
//		doc.addField("date", room_detail.getDate());
//		doc.addField("type", room_detail.getType());
//		doc.addField("towards", room_detail.getTowards());
//		solrClient.add(doc);
//		//最后提交
//		solrClient.commit();
		
		//添加完查询
		testQuery();
	}
	
	/**
	 * 查询文档
	 * 
	 * @throws SolrServerException
	 * @throws IOException
	 */
	@Test
	public void testQuery() throws SolrServerException, IOException{
		SolrQuery query = new SolrQuery();//创建SolrQuery对象
		query.set("q", "*:*");//设置
		query.set("start", "0");//设置起始行
		query.set("rows", "10");//设置行数
		//query.set("sort", "p_id asc");//设置排序规则
		QueryResponse response = solrClient.query(query);//创建QueryResponse对象
		//获取SolrDocument列表
		SolrDocumentList docList = response.getResults();
		logger.info("文档数据条数是：" + docList.getNumFound());
		//遍历SolrDocumentList
		for (SolrDocument document : docList) {
			logger.info("id:" + document.getFieldValue("id"));
			logger.info("p_name：" + document.getFieldValue("p_name"));
			logger.info("p_age：" + document.getFieldValue("p_age"));
			logger.info("-------------------------------------");
		}
	}
	
	/**
	 * 删除测试
	 * 
	 * @throws SolrServerException
	 * @throws IOException
	 */
	@Test
	public void testDelete() throws SolrServerException, IOException{
//		testDeleteById("114ebfaf-cfbb-4893-abd9-ff1b14eb1882");
//		testDeleteByQuery("towards:南北");
//		testQuery();
	}
	
	/**
	 * 删除文档BY ID
	 * 
	 * @param id
	 * @throws SolrServerException
	 * @throws IOException
	 */
	public void testDeleteById(String id) throws SolrServerException, IOException {
		UpdateResponse response = solrClient.deleteById(id);
//		solrClient.commit();
//		logger.info("result:" + response.getStatus() + "\t Qtime:" + response.getQTime());
	}
	
	/**
	 * 删除文档 BY QUERY
	 * 
	 * @throws SolrServerException
	 * @throws IOException
	 */
	public void testDeleteByQuery(String query) throws SolrServerException, IOException{
		//设置响应
		UpdateResponse response;
		//创建请求
		UpdateRequest request = new UpdateRequest();
		request.deleteByQuery(query);
		request.setCommitWithin(500);
		request.process(solrClient);
		logger.info("URL:" + request.getPath() + "\t XML:" + request.getXML() + "\t Method:" + request.getMethod());
		response = solrClient.deleteByQuery(query);
		solrClient.commit();
		logger.info("result:" + response.getStatus() + "\t Qtime:" + response.getQTime());
	}
	
	/**
	 * 测试更新文档
	 * 
	 * @throws SolrServerException
	 * @throws IOException
	 */
	@Test
	public void testUpdate() throws SolrServerException, IOException{
		testUpdateDocuments("702eee59-614c-446d-89f1-fc01787b36b2", "p_age", 94);
	}
	
	/**
	 * 更新文档
	 * 
	 * @param id
	 *            要更新的数据的id
	 * @param fieldName
	 *            要更新的数据的字段名称
	 * @param fieldValue
	 *            更新的字段的字段值
	 * @throws SolrServerException
	 * @throws IOException
	 */
	public void testUpdateDocuments(String id,String fieldName,Object fieldValue) throws SolrServerException, IOException{
		HashMap<String, Object> operation = new HashMap<>();
		operation.put("set", fieldValue);
		SolrInputDocument doc = new SolrInputDocument();
		doc.addField("id", id);
		doc.addField(fieldName, operation);
		UpdateResponse response = solrClient.add(doc);
		logger.info("update doc id:" + id + "\t result:" + response.getStatus() + "\t Qtime:" + response.getQTime());
		response = solrClient.commit();
		logger.info("update doc id:" + id + "\t result:" + response.getStatus() + "\t Qtime:" + response.getQTime());
		
		testQuery();
	}
}
	

