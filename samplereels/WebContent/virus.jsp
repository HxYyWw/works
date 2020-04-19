<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的个人作品集</title>
  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./plug-ins/css/font-awesome.min.css">
<link
	href="${pageContext.request.contextPath}/plug-ins/css/bootstrap.css"
	rel="stylesheet">

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="${pageContext.request.contextPath}/plug-ins/js/jquery-1.10.2.min.js"></script>

<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="${pageContext.request.contextPath}/plug-ins/js/bootstrap.js"></script>
	  <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/plug-ins/jquery/jquery-ui.css">

<script src='${pageContext.request.contextPath}/plug-ins/echarts/echarts.js'></script>

<style type="text/css">
.border {
	border-radius: 1em;
}

#content{
/* 	width:80em; */
	height: 34em;
/* 	margin-left:15em; */
/* 	float: left; */
}
</style>
<script type="text/javascript">

$(function() {
	var data = "";
	$.ajax({
		async : true,
		url : "${pageContext.request.contextPath}/hotwordServlet",
		data : {
			method : "getHotwordBeans",
		},
		success : function(res) {
			data = res;
			// 				alert(data);
			addCorpName(data);
		},
		dataType : "json"
	});

});

function addCorpName(data) {

	var availableTags = new Array();
	for (var i = 0; i < data.length; i++) {
		availableTags[i] = data[i].name;
	}
	console.log(availableTags);
	$("#tag").autocomplete({
		source : availableTags
	});
}

function queryWord(){
	var hotwordname = $("#tag").val();
	$.ajax({
		async : true,
		url : "${pageContext.request.contextPath}/hotwordServlet",
		data : {
			method : "getHotwordBean",
			name:hotwordname
		},
		success : function(res) {
			
			$("#hotwordName").html('<a href="'+res.url+'"><h3>'+res.name+'</h3></a>');
			$("#intro").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+res.intro);
			queryWordUse(hotwordname)
		},
		dataType : "json"
	});
}

function queryWordUse(hotwordname){
	$.ajax({
		async : true,
		url : "${pageContext.request.contextPath}/hotwordServlet",
		data : {
			method : "getHotwordSearchBeans",
			name:hotwordname
		},
		success : function(res) {
			content = ""
			for(var i=0;i<res.length;i++){
				content+='<a href="'+res[i].href+'">'+res[i].name+'</a>、'
			}
			content = content.substring(0,content.length-1);
			$("#whereUse").html(content);
			$("#show").fadeIn(1500);
		},
		dataType : "json"
	});
}

</script>
</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">我的个人作品集</div>
      </a>

      <!-- Divider -->

      <!-- Heading -->
      <div class="sidebar-heading">
    	   <h5>信息领域热词分析</h5>
      </div>

<li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/index.jsp">
          <i class="fas fa-fw fa-cog"></i>
          <span>信息领域热词</span>
        </a>
