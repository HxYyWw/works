package hotword.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import hotword.domain.HotwordBean;
import hotword.domain.HotwordSearchBean;
import hotword.utils.DataSourceUtils;

public class HotwordDao {
	
	public List<HotwordBean> getHotwordBeans() throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from catalogue";
		return runner.query(sql, new BeanListHandler<HotwordBean>(HotwordBean.class));
	}
	
	public List<HotwordSearchBean> getHotwordSearchBeans(String name) throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from search where search = ?";
		return runner.query(sql, new BeanListHandler<HotwordSearchBean>(HotwordSearchBean.class),name);
	}
	
	public HotwordBean getHotwordBean(String name) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from detailinfo where name = ?";
		return runner.query(sql, new BeanHandler<HotwordBean>(HotwordBean.class),name);
	}
	
}
