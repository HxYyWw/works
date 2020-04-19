<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的个人作品集</title>
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

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
<script
	src='${pageContext.request.contextPath}/plug-ins/echarts/echarts.js'></script>
<script
	src='${pageContext.request.contextPath}/plug-ins/echarts/china.js'></script>
<script
	src='${pageContext.request.contextPath}/plug-ins/echarts/echarts-wordcloud.js'></script>
<style type="text/css">
.border {
	border-radius: 1em;
}
</style>
<script type="text/javascript">

$(function(){
	
	$.ajax({
		async : true,
		url : "${pageContext.request.contextPath}/mailServlet",
		data : {
			method : "getSectionMailBeans",
		},
		success : function(res) {
			console.log(res);
			var type = []
			var datas = []
			var section = ['部门']
			var value = ["信件量"]
			for(var i=0;i<res.length;i++){
				section.push(res[i].name);
				value.push(res[i].value);
				item={}
				item["name"]=res[i].name
				item["value"]=res[i].value
				datas.push(item)
			}
			console.log(section)
			paint1(section,datas)
			paint(section,value)
		},
		dataType : "json"
	});
	
	
    
});

function paint(section,value){
	option = {
            legend: {},
            tooltip: {
                trigger: 'axis',
//                 showContent: false
            },
            dataset: {
                source: [
                    section,value,value
                ]
            },
            xAxis: {type: 'category'},
            yAxis: {gridIndex: 0},
            series: [
                {type: 'bar', smooth: true, seriesLayoutBy: 'row'},
                {type: 'line', smooth: true, seriesLayoutBy: 'row'}
         
            ]
        };

      
	var myChart = echarts.init(document.getElementById('main'));
	
	 myChart.setOption(option);
}


function paint1(type,value){
	console.log(value)
	option = {
		    tooltip: {
		        trigger: 'item',
		        formatter: '{a} <br/>{b} : {c} ({d}%)'
		    },
		    legend: {
		        // orient: 'vertical',
		        // top: 'middle',
		        bottom: 10,
		        left: 'center',
		        data: type
		    },
		    series: [
		        {
		            type: 'pie',
		            radius: '65%',
		            center: ['50%', '50%'],
		            selectedMode: 'single',
		            data:value,
		            emphasis: {
		                itemStyle: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
	var myChart = echarts.init(document.getElementById('main1'));
	
	 myChart.setOption(option);
}

</script>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.html">
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

			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">
					<i class="fa fa-graduation-cap" aria-hidden="true"></i> <span>信息领域热词</span>
			</a></li>

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
			<div id="content">


				<!-- Begin Page Content -->
				<div class="container-fluid">

					<div class="row" style="margin-top: 3em;">

						<!-- Area Chart -->
						<div class=" col-lg-12">
							<div class="card shadow mb-4">
								<!-- Card Body -->
								<div class="card-body">
									<center>
										<h3>各部门处理信件量</h3>
									</center>
										<div id="main" style="width: 50%; float:left; height: 585px"></div>
										<div id="main1" style="width: 50%; float:left; height: 585px"></div>
								</div>
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
</body>

</html>