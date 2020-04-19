package hotword.domain;

public class MyBean {

	private long Newly_confirmed_cases;   //新增确诊病例
	private long New_deaths;   //新增死亡病例
	private long New_cured_discharge_cases;   //新增治愈出院病例
	private long Cumulative_reported_confirmed_cases;   //累计报告确诊病例
	private long Severe_cases;   //重症病例
	private long Critical_cases;	//危重诊案例
	private long Cumulative_deaths;   //累计死亡病例
	private long suspected_cases;   //疑似病例
	private long Accumulative_cured_discharged_cases;   //累计治愈出院病例
	private long Under_medical_observation;   //正在接受医学观察人数
	private String day;   //日期
	private long number;   //治愈人数与死亡人数之差
	private double Severe_rate;	//重症率
	private double mortality;	//死亡率
	private double cure_rate;	//治愈率
	private double Critical_rate;	//危重诊率
	
	
	public long getNewly_confirmed_cases() {
		return Newly_confirmed_cases;
	}
	public void setNewly_confirmed_cases(long newly_confirmed_cases) {
		Newly_confirmed_cases = newly_confirmed_cases;
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
	public long getCritical_cases() {
		return Critical_cases;
	}
	public void setCritical_cases(long critical_cases) {
		Critical_cases = critical_cases;
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
