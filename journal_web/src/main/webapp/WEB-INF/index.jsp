<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  	<meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  	<meta name="apple-mobile-web-app-capable" content="yes">
  	<meta name="format-detection" content="telephone=no">
	<title>Journal</title>
	<link rel="stylesheet" href="./static/layui/css/layui.css">
	<link rel="stylesheet" href="./static/css/common.css">
	<link rel="stylesheet" href="./static/css/bootstrap.min.css"/>
	<link rel='stylesheet' href='./static/css/animate.min.css'>
	<link rel="stylesheet" href="./static/css/style.css">
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css'>
	<style> 
    html { 
        -webkit-filter: grayscale(100%); 
        -moz-filter: grayscale(100%); 
        -ms-filter: grayscale(100%); 
        -o-filter: grayscale(100%); 
        filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);  
        _filter:none; 
    	} 
   <!--网页变黑白色-->
	</style> 
	<script type="text/javascript">
	window.onload = function() { 
		var timer = document.getElementById("timer"); 
		setInterval(function() {  
		var time = new Date();  // 程序计时的月从0开始取值后+1  
		var m = time.getMonth() + 1;  
		var t = time.getFullYear() + "-" + m + "-"  
		+ time.getDate() + " " + time.getHours() + ":"  
		+ time.getMinutes() + ":" + time.getSeconds();  
		timer.innerHTML = t; 
		}, 1000); 
		};
		function search(){
			var keyword = $("#search").val();
			window.open("./article_search?title="+keyword);
		}
	</script>
