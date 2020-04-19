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
<script src='${pageContext.request.contextPath}/plug-ins/echarts/china.js'></script>
<style type="text/css">
.border {
	border-radius: 1em;
}

 #main{
     width:102em;
     height:46em;
     margin-left: 7em;
}
/*默认长宽比0.75*/
#defaultForm{
    position: absolute;
	z-index: 9999;
	width: 36em;
	margin-left: 25px;
	margin-top: 6em;
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

          <div class="row" style="margin-top: 1em;">

            <!-- Area Chart -->
            <div class=" col-lg-12">
              <div class="card shadow mb-4">
		           	<center>
						<h3 style="margin-top: 1em;">全国新型冠状病毒感染的肺炎疫情数据</h3>
					</center>
					
					<form id="defaultForm" method="post" class="form-horizontal" action="target.php" >
						<label class="col-md-4"style="width: 40%;font-size: 18px;padding-top: 5px;font-family: serif; ">请选择查询日期:</label>
						<select class="col-md-4"style="height: 2.5em;border-radius: 8px;" id="day">
							<option value="2月1日">二月一号</option>
							<option value="2月2日">二月二号</option>
							<option value="2月3日">二月三号</option>
							<option value="2月4日">二月四号</option>
							<option value="2月5日">二月五号</option>
							<option value="2月6日">二月六号</option>
							<option value="2月7日">二月七号</option>
							<option value="2月8日">二月八号</option>
							<option value="2月9日">二月九号</option>
							<option value="2月10日">二月十号</option>
							<option value="2月11日">二月十一号</option>
							<option value="2月12日">二月十二号</option>
							<option value="2月13日">二月十三号</option>
							<option value="2月14日">二月十四号</option>
							<option value="2月15日">二月十五号</option>
							<option value="2月16日">二月十六号</option>
							<option value="2月17日">二月十七号</option>
						</select>
						<button type="button" class="btn col-md-2 btn-primary border col-md-offset-1" onclick="repaint()">查询</button>
					</form>
					<center>
					    <div id="main">
					 
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
		
		$.ajax({
			async:true,
			url:'${pageContext.request.contextPath}/mapServlet',
			data:{
				method:'getMapBeans'
			},
			success:function(res){
				var dataList = ""
				Data = res;
				for(var i=0;i<res.length;i++){
					if("2月1日"==res[i].day){
						dataList +='{"name":"'+res[i].province+'","value":'+res[i].diagnosis+'},';
					}
						
				}
				dataList = dataList.substring(0, dataList.length - 1);
				data = '[' + dataList + ']';
				var datas = JSON.parse(data);
				paintMap(datas);
			},
			dataType:"json"
		});
	});
	
	function repaint(){
		var day = $("#day").val();
		var dataList = "";
		for(var i=0;i<Data.length;i++){
			if(day==Data[i].day){
				console.log(Data[i].day)
				dataList +='{"name":"'+Data[i].province+'","value":'+Data[i].diagnosis+'},';
			}
		}
		dataList = dataList.substring(0, dataList.length - 1);
		data = '[' + dataList + ']';
		var datas = JSON.parse(data);
		paintMap(datas);
	}
	
    
/*         var dataList=[
            {name:"南海诸岛",value:0},
            {name: '北京', value: randomValue()},
            {name: '天津', value: randomValue()},
            {name: '上海', value: randomValue()},
            {name: '重庆', value: randomValue()},
            {name: '河北', value: randomValue()},
            {name: '河南', value: randomValue()},
            {name: '云南', value: randomValue()},
            {name: '辽宁', value: randomValue()},
            {name: '黑龙江', value: randomValue()},
            {name: '湖南', value: randomValue()},
            {name: '安徽', value: randomValue()},
            {name: '山东', value: randomValue()},
            {name: '新疆', value: randomValue()},
            {name: '江苏', value: randomValue()},
            {name: '浙江', value: randomValue()},
            {name: '江西', value: randomValue()},
            {name: '湖北', value: randomValue()},
            {name: '广西', value: randomValue()},
            {name: '甘肃', value: randomValue()},
            {name: '山西', value: randomValue()},
            {name: '内蒙古', value: randomValue()},
            {name: '陕西', value: randomValue()},
            {name: '吉林', value: randomValue()},
            {name: '福建', value: randomValue()},
            {name: '贵州', value: randomValue()},
            {name: '广东', value: randomValue()},
            {name: '青海', value: randomValue()},
            {name: '西藏', value: randomValue()},
            {name: '四川', value: randomValue()},
            {name: '宁夏', value: randomValue()},
            {name: '海南', value: randomValue()},
            {name: '台湾', value: randomValue()},
            {name: '香港', value: randomValue()},
            {name: '澳门', value: randomValue()}
        ] */
        
        function paintMap(dataList){
        	var myChart = echarts.init(document.getElementById('main'));
            function randomValue() {
                return Math.round(Math.random()*1000);
            }
            option = {
                tooltip: {
                        formatter:function(params,ticket, callback){
                            return params.seriesName+'<br />'+params.name+'：'+params.value
                        }//数据格式化
                    },
                visualMap: {
                    min: 0,
                    max: 2482,
                    left: 'left',
                    top: 'bottom',
                    text: ['高','低'],//取值范围的文字
                    inRange: {
                        color: ['rgba(252, 248, 227, 1)', 'rgba(255, 0, 13, 1)']//取值范围的颜色
                    },
                    show:true//图注
                },
                geo: {
                    map: 'china',
                    roam: false,//不开启缩放和平移
                    zoom:1.23,//视角缩放比例
                    label: {
                        normal: {
                            show: true,
                            fontSize:'10',
                            color: 'rgba(0,0,0,0.7)'
                        }
                    },
                    itemStyle: {
                        normal:{
                            borderColor: 'rgba(0, 0, 0, 0.2)'
                        },
                        emphasis:{
                            areaColor: '#F3B329',//鼠标选择区域颜色
                            shadowOffsetX: 0,
                            shadowOffsetY: 0,
                            shadowBlur: 20,
                            borderWidth: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                },
                series : [
                    {
                        name: '确诊人数',
                        type: 'map',
                        geoIndex: 0,
                        data:dataList
                    }
                ]
            };
            myChart.setOption(option);
//             myChart.on('click', function (params) {
//             	if(params.name=="广东"){
//             		window.location.href="${pageContext.request.contextPath}/guandon.jsp?day="+$("#day").val();
//             	}
                
//             });
     
          /*  setTimeout(function () {
                myChart.setOption({
                    series : [
                        {
                            name: '信息量',
                            type: 'map',
                            geoIndex: 0,
                            data:dataList
                        }
                    ]
                });
            },1000)*/
        }
        
    </script>
</body>

</html>