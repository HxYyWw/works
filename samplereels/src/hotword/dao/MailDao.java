package hotword.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import hotword.domain.SectionMailBean;
import hotword.domain.TypeMailBean;
import hotword.domain.YearMailBean;
import hotword.utils.DataSourceUtils;

public class MailDao {
	
	public List<YearMailBean> getHotwordBeans() throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from result1";
		return runner.query(sql, new BeanListHandler<YearMailBean>(YearMailBean.class));
	}
	
	public List<TypeMailBean> getTypeMailBeans() throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from result2";
		return runner.query(sql, new BeanListHandler<TypeMailBean>(TypeMailBean.class));
	}
	
	public List<SectionMailBean> getSectionMailBeans() throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from result3 limit 0,15";
		return runner.query(sql, new BeanListHandler<SectionMailBean>(SectionMailBean.class));
	}
	

}