</head>
<body>
	<header class="">
		<div><label>  </label></div>
		<nav>
		  <div class="menu-container">
		    <!-- Menu -->
		    <ul class="menu">
		      <li class="menu-apple">
		        <a href="#">
		          <img src="" />
		        </a>
		      </li>
		      <li class="menu-mac">
		        <a href="../journal_web/article_index">
		          <span>主页</span>
		        </a>
		      </li>
		      <li class="menu-iPad">
		        <a href="../journal_web/article_search">
		          <span>搜索</span>
		        </a>
		      </li>
		      <li class="menu-iPhone">
		        <a href="#">
		          <span>ITEM</span>
		        </a>
		      </li>
		      <li class="menu-watch">
		        <a href="#">
		          <span>ITEM</span>
		        </a>
		      </li>
		      <li class="menu-tv">
		        <a href="#">
		          <span>ITEM</span>
		        </a>
		      </li>
		      <li class="menu-support">
		        <a href="#">
		          <span>ITEM</span>
		        </a>
		      </li>
		      <li class="menu-search">
		        <a href="#">
		          <i class="fa fa-search" aria-hidden="true"></i>
		        </a>
		      </li>
		      <li class="menu-store">
		        <a href="../journal_web/to_admin">
		          <i class="fa fa-home" aria-hidden="true"></i>
		        </a>
		      </li>
		    </ul>
		    
		    <!-- Search -->
		    <div class="menu-search-container">
		      <div class="menu-search-input">
		      <form action="javascript:search();">
		        <a href="#" onclick="search()">
		          <i class="fa fa-search" aria-hidden="true" onclick="javascript:search();"></i>
		        </a>
		        <input class="menu-search-input" id="search" type="text" aria-label="搜索文章" placeholder="搜索文章" 
		        autocorrect="off" autocapitalize="off" autocomplete="off" spellcheck="false">
		      </form>
		      </div>
		      <a class="menu-search-close" href="#">
		        <i class="fa fa-close" aria-hidden="true"></i>
		      </a> 
		      <div class="search-sub-menu">
		      <h3>Quick Links</h3>
		      <ul>
		        <li><a href="#">Find a store</a></li>
		      </ul>
		    </div>
		    </div>
		   
		  </div>
		</nav>
	</header>

	<div class="layui-container">
		<div class="layui-row layui-col-space20">
			<div class="layui-col-md8">
				<div class="layui-row">
					<div class="layui-col-md12">
						<div class="layui-carousel" id="carousel">
					  		<div carousel-item>
					  			<c:forEach items="${periodicals}"  var="periodical">
							    <div>
							    	<a href="../journal_web/article_search?periodical_id=${periodical.periodical_id}" target="_blank">
							    		<img src="${periodical.cover_path}${periodical.cover_name }" width="100%" height="280"></img>
							    	</a>
							    </div>
							    </c:forEach>
					  		</div>
						</div>
					</div>
					<div class="layui-col-md12 margin20"></div>
					<div class="layui-col-md12">
						<div class="main zdbox">
							<div class="subject"><b>[置顶]</b><a href="javascript:;" title="用DTcms做一个独立博客网站（响应式模板）">这里可以写通知</a><em>2019-12-28 11:53:24 发布</em></div>
							<div class="content">xxxxxxxxxx</div>
						</div>
					</div>
					<div class="layui-col-md12 margin20"></div>
					<c:forEach items="${list}"  var="item">
					<div class="layui-col-md12 margin20"></div>
					<div class="layui-col-md12">
						<div class="main list">
							<div class="subject">
							<a href="javascript:;" class="caty">[hot]</a>
							<a href="../journal_web/article_content?articleId=${item.article_id}" title="${item.title }" target="_blank">${item.title }</a>
							<em>${item.time }发布</em>
							</div>
							<div class="content layui-row">
								<div class="layui-col-md4 list-img">
									<a href="../journal_web/article_content?articleId=${item.article_id}" target="_blank"><img src="${item.cover_path}${item.cover_name }"></a>
								</div>
								<div class="layui-col-md8">
									<div class="list-text">
										<a href="../journal_web/article_content?articleId=${item.article_id}" target="_blank">
											${item.summary}
										</a>
									</div>
									
								</div>
							</div>
							<div class="layui-col-md12">
							<div class="list-stat layui-row">

										<div class="layui-col-xs3 layui-col-md3 Label">
											
											<em>[关键词]</em>
											<a href="../journal_web/article_search?keyword=${item.keyword}" class="like" target="_blank">${item.keyword }</a>
										</div>

										<div class="layui-col-xs3 layui-col-md3">
											
											<em>[作者]</em>
											<a href="../journal_web/article_search?user_id=${item.user.user_id }" class="like" target="_blank">${item.author }</a>
										</div>

										<div class="layui-col-xs3 layui-col-md3">
											
											<em>[期刊]</em>
											<a href="../journal_web/article_search?periodical_id=${item.periodical_id }" class="like" target="_blank">x${item.periodical.periodical_title }</a>
										</div>

										<div class="layui-col-xs3 layui-col-md3 alink" style="text-align: right;">
											<a href="../journal_web/article_content?articleId=${item.article_id}" target="_blank" class="layui-btn layui-btn-xs">阅读原文</a>
										</div>
									</div>
							</div>
						</div>
					</div>
					</c:forEach>
					<div class="layui-col-md12 margin20"></div>
					<div class="layui-col-md12" id="pages"></div>
				</div>
	        </div>
	        <aside class="sidebar">
	          <div class="fixed">
	            <div class="widget widget-tabs">
	              <ul class="nav nav-tabs" role="tablist">
	                <li role="presentation" class="active"><a href="#notice" aria-controls="notice" role="tab" data-toggle="tab">网站公告</a></li>
	                <li role="presentation"><a href="#centre" aria-controls="centre" role="tab" data-toggle="tab">会员中心</a></li>
	                <li role="presentation"><a href="#contact" aria-controls="contact" role="tab" data-toggle="tab">联系站长</a></li>
	              </ul>
	              <div class="tab-content">
	                <div role="tabpanel" class="tab-pane notice active" id="notice">
	                  <ul>
	                    <li>
	                      <time datetime="2016-01-04">01-04</time>
	                      <a href="" target="_blank">欢迎访问XX学报</a></li>
	                    <li>
	                      <time datetime="2016-01-04">01-04</time>
	                      <a target="_blank" href="">在这里可以看到最新最全的学报信息</a></li>
	                    <li>
	                      <time datetime="2016-01-04">01-04</time>
	                      <a target="_blank" href="">在这个小工具中最多可以调用五条</a></li>
	                  </ul>
	                </div>
	                <div role="tabpanel" class="tab-pane centre" id="centre">
	                	<c:if test="${empty sessionScope.user}">
	                  <h4>需要登录才能进入会员中心</h4>
	                  <p> <a data-toggle="modal" class="btn btn-primary" href="../journal_web/to_login">立即登录</a> <a href="javascript:;" class="btn btn-default">现在注册</a> </p>
	                	</c:if>
	                	<c:if test="${not empty sessionScope.user}">
	                  <p style="text-align: left;">name:${sessionScope.user.name}</p><br>
	                   <p style="text-align: left;">tel:${sessionScope.user.tel}</p><br>
	                  <p> <a data-toggle="modal" class="btn btn-primary" href="../journal_web/to_admin">个人空间</a> </p>
	                	</c:if>
	                </div>
	                <div role="tabpanel" class="tab-pane contact" id="contact">
	                  <h2>Email:<br />
	                    <a href="mailto:renxuan.com" data-toggle="tooltip" data-placement="bottom" title="壬玄">壬玄</a></h2>
	                </div>
	              </div>
	            </div>
	            <div class="widget widget_search">
	              <form class="navbar-form" action="javascript:search();" method="post">
	                <div class="input-group">
	                  <input type="text" name="keyword" class="form-control" size="35" placeholder="请输入关键字" maxlength="15" autocomplete="off">
	                  <span class="input-group-btn">
	                  <button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
	                  </span> </div>
	              </form>
	            </div>
	          </div>
	          <div class="widget widget_sentence">
	            <h3>每日最热</h3>
	            <div class="widget-sentence-content">
	              <h4 id="timer">2019年12月05日星期二</h4>
	              <p>xxxxxxxxxxxxxxxxxxx</p>
	            </div>
	          </div>
	          <div class="widget widget_hot">
	            <h3>热门文章</h3>
	            <ul>
	            	<c:forEach items="${recommend}" var="recom">
	              <li>
	              	<a href="../journal_web/article_content?articleId=${recom.article_id}" title="${recom.title }" target="_blank">
	              		<span class="thumbnail">
	              			<img class="thumb" data-original="${recom.cover_path}${recom.cover_name }" src="${recom.cover_path}${recom.cover_name }" alt="">
	              		</span>
	              		<span class="text">${recom.title}</span>
	              		<span class="muted">
	              			<em>[作者]</em>
	              			<i class="">${recom.author}</i>
	              		</span>
	              		<br>
	              		<span class="muted" style="text-align: right;">
	              		<em>[关键词]</em>
	              			<i class="">${recom.keyword}</i>
	              		</span>
	              	</a>
	              </li>
	              </c:forEach>
	            </ul>
	          </div>
	        </aside>
		</div>
	</div>

	<!-- 尾部 -->
	<div class="footer"></div>
	<footer class="layui-bg-cyan">
		<div class="layui-container">
			<div class="layui-row">
				<p>@renxuan</p>
			</div>
		</div>
	</footer>
</body>
<script src="./static/layui/jquery-2.1.4.min.js"></script>
<script src="./static/layui/jquery.lazyload.min.js"></script>
<script src="./static/layui/jquery.ias.js"></script>
<script src="./static/layui/layui.all.js"></script>
<script src="./static/layui/bootstrap.min.js"></script>
<script src="./static/layui/script.js"></script>
</html>
