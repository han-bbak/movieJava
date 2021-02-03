package store.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import manager.model.dao.ManagerDao;
import payment.model.dao.PaymentDao;
import payment.model.vo.Payment;
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

	public int getListCount1() {
		Connection conn = getConnection();

		int listCount = new StoreDao().getListCount1(conn);

		close(conn);

		return listCount;
	}

	public ArrayList<Store> selectList1(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Store> list = new StoreDao().selectList1(conn, pi);

		close(conn);

		return list;
	}

	public int getSearchListCount1(Search s) {
		Connection conn = getConnection();

		int listCount = new StoreDao().getSearchListCount1(conn, s);

		close(conn);

		return listCount;
	}

	public ArrayList<Store> selectSearchList1(PageInfo pi, Search s) {
		Connection conn = getConnection();

		ArrayList<Store> storeList = new StoreDao().selectSearchList1(conn, pi, s);

		close(conn);

		return storeList;
	}

	public Store selectGoods(int storeNo) {
		Connection conn = getConnection();

		Store s = new StoreDao().selectGoods(conn, storeNo);

		close(conn);

		return s;
	}

	public Store paymentGoods(int storeNo, int selQuan, String total) {
		Connection conn = getConnection();
		
		Store s = new StoreDao().paymentGoods(conn, storeNo, selQuan, total);
		
		close(conn);
		
		return s;
	}

	public Store storeSelect(String memId) {
		Connection conn = getConnection();

		Store store = new StoreDao().storeSelect(conn, memId);

		close(conn);

		
		return store;
	}

}
