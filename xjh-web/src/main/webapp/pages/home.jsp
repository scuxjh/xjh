<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 引入所有得标签库 TagLib 并且设置上下文路径 --%>
<%//@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 放置contextPath作用，其他得页面直接可以拿到放置contextPath，不需要再重复定义一个--%>
<%pageContext.setAttribute("contextPath", request.getContextPath());%>
<!DOCTYPE html>
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<html lang="zh-CN">
<head>
  <title>社区民主问政互动平台</title>
  <!-- 20160905nt-->
  	<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css" />-->
  		<link rel="stylesheet" href="${contextPath}/lib/bootstrap/css/bootstrap.min.css" />
  		<link rel="stylesheet" href="${contextPath}/css/koala.css"/>
  		 <link rel="stylesheet" href="${contextPath}/lib/bootstrap/css/wenjuan.css"/>
  		
  		<link rel="stylesheet" href="${contextPath}/css/koala.css"/>
  		<!--
  		<link rel="stylesheet" href="${contextPath}/css/login.css"/>
  		<link rel="stylesheet" href="${contextPath}/css/main-student.css"/>
  		<link rel="stylesheet" href="${contextPath}/css/koala-tree.css"/>
  		<link rel="stylesheet" href="${contextPath}/css/security.css"/>
  		<link rel="stylesheet" href="${contextPath}/css/organisation.css"/>
  		<link rel="stylesheet" href="${contextPath}/lib/validateForm/css/style.css"/>
  		<link rel="stylesheet" href="${contextPath}/lib/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
  		<link rel="stylesheet" href="${contextPath}/css/index-student.css"/>
  		-->
 
    <style>
    	/*修改导航栏字体样式 20171203nt*/
    	.navbar-default .navbar-nav>li>a {
    		color: #000;
    		font-size: 25px;
		}
        .nav-stacked .node ul{
            display:none;
        }
        .first-level-menu li>a{
        	color:#f0f0f0;
        }
        .first-level-menu>li>a.active{
        	background: rgba(0, 0, 0, 0.3);
        }
        .second-level-menu>li>a.active{
        	background: rgba(0, 0, 0, 0.2);
        }
        .first-level-menu>li>a{
        	color: #f0f0f0;
        	/*background: rgba(0, 0, 0, 0.3);*/
        }
        .second-level-menu>li>a{
        	color: #f0f0f0;
        	background: rgba(0, 0, 0, 0.2);
        }
        .first-level-menu>li>a:hover{
        	color: #f0f0f0;
        	background: rgba(0, 0, 0, 0.1);
        }
        .second-level-menu>li>a:hover{
        	color: #f0f0f0;
        	background: rgba(0, 0, 0, 0.3);
        }
        .first-level-menu>li>a{
        	/*color: black;*/
        	/*background: rgba(0, 0, 0, 0.3);*/
        }
        /*
        .navbar-default .navbar-nav>li>a:hover{
        	background: rgba(0, 0, 0, 0.3);
        }*/
        .navbar-nav>li:hover{
        	background: rgba(0, 0, 0, 0.1);
        	/*background: ##428BCA;*/
        	/*background: #6082F9;*/
        }
        
        .carousel-inner2{
        	position: relative;
        	top: 200px;
        	
        }
        .carousel-control2{
        	position: relative;
        	top: 50px;
        }
        .slide2{
        	position: relative;
        	top: 50px;
        }
        .carousel-caption{
        	height: 100px;
        	top: 50%;
        	margin-top: -80px;
        }
        .navbar-brand{
        	font-size: x-large;
        }
        h1{
        	font-size: 64px;
        }
        p.profile{
        	font-size: 22px;
        }
        .g-foot{
        	background-color: #f8f8f8;
    		border-color: #e7e7e7;
        }
    </style>
