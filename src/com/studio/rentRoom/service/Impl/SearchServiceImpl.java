package com.studio.rentRoom.service.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrRequest.METHOD;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studio.rentRoom.beans.Images;
import com.studio.rentRoom.beans.Owner;
import com.studio.rentRoom.beans.RoomDetail;
import com.studio.rentRoom.beans.UserLogin;
import com.studio.rentRoom.dao.MainDao;
import com.studio.rentRoom.dao.Impl.MainDaoImpl;
import com.studio.rentRoom.service.SearchService;
import com.studio.rentRoom.utils.FactorsUtils;

@Service("SearchService")
public class SearchServiceImpl implements SearchService {

	@Autowired
	MainDao mainDao = new MainDaoImpl();
	/*
	 * solr 条件搜索
	 */
	@Override
	public List<RoomDetail> getResult(String condition, String search) {
//		String url = "http://localhost:8080/solr/RoomDetail";
		String url = "http://www.325studio.cn/solr/RoomDetail";
		HttpSolrClient client = new HttpSolrClient.Builder(url)
				.withConnectionTimeout(5000)
				.withSocketTimeout(5000)
				.build();
        List<RoomDetail> roomDetails;
		try {
			// 创建SolrQuery
			SolrQuery query = new SolrQuery();
			// 输入查询条件
			if(condition.contains("roomArea")) {
				if(!search.equals("*")) {
					query.setQuery(condition + "[" + Integer.parseInt(search) + " TO "
							+ (Integer.parseInt(search)+20) + "]");
					query.addSort("roomArea", SolrQuery.ORDER.asc);
				}else {
					query.setQuery(condition + search);
					query.addSort("roomArea", SolrQuery.ORDER.asc);
				}
			}
			if(condition.contains("price")) {
				if(!search.equals("*")) {
					query.setQuery(condition + "[" + Integer.parseInt(search) + " TO "
							+ (Integer.parseInt(search)+300) + "]");
					query.addSort("price", SolrQuery.ORDER.asc);
				}else {
					query.setQuery(condition + search);
					query.addSort("price", SolrQuery.ORDER.asc);
				}
			}
			if(condition.contains("rentWay") || condition.contains("room_detail_keywords")) {
				query.setQuery(condition + search);
			}
			// 执行查询并返回结果
			QueryResponse response = client.query(query,METHOD.POST);
			// 获取匹配的所有结果
			SolrDocumentList list = response.getResults();

			roomDetails = new ArrayList<>();
			for (SolrDocument document : list) {
				int roomId = Integer.parseInt((String)document.get("id"));
				RoomDetail roomDetail = getRoomDetailById(roomId);
			    roomDetails.add(roomDetail);
			}
			return roomDetails;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/*
	 * solr 条件搜索 结果条数
	 */
	@Override
	public long getCount(String condition, String search) {
//		String url = "http://localhost:8080/solr/RoomDetail";
		String url = "http://www.325studio.cn/solr/RoomDetail";
		HttpSolrClient client = new HttpSolrClient.Builder(url)
				.withConnectionTimeout(5000)
				.withSocketTimeout(5000)
				.build();
		try {
			// 创建SolrQuery
			SolrQuery query = new SolrQuery();
			// 输入查询条件
			if(condition.contains("roomArea")) {
				if(!search.equals("*")) {
					query.setQuery(condition + "[" + Integer.parseInt(search) + " TO "
							+ (Integer.parseInt(search)+20) + "]");
					query.addSort("roomArea", SolrQuery.ORDER.asc);
				}else {
					query.setQuery(condition + search);
					query.addSort("roomArea", SolrQuery.ORDER.asc);
				}
			}
			if(condition.contains("price")) {
				if(!search.equals("*")) {
					query.setQuery(condition + "[" + Integer.parseInt(search) + " TO "
							+ (Integer.parseInt(search)+300) + "]");
					query.addSort("price", SolrQuery.ORDER.asc);
				}else {
					query.setQuery(condition + search);
					query.addSort("price", SolrQuery.ORDER.asc);
				}
			}
			if(condition.contains("rentWay") || condition.contains("room_detail_keywords")) {
				query.setQuery(condition + search);
			}
			// 执行查询并返回结果
			QueryResponse response = client.query(query,METHOD.POST);
			// 获取匹配的所有结果
			SolrDocumentList list = response.getResults();
			// 匹配结果总数
			long count = list.getNumFound();
			System.out.println("总结果数：" + count);

			return count;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public RoomDetail getRoomDetailById(Integer id) {
		return mainDao.getBean(id);
	}

	@Override
	public List<RoomDetail> getAllRoom() {
		return mainDao.getBeans();
	}

	@Override
	public List<RoomDetail> getOwnerRoom(Owner owner) {
		return mainDao.getOwnerRoom(owner);
	}

	/*
	 * 筛选
	 */
	@Override
	public List<RoomDetail> select(String data, String time) {
		String[] split = data.split("_");
		Map<Integer, ArrayList<String>> map = FactorsUtils.addFactors();
		int sort = Integer.parseInt(split[0]);//类别 :1-面积、2-价格、3-房屋类型等
		ArrayList<String> list = map.get(sort);
		int aheadSort = Integer.parseInt(split[1]);//1_1  1_0
		String factor = list.get(aheadSort);//得到参数
		System.out.println("aheadSort---"+aheadSort);
		System.out.println("factor---"+factor);
		if(sort == 1) {
			String condition = "roomArea:";
			return getResult(condition, factor);
		}
		if(sort == 2) {
			String condition = "rentWay:";
			return getResult(condition, factor);
		}
		if(sort == 3) {
			String condition = "price:";
			return getResult(condition, factor);
		}
		return null;
	}

	@Override
	public int selectNum(String data, String time) {
		String[] split = data.split("_");
		Map<Integer, ArrayList<String>> map = FactorsUtils.addFactors();
		int sort = Integer.parseInt(split[0]);//类别 :1-面积、2-价格、3-房屋类型等
		ArrayList<String> list = map.get(sort);
		int aheadSort = Integer.parseInt(split[1]);//1_1  1_0
		String factor = list.get(aheadSort);//得到参数
		System.out.println("aheadSort---"+aheadSort);
		System.out.println("factor---"+factor);
		if(aheadSort == 0) {
			factor = "*";//得到参数
		}
		
		System.out.println("sort---"+sort);
		System.out.println("factor---"+factor);
		
		if(sort == 1) {
			String condition = "roomArea:";
			return (int) getCount(condition, factor);
		}
		if(sort == 2) {
			String condition = "rentWay:";
			return (int) getCount(condition, factor);
		}
		if(sort == 3) {
			String condition = "price:";
			return (int) getCount(condition, factor);
		}
		return 0;
	}
	
	
}
