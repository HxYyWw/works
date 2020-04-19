package hotword.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import hotword.domain.MapBean;
import hotword.utils.DataSourceUtils;


public class MapDao {

		//获取信息
		public List<MapBean> getMapBeans() throws SQLException {
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "select * from sheet1 ORDER BY id";
			return runner.query(sql, new BeanListHandler<MapBean>(MapBean.class));
		}
	
}
