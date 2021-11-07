<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="gb2312" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
	    <!-- css -->
        <link rel="stylesheet" href=" ./static/search_css/vendor/normalize.css" />
		<link rel="stylesheet" href=" ./static/search_css/styles.min.css" />
        <link href="./static/search_img/common/favicon.png" rel="shortcut icon" />
		<link href="./static/search_css/jplist.min.css" rel="stylesheet" type="text/css" />		
		<style type="text/css">
			.combo{margin:0;padding:0;list-style-type:none;}
			a,img{border:0;}
			.body{font-size:12px;background:#efeeeb;color:#666;}
			a,a:hover{text-decoration:none; color:#666;}
			.demo{width:300px;margin:40px auto 0 auto;}

			/* select */
			.select{position:relative;left:80px;top:60px;margin:0 10px;}
			.select dt{height:38px;display:inline-block;border:1px solid #d2ccc4;
			background:#fcfcfb url(./static/search_img/ico.gif) no-repeat 97px center;
			line-height:28px;font-weight:bold;padding-left:10px;
			cursor:pointer;width:100px;padding-right:12px;
			white-space:nowrap;text-overflow:ellipsis;
			overflow:hidden;z-index:99;}
			.select dt:hover,.select dt.cur{border:1px solid #409DFE;box-shadow:0 0 3px #409DFE;}
			.select dd{position:relative;width:120px;left:50px;top:0px;border:1px solid #d2ccc4;background:#fff;display:none;}
			.select dd ul{padding:4px;width:104px;max-height:250px;overflow:auto;}
			.select dd ul li a{line-height:28px;display:block;padding:0 8px;}
			.select dd ul li a:hover{background:#f5f5f5;}
		</style>
		<!-- js -->		
        <script src="./static/search_js/vendor/jquery-1.10.0.min.js"></script>
		<script src="./static/search_js/vendor/modernizr.min.js"></script>
		<script src="./static/search_js/jplist.min.js"></script>
		
			<script>
			$('document').ready(function(){
				$('#demo').jplist({
				
					itemsBox: '.list' 
					,itemPath: '.list-item' 
					,panelPath: '.jplist-panel'
					
					//save plugin state
					,storage: 'localstorage' //'', 'cookies', 'localstorage'			
					,storageName: 'jplist-div-layout'
				});
			});
			function search(){
				var keyword = $("#content").val();
				window.location.href="./article_search?title="+keyword;
			}
			
			</script>
		
</head>

<body>
		
		<!-- black top bar -->
		 
				
		<!-- header -->
		 
		
		<!-- bread crumbs-->
		<div id="bread-crumbs-box" class="box">
			<div id="bread-crumbs" class="box">
			
				<div class="center">
					<div class="box text-shadow">
						<p>
    						<a title="" href="../journal_web/article_index">Home</a> &raquo; Demo
						</p>
					</div>
				</div>
			</div>
		</div>
		
		<!-- main content -->
		<div id="main-content" class="box">
			<div class="center">
				<div id="page-content" class="box">

					 
	
					
										
					<div class="box text-shadow">
						<h1 class="h1-30-normal left">search:${title }</h1>
						<p>	
							
						    <div  class="container parent">
						    		
						        <input type="text" name="content" id="content"></intput>
						        <input type="submit" value="搜索" onclick="search()">
						    </div>
						</p>
					</div>

					
					<!-- demo -->
					<div id="demo" class="box jplist">
					
						<!-- ios button: show/hide panel -->
						<div class="jplist-ios-button">
							<i class="fa fa-sort"></i>
							jPList Actions
						</div>
						
						<!-- panel -->
						<div class="jplist-panel box panel-top">						
							
							<!-- back button button -->
							<button 
								type="button" 
								data-control-type="back-button" 
								data-control-name="back-button" 
								data-control-action="back-button">
								<i class="fa fa-arrow-left"></i> Go Back
							</button>
							
							<!-- reset button -->
							<button 
								type="button" 
								class="jplist-reset-btn"
								data-control-type="reset" 
								data-control-name="reset" 
								data-control-action="reset">
								Reset&nbsp;<i class="fa fa-share"></i>
							</button>
							
							<!-- items per page dropdown -->
							<div 
								class="jplist-drop-down" 
								data-control-type="drop-down" 
								data-control-name="paging" 
								data-control-action="paging">
								
								<ul>
									<li><span data-number="3"> 3 per page </span></li>
									<li><span data-number="5"> 5 per page </span></li>
									<li><span data-number="10" data-default="true"> 10 per page </span></li>
									<li><span data-number="all"> view all </span></li>
								</ul>
							</div>
							
							<!-- sort dropdown -->
							<div 
								class="jplist-drop-down" 
								data-control-type="drop-down" 
								data-control-name="sort" 
								data-control-action="sort"
								data-datetime-format="{month}/{day}/{year}"> <!-- {year}, {month}, {day}, {hour}, {min}, {sec} -->
								
								<ul>
									<li><span data-path="default">Sort by</span></li>
									<li><span data-path=".title" data-order="asc" data-type="text">Title A-Z</span></li>
									<li><span data-path=".title" data-order="desc" data-type="text">Title Z-A</span></li>
									<li><span data-path=".desc" data-order="asc" data-type="text">Description A-Z</span></li>
									<li><span data-path=".desc" data-order="desc" data-type="text">Description Z-A</span></li>
									<li><span data-path=".like" data-order="asc" data-type="number" data-default="true">Likes asc</span></li>
									<li><span data-path=".like" data-order="desc" data-type="number">Likes desc</span></li>
									<li><span data-path=".date" data-order="asc" data-type="datetime">Date asc</span></li>
									<li><span data-path=".date" data-order="desc" data-type="datetime">Date desc</span></li>
								</ul>
							</div>

							<!-- filter by title -->
							<div class="text-filter-box">
							
								<i class="fa fa-search  jplist-icon"></i>
								
								<!--[if lt IE 10]>
								<div class="jplist-label">Filter by Title:</div>
								<![endif]-->
								
								<input 
									data-path=".title" 
									type="text" 
									value="" 
									placeholder="Filter by Title" 
									data-control-type="textbox" 
									data-control-name="title-filter" 
									data-control-action="filter"
								/>
							</div>
							
							<!-- filter by description -->
							<div class="text-filter-box">
								
								<i class="fa fa-search  jplist-icon"></i>
								
								<!--[if lt IE 10]>
								<div class="jplist-label">Filter by Description:</div>
								<![endif]-->
								
								<input 
									data-path=".desc" 
									type="text" 
									value="" 
									placeholder="Filter by Description" 
									data-control-type="textbox" 
									data-control-name="desc-filter" 
									data-control-action="filter"
								/>	
							</div>
							
							<!-- pagination results -->
							<div 
								class="jplist-label" 
								data-type="Page {current} of {pages}" 
								data-control-type="pagination-info" 
								data-control-name="paging" 
								data-control-action="paging">
							</div>
								
							<!-- pagination -->
							<div 
								class="jplist-pagination" 
								data-control-type="pagination" 
								data-control-name="paging" 
								data-control-action="paging">
							</div>
							
						</div>
						 
						
						<!-- data -->   
						<div class="list box text-shadow">
							<c:forEach items="${list}" var="item">
							<!-- item 1 -->
							<div class="list-item box">					
								<!-- img -->
								<div class="img left">
									<img src="${item.cover_path}${item.cover_name }" alt="" title="${item.cover_name }"/>
								</div>
								
								<!-- data -->
								<div class="block right">
									<p class="date">"${item.time}"</p>
									<a href="../journal_web/article_content?articleId=${item.article_id}" class="title" target="_blank">${item.title }</a></p>
									<a href="../journal_web/article_content?articleId=${item.article_id}" class="desc" target="_blank">${item.summary }</a></p>
									<em>[作者]</em><a href="../journal_web/article_search?user_id=${item.user.user_id }" class="like" target="_blank">${item.author }</a>
										<a style="padding-left: 300px"></a>
									<em>[关键词]</em><a href="../journal_web/article_search?keyword=${item.keyword}" class="like" target="_blank"/>${item.keyword }</p>
								</div>
							</div>
							</c:forEach>

						</div>	
						
						<div class="box jplist-no-results text-shadow align-center">
							<p>No results found</p>
						</div>
						
						<!-- ios button: show/hide panel -->
						<div class="jplist-ios-button">
							<i class="fa fa-sort"></i>
							jPList Actions
						</div>
						
						<!-- panel -->
						<div class="jplist-panel box panel-bottom">
							
							<!-- items per page dropdown -->
							<div 
								class="jplist-drop-down" 
								data-control-type="drop-down" 
								data-control-name="paging" 
								data-control-action="paging"
								data-control-animate-to-top="true">
								
								<ul>
									<li><span data-number="3"> 3 per page </span></li>
									<li><span data-number="5"> 5 per page </span></li>
									<li><span data-number="10" data-default="true"> 10 per page </span></li>
									<li><span data-number="all"> view all </span></li>
								</ul>
							</div>
														
							<!-- sort dropdown -->
							<div 
								class="jplist-drop-down" 
								data-control-type="drop-down" 
								data-control-name="sort" 
								data-control-action="sort"
								data-control-animate-to-top="true"
								data-datetime-format="{month}/{day}/{year}"> <!-- {year}, {month}, {day}, {hour}, {min}, {sec} -->
								
								<ul>
									<li><span data-path="default">Sort by</span></li>
									<li><span data-path=".title" data-order="asc" data-type="text">Title A-Z</span></li>
									<li><span data-path=".title" data-order="desc" data-type="text">Title Z-A</span></li>
									<li><span data-path=".desc" data-order="asc" data-type="text">Description A-Z</span></li>
									<li><span data-path=".desc" data-order="desc" data-type="text">Description Z-A</span></li>
									<li><span data-path=".like" data-order="asc" data-type="number" data-default="true">Likes asc</span></li>
									<li><span data-path=".like" data-order="desc" data-type="number">Likes desc</span></li>
									<li><span data-path=".date" data-order="asc" data-type="datetime">Date asc</span></li>
									<li><span data-path=".date" data-order="desc" data-type="datetime">Date desc</span></li>
								</ul>
							</div>
							
							<!-- pagination results -->
							<div 
								class="jplist-label" 
								data-type="{start} - {end} of {all}"
								data-control-type="pagination-info" 
								data-control-name="paging" 
								data-control-action="paging">
							</div>
								
							<!-- pagination -->
							<div 
								class="jplist-pagination" 
								data-control-animate-to-top="true"
								data-control-type="pagination" 
								data-control-name="paging" 
								data-control-action="paging">
							</div>
							
						</div>
					</div>
					<!-- end of demo -->
				</div>
			</div>
		</div>	
		
    </body>
</html>