<!--         <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar"> -->
<!--           <div class="bg-white py-2 collapse-inner rounded"> -->
<!--             <h6 class="collapse-header">信息领域热词类别:</h6> -->
<%--             <a class="collapse-item" href="${pageContext.request.contextPath}/index.jsp">人物</a> --%>
<%--             <a class="collapse-item" href="${pageContext.request.contextPath}/index.jsp">科技专词</a> --%>
<%--             <a class="collapse-item" href="${pageContext.request.contextPath}/index.jsp">流行热词</a> --%>
<!--           </div> -->
<!--         </div> -->
      </li>


			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ciyun.jsp">
					<i class="fa fa-jsfiddle" aria-hidden="true"></i> <span>信息领域热词词云</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">
			<!-- Heading -->
			<div class="sidebar-heading">
				<h5>北京信件</h5>
			</div>


			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/yearmail.jsp">
					<i class="fas fa-fw fa-chart-area"></i> <span>每年信访量</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/typemail.jsp">
					<i class="fa fa-pie-chart" aria-hidden="true"></i> <span>每种类型信件量</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/sectionmail.jsp">
					<i class="fa fa-bar-chart" aria-hidden="true"></i> <span>各部门处理信件量</span>
			</a></li>
			
			<!-- Divider -->
			<hr class="sidebar-divider">
			<!-- Heading -->
			<div class="sidebar-heading">
				<h5>新型冠状病毒疫情情况</h5>
			</div>


			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/virus.jsp">
					<i class="fa fa-heartbeat" aria-hidden="true"></i> <span>疫情状况数据表</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/china.jsp">
					<i class="fa fa-ravelry" aria-hidden="true"></i> <span>全国疫情状况图</span>
			</a></li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>
    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="mycontent">


        <!-- Begin Page Content -->
        <div class="container-fluid">

          <div class="row" style="margin-top: 3em;">

            <!-- Area Chart -->
            <div class=" col-lg-12">
              <div class="card shadow mb-4">
		            <center>
						<h3 style="margin-top: 1.5em;">全国新型冠状病毒感染的肺炎疫情数据</h3>
					</center>
					<form id="defaultForm" method="post" class="form-horizontal" action="target.php" style="margin: 3em;">
						<button type="button" class="btn col-md-2 btn-primary border col-md-offset-2" onclick="repaintIn()">每日新增情况</button>
						<button type="button" class="btn col-md-2 btn-primary border col-md-offset-1" onclick="repaintCu()">累计疫情情况</button>
						<button type="button" class="btn col-md-2 btn-primary border col-md-offset-1" onclick="repaintCare()">死亡率，治愈率，重症率</button>
					</form>
					
					<center>
						<div id='content' style="margin-top: 0em;">
						
						</div>
					</center>
              </div>
            </div>

          </div>

		</div>
	 </div>
	</div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>

<script
	src="${pageContext.request.contextPath}/plug-ins/jquery/jquery-1.12.1.js"></script>
<script
	src="${pageContext.request.contextPath}/plug-ins/jquery/jquery-ui.js"></script>


<script type="text/javascript">

$(function(){
	dom = document.getElementById('content');
	myChart = echarts.init(dom);
	Newly_confirmed_cases=['新增确诊病例'];   //新增确诊病例
	New_severe_cases=['新增重症病例'];   //新增重症病例
	New_deaths=['新增死亡病例'];   //新增死亡病例
	New_cured_discharge_cases=['新增治愈出院病例'];   //新增治愈出院病例
	New_suspected_cases=['新增疑似病例'];   //新增疑似病例
	day=['日期']
	
	Cumulative_reported_confirmed_cases=['累计报告确诊病例'];   //累计报告确诊病例
	Severe_cases=['现有重症病例'];   //现有重症病例
	Cumulative_deaths=['累计死亡病例'];   //累计死亡病例
	Accumulative_cured_discharged_cases=['累计治愈出院病例'];   //累计治愈出院病例
	Cumulative_suspected_cases=['累计疑似病例'];   //累计疑似病例
	Close_contacts=['累计追踪到密切接触者'];   //累计追踪到密切接触者
	Under_medical_observation=['正在接受医学观察人数'];   //正在接受医学观察人数
	
	
	Severe_rate=['重症率'];	//重症率
	mortality=['死亡率'];	//死亡率
	cure_rate=['治愈率'];	//治愈率
	
	
	$.ajax({
		async:true,
		url:'${pageContext.request.contextPath}/dataServlet',
		data:{
			method:'getDataBeans'
		},
		success:function(res){
				for(var i=0;i<res.length;i++){
					Newly_confirmed_cases.push(res[i].Newly_confirmed_cases);
					New_severe_cases.push(res[i].New_severe_cases);
					New_deaths.push(res[i].New_deaths);
					New_cured_discharge_cases.push(res[i].New_cured_discharge_cases);
					New_suspected_cases.push(res[i].New_suspected_cases);
					day.push(res[i].day);
					
					
					Cumulative_reported_confirmed_cases.push(res[i].Cumulative_reported_confirmed_cases);   //累计报告确诊病例
					Severe_cases.push(res[i].Severe_cases);   //现有重症病例
					Cumulative_deaths.push(res[i].Cumulative_deaths);   //累计死亡病例
					Accumulative_cured_discharged_cases.push(res[i].Accumulative_cured_discharged_cases);   //累计治愈出院病例
					Cumulative_suspected_cases.push(res[i].Cumulative_suspected_cases);   //累计疑似病例
					Close_contacts.push(res[i].Close_contacts);   //累计追踪到密切接触者
					Under_medical_observation.push(res[i].Under_medical_observation);   //正在接受医学观察人数
					
					
					Severe_rate.push(res[i].Severe_rate);	//重症率
					mortality.push(res[i].mortality);	//死亡率
					cure_rate.push(res[i].cure_rate);	//治愈率
				}
				console.log(Newly_confirmed_cases);
				console.log(New_severe_cases);
				console.log(New_deaths);
				console.log(New_cured_discharge_cases);
				console.log(New_suspected_cases);
				console.log(day);
				paint(myChart,Newly_confirmed_cases,New_severe_cases,New_deaths,New_cured_discharge_cases,New_suspected_cases,day)
		},
		dataType:"json"
	});
	
	
	myChart.showLoading();
	
	
	
});