</head>
<body>
    <!-- 
	<div class="g-head" style="background-color:#F6F6F6;display:block;">
	    <nav class="navbar navbar-default navbar-fixed-top" style="padding-right:15px;">
	        <a class="navbar-brand" href="">
	        	<span style="font-weight:800;">肖家河社区系统</span>
	        </a>
	    </nav>
	</div>end of div g-head. -->
	<nav class="navbar navbar-default navbar-fixed-top" style="color:black;">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#" title="科技惠民技术研发项目" style="color: #000;font-size: 30px;">社区民主问政互动平台</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
          		<ul class="nav navbar-nav navbar-right">
            		<li class="active" data-target="#carousel-example-generic" data-slide-to="0" name="navbarItem"><a href="#">首页</a></li>
            		<li data-target="#carousel-example-generic" data-slide-to="1" name="navbarItem"><a href="#">社区新闻</a></li>
            		<li data-target="#carousel-example-generic" data-slide-to="2" name="navbarItem"><a href="#">发展献策</a></li>
            		<li data-target="#carousel-example-generic" data-slide-to="3" name="navbarItem"><a href="#">问题反映</a></li>
            		<li data-target="#carousel-example-generic" data-slide-to="4" name="navbarItem"><a href="#">问卷调查</a></li>
            <!-- 
            <li class="dropdown">
              			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
             -->
          	</ul>
        </div>
		</div>
	</nav>
	<%-- 中间 --%>
	<div id="mainContainer" style="min-height:650px;display:block;margin-top:70px;"><!--  -->
	  <div id="itemHtml"></div>
	  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <!-- <img src="../images/community.jpg" alt="../images" style="width:100%;height:650px;">
       20181110-->
      <img src="./images/community.jpg" alt="../images" style="width:100%;height:650px;">
      <div class="carousel-caption" style="padding-top:-100px;">
      	<h1 title="科技惠民技术研发项目">社区民主问政互动平台</h1>
      	<p class="profile">科技惠民技术研发项目，成都市科学技术局立项资助。</p>
      	<p>
      		<button type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off" style="margin-left:50%;" onclick="viewProfile();">
  				详情>>
			</button>
		</p>
      </div>
    </div>
    <div class="item">
      <img src="./images/news.jpg" alt="./images" style="width:100%;height:650px;">
      <div class="carousel-caption">
      	<h1>社区工作我监督</h1>
      	<p class="profile">提供街道办院落信息、最新新闻、工作情况等社区及国内外新闻</p>
      	<p>
      		<button type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off" style="margin-left:50%;" onclick="showDetail(1);">
  				详情>>
			</button>
		</p>
      </div>
    </div>
    <div class="item">
      <img src="./images/policy.jpg" alt="../images" style="width:100%;height:650px;">
      <div class="carousel-caption">
        <h1>社区发展我献策</h1>
      	<p class="profile">提供街道办、社区、院落最新整改工程、发展信息，供各院落或指定社区院落居民查阅，收集居民针对各整改工程的反馈信息。</p>
      	<p>
      		<button type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off" style="margin-left:50%;" onclick="showDetail(2);">
  				详情>>
			</button>
		</p>
      </div>
    </div>
    <div class="item">
      <img src="./images/feed.jpg" alt="社区问题我反映" style="width:100%;height:650px;">
      <div class="carousel-caption">
        <h1>社区问题我反映</h1>
      	<p class="profile">提供平台供各社区院落居民对本院落、社区、街道办的各类问题进行反映。</p>
      	<p>
      		<button type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off" style="margin-left:50%;" onclick="giveMessage();">
  				详情>>
			</button>
		</p>
      </div>
    </div>
    <div class="item">
      <img src="./images/questionanswer.jpg" alt="./images" style="width:100%;height:650px;">
      <div class="carousel-caption">
        <h1>社区建设我做主</h1>
      	<p class="profile">提供问卷调查、投票信息供社区居民进行投票式意见反馈或选举。</p>
      	<p>
      		<button type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off" style="margin-left:50%;" onclick="showDetail(4);">
  				详情>>
			</button>
		</p>
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	</div>
    <%-- 底部 --%>
	<div id="footer" class="g-foot" style="display:block;margin-top:30px;"><span style="display:block;text-align:center;">Copyright &copy; 2018, 四川大学计算机学院. All rights reserved.</span></div>
  
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="${contextPath}/lib/jquery-1.8.3.min.js"></script>
  <script src="${contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
  <!-- koala js -->
  <script src="${contextPath}/lib/koala-ui.plugin.js"></script>
  <script src="${contextPath}/lib/koala-tree.js"></script>
  <!-- 20171202nt -->
  <script src="${contextPath}/js/domain/taskOperate.js"></script>
  <script  src="${contextPath}/js/domain/initQuestionnaire.js"></script>
  <script src="${contextPath}/lib/respond.min.js"></script>
  <script src="${contextPath}/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
  <script src="${contextPath}/lib/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
  <!-- validate
  <script src="${contextPath}/lib/validate.js"></script>
  <script src="${contextPath}/lib/validateForm/validateForm.js"></script>
   -->
  <!-- security
  <script src="${contextPath}/js/security/role.js" ></script>
  <script src="${contextPath}/js/security/user.js" ></script>
   -->
  <!-- 20160902nt
  <script src="${contextPath}/js/home/index-student.js"></script>
  <script src="${contextPath}/js/home/abc.js"></script>
   -->
