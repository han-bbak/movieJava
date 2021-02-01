package store.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.PageInfo;
import manager.model.dao.ManagerDao;
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
}
