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



<style type="text/css">
.border {
	border-radius: 1em;
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
      <div id="content">


        <!-- Begin Page Content -->
        <div class="container-fluid">

          <div class="row" style="margin-top: 3em;">

            <!-- Area Chart -->
            <div class=" col-lg-12">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                 	<h3>信息领域热词查询</h3>
                </div>
                <!-- Card Body -->
                <div class="card-body">
					<form id="defaultForm" method="post" class="form-horizontal" action="target.php" style="margin: 3em;">
						<div class="form-group" style="margin-top: 4%;margin-left: 10%;">
						<label class="col-md-2 control-label col-md-offset-1 " style="font-size: 18px;padding-top: 5px;font-family: serif; ">信息领域热词:</label>
							<div class="col-md-3">
								<input type="text" class="form-control border search-input" autocomplete="true"
									placeholder="请输入热词" id="tag"   />
							</div>
							 <button type="button"
									class="btn col-md-2 btn-primary border" onclick="queryWord()">查询</button>
						</div>
					</form>
					
					<div id="show"  style="float:left;margin-left: 20%;width: 60%;border: 1px;margin-bottom: 2em;padding-bottom: 1em;display: none" class="border"  >
						<div style="padding-left: 1.5em;padding:0 0.8em;color: #428bca" id="hotwordName">
							
						</div>
						<div style="padding:1em;padding-top:0em;">
							<label style="font-size: 14px;padding-top: 5px;font-family: serif; line-height: 20px;"id="intro">
								
							</label>
						</div>
						<div style="padding:1em;padding-top:0em;">
							<label  style="font-size: 14px;width:11%;padding-top: 5px;font-family: serif;color: rgba(240, 45, 15, 1)" class="col-md-2">
								引用：
							</label>
							
							<label style="font-size: 14px;padding-top: 5px;font-family: serif;padding-left:0; color: #136ec2" class="col-md-10" id="whereUse">
								
							</label>
						</div>
					</div>
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