function paint(myChart,Newly_confirmed_cases,New_severe_cases,New_deaths,New_cured_discharge_cases,New_suspected_cases,day){
	
   var  option = {
            legend: {},
            tooltip: {
                trigger: 'axis',
//                 showContent: false
            },
            dataset: {
                source: [
                    day,New_deaths,New_severe_cases,Newly_confirmed_cases,New_cured_discharge_cases,New_suspected_cases
                ]
            },
            xAxis: {type: 'category'},
            yAxis: {gridIndex: 0,min:-700},
//             grid: {top: '55%'},
            series: [
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
               
            ]
        };

	 myChart.setOption(option);
	 myChart.hideLoading();
}

function repaintIn(){
	myChart.clear();
	myChart.showLoading();
	var option = {
            legend: {},
            tooltip: {
                trigger: 'axis',
//                 showContent: false
            },
            dataset: {
                source: [
                    day,New_deaths,New_severe_cases,Newly_confirmed_cases,New_cured_discharge_cases,New_suspected_cases
                ]
            },
            xAxis: {type: 'category'},
            yAxis: {gridIndex: 0,min:-700},
//             grid: {top: '55%'},
            series: [
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
               
            ]
        };

	 myChart.setOption(option);
	 myChart.hideLoading();
}

function repaintCu(){
	myChart.clear();
	myChart.showLoading();
	var option = {
            legend: {},
            tooltip: {
                trigger: 'axis',
//                 showContent: false
            },
            dataset: {
                source: [
                    day,Cumulative_deaths,Severe_cases,Accumulative_cured_discharged_cases,Cumulative_suspected_cases,Cumulative_reported_confirmed_cases,Under_medical_observation,Close_contacts
                ]
            },
            xAxis: {type: 'category'},
            yAxis: {gridIndex: 0},
//             grid: {top: '55%'},
            series: [
                {type: 'bar', smooth: true, seriesLayoutBy: 'row'},
                {type: 'bar', smooth: true, seriesLayoutBy: 'row'},
                {type: 'bar', smooth: true, seriesLayoutBy: 'row'},
                {type: 'bar', smooth: true, seriesLayoutBy: 'row'},
                {type: 'bar', smooth: true, seriesLayoutBy: 'row'},
                {type: 'bar', smooth: true, seriesLayoutBy: 'row'},
                {type: 'bar', smooth: true, seriesLayoutBy: 'row'},
               
            ]
        };

	 myChart.setOption(option);
	 myChart.hideLoading();
}

function repaintCare(){
	myChart.clear();
	myChart.showLoading();
	var option = {
            legend: {},
            tooltip: {
                trigger: 'axis',
//                 showContent: false
            },
            dataset: {
                source: [
                    day,mortality,Severe_rate,cure_rate
                ]
            },
            xAxis: {type: 'category'},
            yAxis: {gridIndex: 0},
//             grid: {top: '55%'},
            series: [
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
                {type: 'line', smooth: true, seriesLayoutBy: 'row'},
            ]
        };

	 myChart.setOption(option);
	 myChart.hideLoading();
}

</script>
</body>

</html>