package movie;

import static common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import common.JDBCTemplate;
import manager.model.vo.PageInfo;
import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MovieDAO {	
	
	private Properties prop = new Properties();
  	Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs =null;
    
	// 전체 영화 검색
    public ArrayList<Bean> getAllMovie() {
    	
    	Connection conn = getConnection();
    	ArrayList<Bean> list = new ArrayList<>();
    	Bean been = null;
   
    	
    	try {
    		
            String sql = "select * from movie";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            // 데이터 저장
            while (rs.next()) { 
                Bean bean = new Bean();
                bean.setM_code(rs.getString("m_code"));
                bean.setM_title(rs.getString("m_title"));
                bean.setM_genre(rs.getString("m_genre"));
                bean.setM_director(rs.getString("m_director"));
                bean.setM_date(rs.getString("m_date"));
                bean.setM_country(rs.getString("m_country"));
                bean.setM_image(rs.getString("m_image"));
                bean.setM_summary(rs.getString("m_summary"));
                bean.setM_rating(rs.getString("m_rating"));
                bean.setM_grade(rs.getInt("m_grade"));
                bean.setStatus(rs.getString("status"));
                // 벡터에 빈 클래스를 저장
                list.add(bean);
 
            }
 
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	close(rs);
        }
    	System.out.println(list);
        return list;
 
    }

 // 장르별 영화 리스트를 저장하는 메소드
    public ArrayList<Bean> getGanre(Connection conn,String M_GENRE) {
        ArrayList<Bean> list = new ArrayList<>();
 
        // 데이터를 저장할 빈 클래스 선언
        Bean bean = null;
 
 
        try {
            String sql = "select * from movie where m_genre=?";
            pstmt = conn.prepareStatement(sql);
 
            // ?에 값을 넣는다.
            pstmt.setString(1, M_GENRE);
            
            // 결과를 리턴
            rs = pstmt.executeQuery();
            // 반복문을 돌려서 데이터를 저장
 
            while (rs.next()) { // 데이터를 저장할 빈 클래스 생성
                bean = new Bean();
                bean.setM_code(rs.getString("m_code"));
                bean.setM_title(rs.getString("m_title"));
                bean.setM_genre(rs.getString("m_genre"));
                bean.setM_director(rs.getString("m_director"));
                bean.setM_date(rs.getString("m_date"));
                bean.setM_country(rs.getString("m_country"));
                bean.setM_image(rs.getString("m_image"));
                bean.setM_summary(rs.getString("m_summary"));
                bean.setM_rating(rs.getString("m_rating"));
                bean.setM_grade(rs.getInt("m_grade"));
                bean.setStatus(rs.getString("status"));
                // 벡터에 빈 클래스를 저장
                list.add(bean);
 
            }
 
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return list;
 
    }

    
 
    
    
}
