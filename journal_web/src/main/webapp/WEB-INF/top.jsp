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
	<link rel="stylesheet" href="./static/layui/css/layui.css">
	<link rel="stylesheet" href="./static/css/common.css">
	<link rel="stylesheet" href="./static/css/bootstrap.min.css"/>
</head>
<body>
<header class="layui-bg-cyan">
		<nav class="layui-container">
			<div class="layui-row">
			    <div class="layui-col-md2 logo">
			    	<a href="javascript:;"><img src="http://www.muzhuangnet.com/upload/201610/17/201610171329086541.png"></a>
			    </div>
			    <div class="layui-col-md8 layui-hide-xs">
			    	<ul class="layui-nav layui-bg-cyan">
					  	<li class="layui-nav-item layui-this">
					    	<a href="">首页</a>
					  	</li>
					  	<li class="layui-nav-item">
					    	<a href="">PHP<span class="layui-badge-dot"></span></a>
					  	</li>
					  	<li class="layui-nav-item">
					    	<a href="">Ruby</a>
					  	</li>
					  	<li class="layui-nav-item">
					    	<a href="">Python</a>
					  	</li>
					  	<li class="layui-nav-item">
					    	<a href="">Discuz<span class="layui-badge-dot"></span></a>
					  	</li>
					  	<li class="layui-nav-item">
					    	<a href="">仓库<span class="layui-badge">9</span></a>
					  	</li>
					  	<li class="layui-nav-item">
					    	<a href="">关于</a>
					  	</li>
					</ul>
			    </div>
			   <div class="layui-col-md2 layui-hide-xs userinfoBox">
			    	<ul class="layui-nav layui-bg-cyan">
					  	<li class="layui-nav-item">
					    	<a href="javascript:;"><i class="layui-icon layui-icon-search search"></i></a>
					  	</li>
					  	<li class="layui-nav-item" lay-unselect="">
						    <a href="javascript:;"><img src="https://t.cn/RCzsdCq" class="layui-nav-img">"${user}"</a>
						    <dl class="layui-nav-child">
						      	<dd><a href="javascript:;">修改信息</a></dd>
						      	<dd><a href="javascript:;">安全管理</a></dd>
						      	<dd><a href="javascript:;">退了</a></dd>
						    </dl>
						</li>
					</ul>
			    </div>
		   	</div>
		</nav>
	</header>
</body>
<script src="./static/layui/jquery-2.1.4.min.js"></script>
<script src="./static/layui/jquery.lazyload.min.js"></script>
<script src="./static/layui/jquery.ias.js"></script>
<script src="./static/layui/layui.all.js"></script>
<script src="./static/layui/bootstrap.min.js"></script>
</html>