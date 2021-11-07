<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Win10 Ui</title>
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
                <span>
                    <a class="button-normal button-search" href="#">文章列表</a>
                    <a class="button-normal button-add" href="picture-create.html">创建文章</a>
                </span>
            </div>
        </h1>
        <table class="table-default mb10">
            <tr>                
            	<th width="50">选择</th>
            	<th width="50">序号</th>
                <th width="60">文章ID</th>
                <th width="255">文章名称</th>
                <th width="80">所属期刊</th>
                <th width="60">期刊ID</th>
                <th width="100">关键词</th>
                <th width="60">文件链接</th>
                <th width="50">封面</th>
                <th width="80">打开方式</th>
                <th width="80">状态</th>
                <th width="80">访问人数</th>
                <th width="100">更新时间</th>
                <th width="400">概述</th>
                
                <th>操作</th>
            </tr>
            <c:forEach items="${myArticles}" var="item" varStatus="status">
            <tr>
                <td>
                    <label class="label-checkbox">
                        <input type="checkbox" name="checkbox">
                        <span class="checkbox-name"> </span>
                    </label>
                </td>
                <td>${status.index+1}</td>
                <td><a href="../journal_web/article_content?articleId=${item.article_id}" class="title" target="_blank">${item.article_id}</a></td>
                <td><a href="../journal_web/article_content?articleId=${item.article_id}" class="title" target="_blank">${item.title}</a></td>
               	<td><a href="" title="" class="write_link">${item.periodical.periodical_title}</a></td>
                <td><a href="" title="" class="write_link">${item.periodical.periodical_id}</a></td>
                <td><a href="" title="" class="write_link">${item.keyword}</a></td>
                <td><a href="#${item.file_path}" title="" class="write_link" >${item.file_name}</a></td>
                <td><a href="../journal_web/article_content?articleId=${item.article_id}" class="title" target="_blank"><img src="${item.cover_path}${item.cover_name}" width="40" height="30"></a></td>
                
                
       			<td>新建窗口</td>
                <td>
                    <div class="switch">
                    	<c:if test="${item.stage eq 1 }">
                        <div class="state" data-switch="1"></div>
                        <span>等待二审</span>
                        </c:if>
                    	<c:if test="${item.stage gt 1 }">
                        <div class="state" data-switch="1"></div>
                        <span>正常</span>
                        </c:if>
                        <c:if test="${item.stage eq 0 }">
                        <div class="state" data-switch="0"></div>
                        <span>待审</span>
                        </c:if>
                        <c:if test="${item.stage eq -1 }">
                        <div class="state" data-switch="0"></div>
                        <span>驳回</span>
                        </c:if>
                    </div>
                </td>
                <td>${item.viewer}</td>
                <td>${item.time}</td>
                <td><a href="" title="" class="write_link">${item.summary}</a></td>
                <td>
                    <button class="button-small button-edit" 
                    onclick="window.location.href = '../journal_web/to_admin_article_update?article_id=${item.article_id}'">
                    	编辑</button>
                   <button class="button-small button-del" onclick="del('${item.article_id}')">删除</button>
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