</body>
</html>
<script>
var contextPath = '${pageContext.request.contextPath}';
//全局变量保存走马灯内容。20170915pm
var carouselContent = null;
//20160711nt 全局变量，表格Grid各列的宽度值。
var col_mini = "25px";
var col_xs = "30px";//超小
var col_sm = "70px";//小
var col_md = "100px";//中等
var col_lg = "120px";//大
$(function(){
	carouselContent = $('#mainContainer').children();
	$('[name="navbarItem"]').on('click', function(){
		//console.log("navbarItem on click.");
		$('#itemHtml').hide();
		$('#carousel-example-generic').show();
	});
/*
	$('[data-toggle="tooltip"]').tooltip();//must initialize this yourself.
		var self = $(this);
		
		$('#mainArea').find('li').on('click', function(){
			self.trigger($(this).data('target'));
		});
		$("#mainContainer").append($("#classArea"));
*/
});//end of $function.
$(function(){
 	//$("#userInfo").text(' ${curSubject.name}');
});
/**
 * “社区问题我反映”提示。
   @param
   @version
       20171203nt
       1.new.
 */
var giveMessage = function(){
	var url = contextPath + "/pages/common/template/ModalDialog-template-md.jsp";
    $.get(url).done(function(html){
    	var $dialog = $(html);
    	$dialog.find(".modal-body").html("<p>请打开微信扫一扫，扫描二维码留言</p>"+"<p><img src='./images/QRCode.png' alt='ORCode.png' style='height:200px;width:200px;'></p>");
    	$dialog.modal({
    		keyboard:false
    	}).on({
    	    'hidden.bs.modal': function(){$(this).remove();}
    	});
    	initViewMode($dialog);
    	$dialog.find(".modal-title").html("微信扫一扫留言");
	});
};//End of function viewProfile.
/**
 * 查看“科技惠民技术研发项目”详情介绍。
   @param
   @version
       20171203pm
       1.new.
 */
var viewProfile = function(){
	var url = contextPath + "/pages/common/template/ModalDialog-template-full.jsp";
    $.get(url).done(function(html){
    	var $dialog = $(html);
    	$dialog.find("form").html("社区民主问政互动平台作为成都市科学技术局立项资助的科技惠民技术研发项目，符合国家、省、市经济社会发展战略和相关产业政策，重点围绕城乡发展、人口健康、生态环境、公共安全等与社会发展密切相关领域的重大科技需求，实施科技惠民技术研发和应用示范工程，不断推动科技创新支撑城乡建设和管理、科技成果惠及城乡居民生活。");
    	$dialog.modal({
    		keyboard:false
    	}).on({
    	    'hidden.bs.modal': function(){$(this).remove();}
    	});
    	initViewMode($dialog);
    	$dialog.find(".modal-title").html("社区民主问政互动平台");
	});
};//End of function viewProfile.
/**
 * 显示每个模块详情页面
   1 社区新闻；2 发展献策；3 问题反映；4 问卷调查
   20170915pm
       1.修改每个场景详情显示方式；
 */
var showDetail = function(type){
	//console.log("11,in showDetail,type:"+type);
	carouselContent.hide();
	//显示社区新闻
	if(type==1){
	//var url = '/pages/domain/news/news-list.jsp';
	var url = contextPath + '/pages/domain/news/news-list.jsp';//20181110pm
	var $listHtml = null;
	$.get(url).done(function(newsListHtml){
		$listHtml = $(newsListHtml);
		$('#itemHtml').show().html($listHtml);
	});
	}
	//显示发展献策
	else if(type==2){
		var url = contextPath + '/pages/domain/feed/feed-list.jsp';
		var $listHtml = null;
		$.get(url).done(function(newsListHtml){
			$listHtml = $(newsListHtml);
			$('#itemHtml').show().html($listHtml);
		});
		}
	else if(type==4){
		var url = contextPath + '/pages/domain/questionnaire/questionnaire-list.jsp';
		var $listHtml = null;
		$.get(url).done(function(newsListHtml){
			$listHtml = $(newsListHtml);
			$('#itemHtml').show().html($listHtml);
		});
		}
};
</script>
