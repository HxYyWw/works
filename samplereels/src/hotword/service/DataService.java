package hotword.service;

import java.sql.SQLException;
import java.util.List;

import hotword.dao.VirusDao;
import hotword.domain.DataBean;

public class DataService {

	public List<DataBean> getDataBeans(){
		VirusDao dao = new VirusDao();
		List<DataBean> dataBeans = null;
		try {
			dataBeans = dao.getDataBeans();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		for (DataBean dataBean : dataBeans) {
			long severe_cases = dataBean.getSevere_cases();
			long cumulative_reported_confirmed_cases = dataBean.getCumulative_reported_confirmed_cases();
			long cumulative_deaths = dataBean.getCumulative_deaths();
			long accumulative_cured_discharged_cases = dataBean.getAccumulative_cured_discharged_cases();
			
			double severe_rate = 1.00000*severe_cases/(cumulative_reported_confirmed_cases-cumulative_deaths-accumulative_cured_discharged_cases);
			double mortality = 1.00000*cumulative_deaths/cumulative_reported_confirmed_cases;
			double cure_rate = 1.00000*accumulative_cured_discharged_cases/cumulative_reported_confirmed_cases;
			dataBean.setSevere_rate(severe_rate);
			dataBean.setMortality(mortality);
			dataBean.setCure_rate(cure_rate);
		}
		return dataBeans;
	}
	
}
