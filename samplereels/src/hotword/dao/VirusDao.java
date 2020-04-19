package hotword.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;


import hotword.domain.DataBean;
import hotword.utils.DataSourceUtils;


public class VirusDao {

	//获取信息
	public List<DataBean> getDataBeans() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from allchina ORDER BY id";
		return runner.query(sql, new BeanListHandler<DataBean>(DataBean.class));
	}
	
	
}
