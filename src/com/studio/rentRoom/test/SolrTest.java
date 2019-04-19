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
 * SolrService������
 */

class SolrTest {
	

	
	@Test
	public void insertOrUpdateIndex() throws IOException, SolrServerException {
	    // solr�����url��tb_item��ǰ�洴����solr core
	    String url = "http://www.325studio.cn/solr/RoomDetail";
	    // ����HttpSolrClient
	    solrClient = new HttpSolrClient.Builder(url)
	        .withConnectionTimeout(5000)
	        .withSocketTimeout(5000)
	        .build();
		// ����SolrQuery
		SolrQuery query = new SolrQuery();
		query.setQuery("roomArea:" + 80);
		// ִ�в�ѯ�����ؽ��
		QueryResponse response = solrClient.query(query, METHOD.POST);
		// ��ȡƥ������н��
		SolrDocumentList list = response.getResults();
		System.out.println(list);
//	    Room_detail room_detail = new Room_detail(2, "�����Ŵ����ڵ���5/7�����¾���԰ȫ��һ���ҳ��⿴������", "�¾���԰����", 5000, 4000,
//				new Date(new Date().getTime()), "��¥��/16��", "��");
//	    
//	    // ����Document����
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
        // ����SolrQuery
        SolrQuery query = new SolrQuery();
        // �����ѯ����
        query.setQuery("roomType:һ��һ��һ��");
        // ִ�в�ѯ�����ؽ��
        QueryResponse response = client.query(query);
        // ��ȡƥ������н��
        SolrDocumentList list = response.getResults();
        // ƥ��������
        long count = list.getNumFound();
        System.out.println("�ܽ������" + count);

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
//		// solr�����url��Room��ǰ�洴����solr core
//		String solrUrl = "http://localhost:8080/solr/Room";
//		//Builder builder = new Builder(solrUrl);
//		solrClient = new HttpSolrClient.Builder(solrUrl)
//				.withConnectionTimeout(5000)//�������ӳ�ʱʱ��
//				.withSocketTimeout(5000).build(); // ����solr�Ŀͻ���
//	}

	/**
	 * �����ĵ�
	 * 
	 * @throws Exception
	 */
	@Test
	public void testAdd() throws Exception {
		//����һ��SolrInputDocument���͵ļ���
//		Collection<SolrInputDocument> docList = new ArrayList<>();
//		//�˴��Ƕ����������
//		for (int i = 0; i < 5; i++) {
//		}
//		solrClient.add(docList);
		
//		Room_detail room_detail = new Room_detail(2, "�����Ŵ����ڵ���5/7�����¾���԰ȫ��һ���ҳ��⿴������", "�¾���԰����", 5000, 4000,
//				new Date(new Date().getTime()), "��¥��/16��", "��");
		//�˴��ǵ����������
		/*Person person = new Person();
		person.setId(UUIDUtils.getUUIDStr());
		person.setName("����");
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
//		//����ύ
//		solrClient.commit();
		
		//������ѯ
		testQuery();
	}
	
	/**
	 * ��ѯ�ĵ�
	 * 
	 * @throws SolrServerException
	 * @throws IOException
	 */
	@Test
	public void testQuery() throws SolrServerException, IOException{
		SolrQuery query = new SolrQuery();//����SolrQuery����
		query.set("q", "*:*");//����
		query.set("start", "0");//������ʼ��
		query.set("rows", "10");//��������
		//query.set("sort", "p_id asc");//�����������
		QueryResponse response = solrClient.query(query);//����QueryResponse����
		//��ȡSolrDocument�б�
		SolrDocumentList docList = response.getResults();
		logger.info("�ĵ����������ǣ�" + docList.getNumFound());
		//����SolrDocumentList
		for (SolrDocument document : docList) {
			logger.info("id:" + document.getFieldValue("id"));
			logger.info("p_name��" + document.getFieldValue("p_name"));
			logger.info("p_age��" + document.getFieldValue("p_age"));
			logger.info("-------------------------------------");
		}
	}
	
	/**
	 * ɾ������
	 * 
	 * @throws SolrServerException
	 * @throws IOException
	 */
	@Test
	public void testDelete() throws SolrServerException, IOException{
//		testDeleteById("114ebfaf-cfbb-4893-abd9-ff1b14eb1882");
//		testDeleteByQuery("towards:�ϱ�");
//		testQuery();
	}
	
	/**
	 * ɾ���ĵ�BY ID
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
	 * ɾ���ĵ� BY QUERY
	 * 
	 * @throws SolrServerException
	 * @throws IOException
	 */
	public void testDeleteByQuery(String query) throws SolrServerException, IOException{
		//������Ӧ
		UpdateResponse response;
		//��������
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
	 * ���Ը����ĵ�
	 * 
	 * @throws SolrServerException
	 * @throws IOException
	 */
	@Test
	public void testUpdate() throws SolrServerException, IOException{
		testUpdateDocuments("702eee59-614c-446d-89f1-fc01787b36b2", "p_age", 94);
	}
	
	/**
	 * �����ĵ�
	 * 
	 * @param id
	 *            Ҫ���µ����ݵ�id
	 * @param fieldName
	 *            Ҫ���µ����ݵ��ֶ�����
	 * @param fieldValue
	 *            ���µ��ֶε��ֶ�ֵ
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
	

