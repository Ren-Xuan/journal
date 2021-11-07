<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body onmousewheel="top.document.body.scrollTop-=event.wheelDelta">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HTML5折叠卡片式下拉菜单代码</title>
<link rel="stylesheet" href="./staticAdmin/css/css.css">
<!--图标样式-->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css'>

<!--可无视-->
<link rel="stylesheet" type="text/css" href="staticAdmin/adminPeriodical/css/default.css">
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="staticAdmin/adminPeriodical/css/styles.css">


<script src="./static/layui/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="./static/layui/bootstrap.min.js"></script>
<!-- 对话框 -->
<script type="text/javascript" src="./dialog/js/zepto.min.js"></script>
<script type="text/javascript" src="./dialog/js/mdialog.js"></script>
<link rel="stylesheet" type="text/css" href="./dialog/css/mdialog.css">
<script type="text/javascript">

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
	function delPeriodical(periodical_id){

		$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "../journal_web/periodicalDeleteAction" ,//url
                data: {
                	"periodical_id":periodical_id
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
				function recommendPeriodical(periodical_id){

					$.ajax({
			            //几个参数需要注意一下
			                type: "POST",//方法类型
			                dataType: "json",//预期服务器返回的数据类型
			                url: "../journal_web/periodicalRecommendAction" ,//url
			                data: {
			                	"periodical_id":periodical_id
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
					function recommendCancelPeriodical(periodical_id){

						$.ajax({
				            //几个参数需要注意一下
				                type: "POST",//方法类型
				                dataType: "json",//预期服务器返回的数据类型
				                url: "../journal_web/periodicalCancelRecommendAction" ,//url
				                data: {
				                	"periodical_id":periodical_id
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

<br><br><br>
	

	

<div class="container" style="overflow: scroll;">
	
	<c:forEach items="${periodicals }" var="periodical" varStatus="status">

	<div class="card-drop ${status.index+1}">
		<a class='toggle' href="#">
		<tr>
			<td class='fa fa-folder'>${status.index+1}:</td>
			<td class='label-active'>${periodical.periodical_title}——————</td>
			<td style="text-align: center;">(${periodical.preface})</td>
			<td style="text-align: right;">
			   <button class="button-small button-edit" 
                    onclick="window.location.href = '../journal_web/to_admin_periodical_update?periodical_id=${periodical.periodical_id}'">
                    	编辑</button>
               <button class="button-small button-del" onclick="delPeriodical('${periodical.periodical_id}')">删除</button>
               <button class="button-small button-orchid"  onclick="recommendPeriodical('${periodical.periodical_id}')">推上热门</button>
				<button class="button-small button-blue"  onclick="recommendCancelPeriodical('${periodical.periodical_id}')">取消热门</button>
			</td>	
		</tr>
		</a>
		<div >
		<ul>
			<li class='active'><a data-label="1" href="#"><i class='fa fa-folder'></i>文章数量:${fn:length(periodical.articles)}
			
			   <button class="button-small button-edit" 
                    onclick="window.location.href = '../journal_web/to_admin_periodical_update?periodical_id=${periodical.periodical_id}'">
                    	编辑</button>
               <button class="button-small button-del" onclick="delPeriodical('${periodical.periodical_id}')">删除</button>
               <button class="button-small button-orchid"  onclick="recommendPeriodical('${periodical.periodical_id}')">推上热门</button>
				<button class="button-small button-blue"  onclick="recommendCancelPeriodical('${periodical.periodical_id}')">取消热门</button>
				
			</a>
			</li>
			<c:forEach items="${periodical.articles }" var="item" varStatus="status">
				<li>
				<a data-label="flash动画" href="./article_content?articleId=${item.article_id}">
				<i class='fa fa-camera-retro'>
				</i>
					${status.index+1}: ${item.title} &lt;${item.author }&gt; ${item.viewer }
					 <td style="text-align: right;">
			    		<button class="button-small button-edit" 
                    onclick="window.location.href = '../journal_web/to_admin_article_update?article_id=${item.article_id}'">
                    	编辑</button>
                   <button class="button-small button-del" onclick="del('${item.article_id}')">删除</button>
					<button class="button-small button-orchid"  onclick="recommend('${item.article_id}')">推上热门</button>
					<button class="button-small button-blue"  onclick="recommendCancel('${item.article_id}')">取消热门</button>
					</td>
				</a>
				</li>  
					     
			</c:forEach>
		</ul>
		</div>
	</div>
	<br /><br /><br />
	</c:forEach>
	
</div>


<script type="text/javascript" src="static/layui/jquery.min.js"></script>
<script type="text/javascript">

for (i = 0; i <=${fn:length(periodicals)}; i++) { 
	
  
(function ($) {
	var cards = $("."+i), toggler = cards.find('.toggle'), links = cards.find('ul>li>a'), li = links.parent('li'), count = links.length, width = 100;
	li.each(function (i) {
		$(this).css('z-index', count - i);
	});
	function setClosed() {
		li.each(function (index) {
			$(this).css('top', index * 4).css('width', width - index * 0.5 + '%').css('margin-left', index * 0.25 + '%');
		});
		li.addClass('closed');
		toggler.removeClass('active');
	}
	setClosed();
	toggler.on('mousedown', function () {
		var $this = $(this);
		if ($this.is('.active')) {
			setClosed();
		} else {
			$this.addClass('active');
			li.removeClass('closed');
			
			li.each(function (index) {
				$(this).css('top', 60 * (index + 1)).css('width', '100%').css('margin-left', '800px');
				
			});
			
		}
	});
	
	
}(jQuery));

}
</script>

</body>
</html>