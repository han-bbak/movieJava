package store.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import manager.model.dao.ManagerDao;
import store.model.vo.PageInfo;
import store.model.vo.Search;
import store.model.dao.StoreDao;
import store.model.vo.Store;

public class StoreService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new StoreDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Store> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Store> list = new StoreDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int getSearchListCount(Search s) {
		Connection conn = getConnection();
		
		int listCount = new StoreDao().getSearchListCount(conn, s);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Store> selectSearchList(PageInfo pi, Search s) {
		Connection conn = getConnection();
		
		ArrayList<Store> storeList = new StoreDao().selectSearchList(conn, pi, s);
		
		close(conn);
		
		return storeList;
	}

}
