<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Curriculum Vitae a Personal Category Flat Bootstarp Responsive Website Template | Home :: w3layouts</title>
<link href="staticContent/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary JavaScript plugins) -->
<script src="staticContent/js/jquery.min.js"></script>
<!-- Custom Theme files -->
 <link href="staticContent/css/dashboard.css" rel="stylesheet">
<link href="staticContent/css/style.css" rel='stylesheet' type='text/css' />
<!-- 下载 -->
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:400,500,700&amp;display=swap'>
<link rel="stylesheet" href="./static/download/css/style.css">
<script src='./static/download/js/jquery.min.js'></script>
<script src='./static/download/js/TweenMax.min.js'></script>
<script src="./static/download/js/script.js"></script>
<!-- Custom Theme files -->
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Curriculum Vitae Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!-- start menu -->
  <link href="staticContent/css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
  <script src="staticContent/js/jquery.magnific-popup.js" type="text/javascript"></script>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="./static/layui/jquery.min.js"></script>
 	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="./static/layui/bootstrap.min.js"></script>
	<script src="./staticAdmin/js/main.min.js"></script>
    <script src="./staticAdmin/upload/js/fileinput.js" type="text/javascript"></script>
    <script src="./staticAdmin/upload/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <!-- 对话框 -->
<script type="text/javascript" src="./dialog/js/zepto.min.js"></script>
<script type="text/javascript" src="./dialog/js/mdialog.js"></script>
<link rel="stylesheet" type="text/css" href="./dialog/css/mdialog.css">
    
	<script type="text/javascript">
	function get(article_id){

		$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "../journal_web/admin_downFile" ,//url
                data: {
                	"article_id":article_id
                },
                success: 
                	function (ret) {
                    if (ret.result=="success") {
                    	new TipBox({type:'success',str:"下载成功",hasBtn:true});
                    }
                    else
                    {
                    	new TipBox({type:'error',str:"下载失败"+ret.result,hasBtn:true});
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

<div class="col-sm-3 col-md-2 sidebar">
 		<c:forEach items="${result}" var="article">
		 <div class="sidebar_top">
			<a href="../journal_web/article_search?periodical_id=${article.periodical_id }" class="like" target="_blank">
			 <h2 style="padding: 20px; color: white;">${article.periodical.periodical_title}</h2> 
			 <img src="${article.periodical.cover_path}${article.periodical.cover_name}" alt="" />
		 	</a>
		 </div>
		<div class="details">
			 <h2>序: </h2>	
			 <address>
			 <p style="padding-left: 50px;">
			 <h3>${article.periodical.preface}</h3>
			 </p>
			 </address>
	
		</div>
		</c:forEach>
		<div class="clearfix"></div>
</div>
<!---->

	<!---//pop-up-box---->		
		
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<c:forEach items="${result}" var="article">
	 <div class="content">
		 <div class="company">
			 <h3 class="clr3" style="padding-right: 80%; ;">
				 <p><img src="${article.cover_path}${article.cover_name}" alt=""></img></p>

			 </h3>
			 <div class="company_details">
			
				 <h4>${article.title}<span style="padding-left: 5%;">${article.time}:article id:${article.article_id}</span></h4>
			 
				 <h6><em>[作者]</em>&nbsp;&nbsp;
				 	<a href="../journal_web/article_search?user_id=${article.user.user_id }" class="like" target="_blank">
				 	${article.author}
				 	</a>
				 </h6>
				 <p class="cmpny1"></p>
			 </div>
			 <br>
			 <h3 class="clr3">节选:</h3>
			 <div class="company_details">
				 <p>summary<br/>summary<br/>summary<br/>summary<br/>summary<br/>
				 summary<br/>summary<br/>summary<br/>summary<br/>
				 summary<br/>summary<br/>summary<br/>summary<br/>
				 summary<br/>summary<br/>summary<br/>summary<br/>
				 summary<br/>summary<br/>summary<br/>summary<br/>summary<br/>
				 ${article.summary}
				 </p>
			 </div>
		 </div>
		 <div class="skills">
		 	 <p class="cmpny1"></p>
			 <h3 class="clr2">keyword</h3>
			 <div class="skill_info">
			 <p>这里包含了一些文章关键词</p>
			 </div>
			 <div class="skill_list">
				 <div class="skill1">
					 <h4>Keyword</h4>
					 <ul>					 
						<li><a href="../journal_web/article_search?keyword=${article.keyword}" class="like" target="_blank">${article.keyword }</a></li>
						<li><a href="../journal_web/article_search?keyword=${article.keyword}" class="like" target="_blank">${article.keyword }</a></li>
						<li><a href="../journal_web/article_search?keyword=${article.keyword}" class="like" target="_blank">${article.keyword }</a></li>
						<li><a href="../journal_web/article_search?keyword=${article.keyword}" class="like" target="_blank">${article.keyword }</a></li>
					 </ul>
				 </div>
				 <div class="skill2">
					 <h4>Languages</h4>
					 <ul>					 
						<li>HTML/CSS</li>
						<li>ActionScript</li>
						<li>PHP</li>
						<li>Ruby on Rais</li>
					 </ul>
				 </div>
				 <div class="clearfix"></div>
			 </div>
		 </div>
		 <div class="education">
			 <h3 class="clr3">下载</h3>
			 <br/>
			 <br/>
			 <c:if test="${sessionScope.user.checked ge 1}">
			 <div class="xx">
			 	<c:url value="/admin_downFile" var="downurl">
            		<c:param name="article_id" value="${article.article_id}"></c:param>
        		</c:url>
				 <a href="${downurl}" class="button" target="_blank" style="width: 200px;">
        			<ul>
            			<li>&#68;ownload</li>
            			<li>&#68;ownloading</li>
            			<li>下载完成</li>
        			</ul>
        			<div>
            			<svg viewBox="0 0 24 24"></svg>
        			</div>
    			</a>
				 <br /><br /><br />
		 	</div>
		 	</c:if>
		 	<c:if test="${empty sessionScope.user}">
			 <div class="xx">
				 <a href="./to_login"  class="button" target="_blank" style="width: 200px;">
        			<ul>
            			<li>to login</li>
            			
        			</ul>
        			<div>
            			<svg viewBox="0 0 24 24"></svg>
        			</div>
    			</a>
				 <br /><br /><br />
		 	</div>
		 	</c:if>
		 	<c:if test="${sessionScope.user.checked lt 1}">
		 		 <div class="xx">
				 <a href="./to_admin"  class="button" target="_blank" style="width: 200px;">
        			<ul>
            			<li>未审核</li>
            			
        			</ul>
        			<div>
            			<svg viewBox="0 0 24 24"></svg>
        			</div>
    			</a>
				 <br /><br /><br />
		 	</div>
		 	</c:if>
		 <div class="copywrite">
			 <p>© author: ${article.author} All Rights Reseverd </p>
		 </div>
	 </div>
	</c:forEach>
</div>
<!---->
</body>
</html>