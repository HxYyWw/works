package hotword.service;

import java.sql.SQLException;
import java.util.List;

import hotword.dao.MapDao;
import hotword.domain.MapBean;

public class MapService {

	public List<MapBean> getMapBeans(){
		MapDao dao = new MapDao();
		List<MapBean> mapBeans = null;
		try {
			mapBeans = dao.getMapBeans();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return mapBeans;
	}
	
}
