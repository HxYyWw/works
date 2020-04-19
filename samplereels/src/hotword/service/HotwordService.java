package hotword.service;

import java.sql.SQLException;
import java.util.List;

import com.google.gson.Gson;

import hotword.dao.HotwordDao;
import hotword.domain.HotwordBean;
import hotword.domain.HotwordSearchBean;

public class HotwordService {
	
	private HotwordDao dao = new HotwordDao();
	
	public List<HotwordBean> getHotwordBeans(){
		List<HotwordBean> beans = null;
		try {
			beans = dao.getHotwordBeans();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return beans;
	}
	
	public List<HotwordSearchBean> getHotwordSearchBeans(String name){
		List<HotwordSearchBean> beans = null;
		try {
			beans = dao.getHotwordSearchBeans(name);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return beans;
	}
	
	
	public HotwordBean getHotwordBean(String name) {
		HotwordBean bean = null;
		try {
			bean = dao.getHotwordBean(name);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return bean;
	}
	
}
