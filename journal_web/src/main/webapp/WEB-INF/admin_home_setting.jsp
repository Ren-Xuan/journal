<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>article</title>
    <link rel="stylesheet" href="./staticAdmin/css/css.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="./staticAdmin/upload/css/default.css">
	<link href="./staticAdmin/upload/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />	
    
    <script src="./staticAdmin/js/main.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
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
	
	function submit()
	{	
		
		var datas =new FormData();
		var user_id="${sessionScope.user.user_id}";
		var name = $("#name").val();//取值
		var tel = $("#tel").val();
		var description=$("#description").val();
		var password1=$("#password1").val();
		var password2=$("#password2").val();
		if(!name){
			alert("请填写名字");
			$("#name").focus();//获取焦点
			return ;
		}
		if(password1!=password2){
			alert("密码两次输入不一致");
			$("#keyword").focus();//获取焦点
			return ;
		}
		datas.append("name",name);
		datas.append("user_id",user_id);
		datas.append("tel",tel);
		datas.append("description",description);
		datas.append("password1",password1);
		datas.append("password2",password2);
		datas.append("portrait", document.querySelector("#portrait").files[0]);
		
		$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                method:"post",
                dataType: "json",//预期服务器返回的数据类型
                url: "../journal_web/userUpdateAction" ,//url
             	// 告诉jQuery不要去处理发送的数据
                processData : false, 
                // 告诉jQuery不要去设置Content-Type请求头
                contentType :false,
                data:datas,
       
                success: 
                	function (ret) {
                    if (ret.result=="success") {
                    	new TipBox({type:'success',str:"修改成功",hasBtn:true});
                    }
                    else
                    {

                    	new TipBox({type:'error',str:ret.result,hasBtn:true});
                    }
                    ;
                },
                error : 
                	
                	function(ret) {

                	new TipBox({type:'error',str:"服务器错误"+ret.result,hasBtn:true});
                }
            });
		}
	</script>
	
</head>

<body>
    <div class="public_box">
        <h1 class="title">
            <strong>修改用户信息</strong>
            <span>
                <a class="button-normal button-search" href="#">用户列表</a>
            </span>
        </h1>
        <div class="tabBox">
            <div class="tabTitle">
                <div class="tabWrap">
                    <span class="tabBtn tabActive">基本信息</span>
                </div>
            </div>
            <div class="tabBody mb10">
                <div class="bodyLi bodyActive">
                    <div class="win-input mb10">
                        <span class="input-name">用户名</span>
                        <input type="text" id="name" class="text-full" placeholder="请输入" value="${sessionScope.user.name}">
                    </div>

                    <div class="win-input mb10">
                        <span class="input-name">用户账号</span>
                        <input type="text" class="text-full" placeholder="请输入" disabled="value" value="${sessionScope.user.user_id}">
                    </div>

                    <div class="win-input mb10">
                        <span class="picture-name">头像</span>
                        <div class="picture-box">
                            <div class="uploadImgBox">
                                <div class="imgBox">
                                    <img src="${sessionScope.user.portrait_path}${sessionScope.user.portrait_name}" alt=""> 
                                </div>
                               <div class="win-input mb10">
                        			<span class="picture-name">头像上传</span>
                        			<div >
        					
                					<input id="portrait" class="file" type="file" multiple data-min-file-count="1">
      
    								</div>
                   				 </div>
                            </div>
                        </div>
                    </div>

                    <div class="win-input mb10">
                        <span class="input-name">用户类别</span>
                        <div class="select-box">
                            <select class="select" disabled="value" value="${sessionScope.user.user_id}">
                                <c:if test="${sessionScope.user.grade eq 1}"><!-- 如果 -->
									<option value="" >游客</option>
								</c:if>
                                
                                 <c:if test="${sessionScope.user.grade eq 2}"><!-- 如果 -->
									<option value="" >${sessionScope.user.grade}级管理员</option>
								</c:if>
                               <c:if test="${sessionScope.user.grade eq 3}"><!-- 如果 -->
									<option value="" >${sessionScope.user.grade}级管理员</option>
								</c:if><c:if test="${sessionScope.user.grade eq 4}"><!-- 如果 -->
									<option value="" >${sessionScope.user.grade}级管理员</option>
								</c:if>
                            </select>
                        </div>
                    </div>

                    

                    <div class="win-input mb10">
                        <span class="input-name">电话</span>
                        <input type="text" id="tel" class="text-full" placeholder="请输入" value="${sessionScope.user.tel}">
                    </div>
					<div class="win-input mb10">
                        <span class="input-name">用户部门</span>
                        <div class="select-box">
                            <select class="select"  disabled="value" value="${sessionScope.user.department}">
                               
                                <option value="" >${sessionScope.user.department}</option>
                               
                            </select>
                        </div>
                    </div>
                    <div class="win-input mb10">
                        <span class="input-name">说明</span>
                        <input type="text" id="description" class="text-full" placeholder="请输入" value="${sessionScope.user.description}">
                    </div>

                    
                     <div class="win-input mb10">
                        <span class="input-name">密码</span>
                        <input type="password" id="password1" class="text-full" placeholder="请输入" value="${sessionScope.user.password}">
                    </div>
                    <div class="win-input mb10">
                        <span class="input-name">确认密码</span>
                        <input type="password" id="password2" class="text-full" placeholder="请输入" value="${sessionScope.user.password}">
                    </div>
                </div>

            </div>

            <div class="actionBtnGroup">
                <button class="button-normal button-add" onclick="submit()">保存</button>
            </div>
        </div>
    </div>
 
    <script>
        
    </script>
</body>

</html>