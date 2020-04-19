package hotword.domain;

public class DataBean {
	
	private long Newly_confirmed_cases;   //新增确诊病例
	private long New_severe_cases;   //新增重症病例
	private long New_deaths;   //新增死亡病例
	private long New_cured_discharge_cases;   //新增治愈出院病例
	private long New_suspected_cases;   //新增疑似病例
	private long Cumulative_reported_confirmed_cases;   //累计报告确诊病例
	private long Severe_cases;   //重症病例
	private long Cumulative_deaths;   //累计死亡病例
	private long Accumulative_cured_discharged_cases;   //累计治愈出院病例
	private long Cumulative_suspected_cases;   //累计疑似病例
	private long Close_contacts;   //累计追踪到密切接触者
	private long Under_medical_observation;   //正在接受医学观察人数
	private String day;   //日期
	private long number;   //治愈人数与死亡人数之差
	private double Severe_rate;	//重症率
	private double mortality;	//死亡率
	private double cure_rate;	//治愈率

	public long getNewly_confirmed_cases() {
		return Newly_confirmed_cases;
	}
	public void setNewly_confirmed_cases(long newly_confirmed_cases) {
		Newly_confirmed_cases = newly_confirmed_cases;
	}
	public long getNew_severe_cases() {
		return New_severe_cases;
	}
	public void setNew_severe_cases(long new_severe_cases) {
		New_severe_cases = new_severe_cases;
	}
	public long getNew_deaths() {
		return New_deaths;
	}
	public void setNew_deaths(long new_deaths) {
		New_deaths = new_deaths;
	}
	public long getNew_cured_discharge_cases() {
		return New_cured_discharge_cases;
	}
	public void setNew_cured_discharge_cases(long new_cured_discharge_cases) {
		New_cured_discharge_cases = new_cured_discharge_cases;
	}
	public long getNew_suspected_cases() {
		return New_suspected_cases;
	}
	public void setNew_suspected_cases(long new_suspected_cases) {
		New_suspected_cases = new_suspected_cases;
	}
	public long getCumulative_reported_confirmed_cases() {
		return Cumulative_reported_confirmed_cases;
	}
	public void setCumulative_reported_confirmed_cases(long cumulative_reported_confirmed_cases) {
		Cumulative_reported_confirmed_cases = cumulative_reported_confirmed_cases;
	}
	public long getSevere_cases() {
		return Severe_cases;
	}
	public void setSevere_cases(long severe_cases) {
		Severe_cases = severe_cases;
	}
	public long getCumulative_deaths() {
		return Cumulative_deaths;
	}
	public void setCumulative_deaths(long cumulative_deaths) {
		Cumulative_deaths = cumulative_deaths;
	}
	public long getAccumulative_cured_discharged_cases() {
		return Accumulative_cured_discharged_cases;
	}
	public void setAccumulative_cured_discharged_cases(long accumulative_cured_discharged_cases) {
		Accumulative_cured_discharged_cases = accumulative_cured_discharged_cases;
	}
	public long getCumulative_suspected_cases() {
		return Cumulative_suspected_cases;
	}
	public void setCumulative_suspected_cases(long cumulative_suspected_cases) {
		Cumulative_suspected_cases = cumulative_suspected_cases;
	}
	public long getClose_contacts() {
		return Close_contacts;
	}
	public void setClose_contacts(long close_contacts) {
		Close_contacts = close_contacts;
	}
	public long getUnder_medical_observation() {
		return Under_medical_observation;
	}
	public void setUnder_medical_observation(long under_medical_observation) {
		Under_medical_observation = under_medical_observation;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public long getNumber() {
		return number;
	}
	public void setNumber(long number) {
		this.number = number;
	}
	public double getSevere_rate() {
		return Severe_rate;
	}
	public void setSevere_rate(double severe_rate) {
		Severe_rate = severe_rate;
	}
	public double getMortality() {
		return mortality;
	}
	public void setMortality(double mortality) {
		this.mortality = mortality;
	}
	public double getCure_rate() {
		return cure_rate;
	}
	public void setCure_rate(double cure_rate) {
		this.cure_rate = cure_rate;
	}
}
