package hotword.service;

import java.sql.SQLException;
import java.util.List;

import hotword.dao.MailDao;
import hotword.domain.SectionMailBean;
import hotword.domain.TypeMailBean;
import hotword.domain.YearMailBean;

public class MailService {
	
	private MailDao dao = new MailDao();
	
	public List<YearMailBean> getYearMailBeans(){
		List<YearMailBean> beans = null;
		try {
			beans = dao.getHotwordBeans();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return beans;
	}
	
	public List<TypeMailBean> getTypeMailBeans(){
		List<TypeMailBean> beans = null;
		try {
			beans = dao.getTypeMailBeans();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return beans;
	}
	
	public List<SectionMailBean> getSectionMailBeans(){
		List<SectionMailBean> beans = null;
		try {
			beans = dao.getSectionMailBeans();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return beans;
	}

}
