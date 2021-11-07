<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>admin</title>
  <link rel="stylesheet" href="./staticAdmin/css/css.css">
  <script src="./staticAdmin/js/main.min.js"></script>

<!-- 对话框 -->
<script type="text/javascript" src="./dialog/js/zepto.min.js"></script>
<script type="text/javascript" src="./dialog/js/mdialog.js"></script>
<link rel="stylesheet" type="text/css" href="./dialog/css/mdialog.css">
<script type="text/javascript">
	function upgrade(user_id){
		$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "../journal_web/upstageAction" ,//url
                data: {
                	"user_id":user_id
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
	function check(user_id)
	{
		$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "../journal_web/passUserRegisterAction" ,//url
                data: {
                	"user_id":user_id
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
	</script>
</head>
<body>
    <div class="public_box">
        <h1 class="title">
            <strong>用户列表</strong>
            <span>
                <a class="button-normal button-search" href="#">用户列表</a>
                <a class="button-normal button-add" href="#">创建用户</a>
            </span>
        </h1>
        <table class="table-default">
            <tr>
	            <th width="60">序号</th>
                <th width="60">用户ID</th>
                <th width="100">用户账号</th>
                <th width="90">类别</th>
                <th width="100">电话</th>
                <th width="140">部门</th>
                <th width="80">状态</th>
				
                <th width="200">说明</th>
                <th width="130">头像</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${users}" var="item" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${item.user_id}</td>
                <td>${item.name}</td>
                <c:if test="${item.checked ne 1}">
                       <td>游客</td>
                </c:if>
                <c:if test="${item.checked ge 1}">
                <td>${item.grade}级别管理员</td>
                </c:if>
                <td>${item.tel}</td>
                <td>${item.department}</td>
                <td>
                    <div class="switch">
                    	<c:if test="${item.checked eq 1}">
                        <div class="state" data-switch="1"></div>
                        <span>通过审核</span>
                        </c:if>
                        <c:if test="${item.checked eq 0}">
                        <div class="state" data-switch="0"></div>
                        <span>游客</span>
                        </c:if>
                        <c:if test="${item.checked eq -1}">
                        <div class="state" data-switch="0"></div>
                        <span>驳回</span>
                        </c:if>
                    </div>
                </td>

                <td>${item.description}</td>
                <td><a href="" title="" class="write_link"><img src="${item.portrait_path}${item.portrait_name}" width="40" height="30"></a></td>
                <td>
                	<c:if test="${item.checked ne 1}">
                		<button class="button-small button-add"  onclick="check('${item.user_id}')">通过审核</button>
                	</c:if>
                	<c:if test="${item.checked eq 1}">
					<button class="button-small button-search" onclick="upgrade('${item.user_id}')">提升等级</button>
					</c:if>
                    <button class="button-small button-edit"
                    	onclick="window.location.href = '../journal_web/to_admin_user_update?user_id=${item.user_id}'">
							编辑</button>
                    <button class="button-small button-del" onclick="del('${item.user_id}')">删除</button>
                </td>
            </tr>
            </c:forEach>

        </table>

    </div>
 
</body>

</html>