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
		var title = $("#title").val();//取值
		var preface = $("#preface").val();
		var password=$("#password").val();
		if(!title){
			new TipBox({type:'error',str:"请填写标题",hasBtn:true});
			$("#title").focus();//获取焦点
			return ;
		}
		if(!password){
			new TipBox({type:'error',str:"请填写密码",hasBtn:true});
			$("#password").focus();//获取焦点
			return ;
		}
		datas.append("periodical_id","${periodical.periodical_id }");
		datas.append("title",title);
		datas.append("preface",preface);
		datas.append("password",password);
		datas.append("cover", document.querySelector("#cover").files[0]);
		
		$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                method:"post",
                dataType: "json",//预期服务器返回的数据类型
                url: "../journal_web/periodicalUpdateSubmitAction" ,//url
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
            <strong>期刊信息</strong>
            <span>
                <a class="button-normal button-search" href="#">期刊相关</a>
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
                        <span class="input-name">期刊名</span>
                        <input type="text" id="title" class="text-full" placeholder="请输入" value="${periodical.periodical_title }">
                    </div>

                    

                    <div class="win-input mb10">
                        <span class="picture-name">封面</span>
                        <div class="picture-box">
                            <div class="uploadImgBox">
                               <div class="win-input mb10">
                        			<span class="picture-name">封面上传</span>
                        			<div class="imgBox">
                                    <img src="${periodical.cover_path}${periodical.cover_name}" alt=""> 
                                	</div>
                        			<div >
        					
                					<input id="cover" class="file" type="file" multiple data-min-file-count="1">
      
    								</div>
                   				 </div>
                            </div>
                        </div>
                    </div>

                    <div class="win-input mb10">
                        <span class="input-name">用户类别</span>
                        <div class="select-box">
                            <select class="select" disabled="value" value="${userUper.user_id}">
                               
								
				    			<c:if test="${sessionScope.user.grade eq 1}"><!-- 如果 -->
									<option value="" >无权限</option>
								</c:if>
                                
                                 <c:if test="${sessionScope.user.grade eq 2}"><!-- 如果 -->
									<option value="" >${sessionScope.user.grade}级管理员无权限</option>
								</c:if>
                               <c:if test="${sessionScope.user.grade eq 3}"><!-- 如果 -->
									<option value="" >${sessionScope.user.grade}级管理员(有权限)</option>
								</c:if><c:if test="${sessionScope.user.grade eq 4}"><!-- 如果 -->
									<option value="" >${sessionScope.user.grade}级管理员(有权限)</option>
								</c:if>
             
                            </select>
                        </div>
                    </div>

                    

                    <div class="win-input mb10">
                        <span class="input-name">电话</span>
                        <input type="text" id="tel" class="text-full" placeholder="请输入" >
                    </div>
					
                     <div class="win-input mb10">
                        <span class="picture-name">前言</span>
                        <div class="picture-box">
                            <div class="uploadImgBox">
                                <textarea   id="preface"   
                                style="OVERFLOW:hidden; width: 100%;height: 200px">${periodical.preface }</textarea>
                            </div>
                        </div>
                    </div>
                     <div class="win-input mb10">
                        <span class="input-name">管理员密码</span>
                        <input type="password" id="password" class="text-full" placeholder="请输入" >
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