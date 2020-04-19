package hotword.utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DataSourceUtils {
	
	private static DataSource dataSource = new ComboPooledDataSource();
	private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();

	//直接可以连接的连接池
	public static DataSource getDataSource() {
		return dataSource;
	}
	
	//获取Connection
	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
	
	//获取连接对象
	public static Connection getCurrentConnection() throws SQLException {
		Connection con = tl.get();
		if(con==null) {
			con = dataSource.getConnection();
			tl.set(con);
		}
		return con;
	}
	
	//开启事务
   public static void startTransaction() throws SQLException {
	   Connection con = getCurrentConnection();
	   if(con!=null) {
		   con.setAutoCommit(false);
	   }
   }
   
   //事务回滚
   public static void rollback() throws SQLException {
	   Connection con = getCurrentConnection();
	   if(con!=null) {
		   con.rollback();
	   }
   }
   
   //关闭资源
   
   public static void commitAndRelease() throws SQLException {
	   Connection con = getCurrentConnection();
	   if(con!=null) {
		   con.commit();
		   con.close();
		   tl.remove();
	   }
   }

	public static void close(ResultSet rs,Statement st) throws SQLException {
		if (rs != null) {
			rs.close();
		}
		if (st != null) {
			st.close();
		}
	}
}
