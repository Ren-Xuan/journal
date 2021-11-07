<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>articleList</title>
<link rel="stylesheet" href="./staticAdmin/css/css.css">
<script src="./staticAdmin/js/main.min.js"></script>

<script src="./static/layui/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="./static/layui/bootstrap.min.js"></script>

<!-- 对话框 -->
<script type="text/javascript" src="./dialog/js/zepto.min.js"></script>
<script type="text/javascript" src="./dialog/js/mdialog.js"></script>
<link rel="stylesheet" type="text/css" href="./dialog/css/mdialog.css">
<script type="text/javascript">
	function cancel(article_id){
		$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "../journal_web/cancelAction" ,//url
                data: {
                	"article_id":article_id
                },
                success: 
                	function (ret) {
                    if (ret.result=="success") {
                    	new TipBox({type:'success',str:"撤回成功",hasBtn:true});
                    }
                    else
                    {
                    	new TipBox({type:'error',str:"撤回失败"+ret.result,hasBtn:true});
                    }
                    ;
                },
                error : 
                	function() {
                	new TipBox({type:'error',str:"服务器连接失败",hasBtn:true});
                }
            });
	}
	function pass(article_id)
	{
		$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "../journal_web/passAction" ,//url
                data: {
                	"article_id":article_id
                },
                success: 
                	function (ret) {
                    if (ret.result=="success") {
                    	new TipBox({type:'success',str:"升级成功",hasBtn:true});
                    }
                    else
                    {
                    	new TipBox({type:'error',str:"升级失败"+ret.result,hasBtn:true});
                    }
                    ;
                },
                error : 
                	function() {
                	new TipBox({type:'error',str:"服务器连接失败",hasBtn:true});
                }
            });
	}
	
	function del(article_id){

		$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "../journal_web/delAction" ,//url
                data: {
                	"article_id":article_id
                },
                success: 
                	function (ret) {
                    if (ret.result=="success") {
                    	new TipBox({type:'success',str:"删除成功",hasBtn:true});
                    }
                    else
                    {
                    	new TipBox({type:'error',str:"删除失败"+ret.result,hasBtn:true});
                    }
                    ;
                },
                error : 
                	function() {
                	new TipBox({type:'error',str:"服务器连接失败",hasBtn:true});
                }
            });
	}
		function recommend(article_id){

			$.ajax({
	            //几个参数需要注意一下
	                type: "POST",//方法类型
	                dataType: "json",//预期服务器返回的数据类型
	                url: "../journal_web/articleRecommendAction" ,//url
	                data: {
	                	"article_id":article_id
	                },
	                success: 
	                	function (ret) {
	                    if (ret.result=="success") {
	                    	new TipBox({type:'success',str:"成功上热门",hasBtn:true});
	                    }
	                    else
	                    {
	                    	new TipBox({type:'error',str:"修改失败"+ret.result,hasBtn:true});
	                    }
	                    ;
	                },
	                error : 
	                	function() {
	                	new TipBox({type:'error',str:"服务器连接失败",hasBtn:true});
	                }
	            });
		}
			function recommendCancel(article_id){

				$.ajax({
		            //几个参数需要注意一下
		                type: "POST",//方法类型
		                dataType: "json",//预期服务器返回的数据类型
		                url: "../journal_web/articleCancelRecommendAction" ,//url
		                data: {
		                	"article_id":article_id
		                },
		                success: 
		                	function (ret) {
		                    if (ret.result=="success") {
		                    	new TipBox({type:'success',str:"下架成功",hasBtn:true});
		                    }
		                    else
		                    {
		                    	new TipBox({type:'error',str:"下架失败"+ret.result,hasBtn:true});
		                    }
		                    ;
		                },
		                error : 
		                	function() {
		                	new TipBox({type:'error',str:"服务器连接失败",hasBtn:true});
		                }
		            });
	}
	</script>
</head>
<body>
	<div class="public_box">
		<h1 class="title">
			<strong>文章列表</strong>
			<div class="articleTop">
				<div class="win-input">
					<input type="search" class="text-serach" placeholder="请输入关键词检索文档">
					<button class="button-normal" id="alertbox">搜索</button>
				</div>
				<span> <a class="button-normal button-search" href="#">文档列表</a>
					<a class="button-normal button-add" href="#">创建文档</a>
				</span>
			</div>
		</h1>
		<table class="table-default mb10">
			<tr>
				<th width="40">选择</th>
				<th width="30">序号</th>
				<th width="60">ID</th>
				<th width="150">文档名称</th>
				<th width="80">关键字</th>
				<th width="40">封面</th>
				<th width="80">作者</th>
				<th width="80">作者ID</th>
				<th width="100">联系方式</th>
				<th width="80">所属部门</th>
				<th width="40">作者等级</th>
				<th width="100">作者头像</th>
				<th width="80">状态</th>
				<th width="200">描述</th>
				<th width="120">更新时间</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${articles}" var="item" varStatus="status">
				<tr>
					<td><label class="label-checkbox"> <input
							type="checkbox" name="checkbox"> <span
							class="checkbox-name"> </span>
					</label></td>
					<td>${status.index+1}</td>
					<td><a
						href="../journal_web/article_content?articleId=${item.article_id}"
						title="" class="write_link">${item.article_id}</a></td>
					<td><a
						href="../journal_web/article_content?articleId=${item.article_id}"
						title="" class="write_link">${item.title}</a></td>
					<td><a href="" title="" class="write_link">${item.keyword}</a></td>
					<td><a href="" title="" class="write_link"><img
							src="${item.cover_path}${item.cover_name}" width="19" height="14"></a></td>
					<td><a href="" title="" class="write_link">${item.author}</a></td>
					<td><a href="" title="" class="write_link">${item.user.user_id}</a></td>
					<td><a href="" title="" class="write_link">${item.user.tel}</a></td>
					<td><a href="" title="" class="write_link">${item.user.department}</a></td>
					<td><a href="" title="" class="write_link">${item.user.grade}</a></td>
					<td><a href="" title="" class="write_link"> <img
							src="${item.user.portrait_path}${item.user.portrait_name}"
							width="60" height="44"></a></td>
					<td>
						<div class="switch">
							<div class="state" data-switch="1"></div>
							<span>${item.stage}</span>
						</div>
					</td>
					<td class="write_link">${item.summary}</td>
					<td>${item.time }</td>
					<td>
				
						<button class="button-small button-search" onclick="pass('${item.article_id}')">通过</button>
						<button class="button-small button-add"  onclick="cancel('${item.article_id}')">打回</button>
						<button class="button-small button-edit"
							onclick="window.location.href = '../journal_web/to_admin_article_update?article_id=${item.article_id}'">
							编辑</button>
						<button class="button-small button-del" onclick="del('${item.article_id}')">删除</button>
						<button class="button-small button-orchid"  onclick="recommend('${item.article_id}')">推上热门</button>
						<button class="button-small button-blue"  onclick="recommendCancel('${item.article_id}')">取消热门</button>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class="actionBtnGroup">
			<button class="button-normal button-add mr10">全选</button>
			<button class="button-normal button-del">删除</button>
		</div>
	</div>


</body>

</html>