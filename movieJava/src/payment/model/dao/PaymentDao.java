package payment.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import member.model.dao.MemberDao;

public class PaymentDao {
	private Properties prop = new Properties();
	
	public PaymentDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
