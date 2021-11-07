<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		var keyword = $("#keyword").val();
		var summary=$("#summary").val();
		var periodical=$("#periodical").val();
		if(!title){
			new TipBox({type:'error',str:"请填写标题",hasBtn:true});
			$("#title").focus();//获取焦点
			return ;
		}
		if(!keyword){
			new TipBox({type:'error',str:"请填写关键字",hasBtn:true});
			$("#keyword").focus();//获取焦点
			return ;
		}
		if(!document.querySelector("#file").files[0]){
			new TipBox({type:'error',str:"请添加文件",hasBtn:true});
			$("#keyword").focus();//获取焦点
			return ;
		}
		if(!document.querySelector("#cover").files[0]){
			new TipBox({type:'error',str:"请添加封面",hasBtn:true});
			$("#keyword").focus();//获取焦点
			return ;
		}
		datas.append("title", title);
		datas.append("keyword",keyword);
		datas.append("summary",summary);
		datas.append("periodical",periodical);
		datas.append("file", document.querySelector("#file").files[0]);
		datas.append("cover", document.querySelector("#cover").files[0]);
		console.log(periodical+"\n"+title);
		$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                method:"post",
                dataType: "json",//预期服务器返回的数据类型
                url: "../journal_web/articleSubmitAction" ,//url
             	// 告诉jQuery不要去处理发送的数据
                processData : false, 
                // 告诉jQuery不要去设置Content-Type请求头
                contentType :false,
                data:datas,
       
                success: 
                	function (ret) {
                    if (ret.result=="success") {
                    	new TipBox({type:'success',str:"添加成功",hasBtn:true});
                    	
                    }
                    else
                    {
                    	new TipBox({type:'error',str:"添加失败"+ret.result,hasBtn:true});
                    }
                    ;
                },
                error : 
                	
                	function(ret) {
                	new TipBox({type:'error',str:ret.result,hasBtn:true});
                	
                }
            });
		}
	</script>
	
</head>

<body>
    <div class="public_box">
        <h1 class="title">
            <strong>创建文章</strong>
            <span>
                    <a class="button-normal button-search" href="#">创建列表</a>
            </span>
        </h1>
        <div class="tabBox">
            <div class="tabTitle">
                <div class="tabWrap">
                    <span class="tabBtn tabActive">常规内容</span>
                    <span class="tabBtn">期刊设置</span>
                    <span class="tabBtn">栏目内容</span>
                </div>
            </div>
            <div class="tabBody mb10">
                <div class="bodyLi bodyActive">
                
                    <div class="win-input mb10">
                        <span class="input-name"><i class="mustAdd">*</i>文章名称</span>
                        <input type="text" id="title" class="text-full" placeholder="请输入">
                    </div>
 					<div class="win-input mb10">
                        <span class="input-name"><i class="mustAdd">*</i>文章关键字</span>
                        <input type="text" id="keyword" class="text-full" placeholder="请输入">
                    </div>
                   
                    <div class="win-input mb10">
                        <span class="picture-name">图片上传</span>
                        <div align="center">
        					
                				<input id="cover" class="file" type="file" multiple data-min-file-count="1">
      
    					</div>
                    </div>
                     <div class="win-input mb10">
                        <span class="input-name">图片描述</span>
                        <input type="text" class="text-full" placeholder="请输入">
                    </div>
                     <div class="win-input mb10">
                        <span class="picture-name">文章描述</span>
                        <div class="picture-box">
                            <div class="uploadImgBox">
                                <textarea   id="summary"   style="OVERFLOW:hidden; width: 100%;height: 200px"></textarea>
                            </div>
                        </div>
                    </div>
                    
					<div class="win-input mb10">
                        <span class="picture-name">文件上传</span>
                        <div align="center">
        				
                				<input id="file" class="file" type="file" multiple data-min-file-count="1">
                				
           					
    					</div>
                    </div>
                     <div class="win-input mb10">
                        <span class="input-name">文件描述</span>
                        <input type="text"  class="text-full" placeholder="请输入">
                    </div>
                   
                 
                    
                    <div class="win-input mb10">
                        <span class="input-name">所属期刊</span>
                        <div class="select-box">
                            <select class="select" id="periodical">
                               	 <c:forEach items="${periodicals}" var="item" varStatus="status">
                                	<option value="${item.periodical_id}">${item.periodical_title}</option>
								</c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="win-input mb10">
                        <span class="input-name">图片链接</span>
                        <input type="text" class="text-full" placeholder="请输入">
                    </div>

                    <div class="win-input mb10">
                        <span class="input-name">显示状态</span>
                        <div class="radio-box">
                            <label class="label-radio">
                                <input type="radio" name="radio">
                                <span class="radio-name">发布&emsp;&emsp;</span>
                            </label>
                            <label class="label-radio">
                                <input type="radio" name="radio">
                                <span class="radio-name">待审核&emsp;</span>
                            </label>
                        </div>
                    </div>
                   
                    <div class="win-input ">
                        <span class="input-name">打开方式</span>
                        <div class="radio-box">
                            <label class="label-radio">
                                <input type="radio" name="radio">
                                <span class="radio-name">新建窗口</span>
                            </label>
                            <label class="label-radio">
                                <input type="radio" name="radio">
                                <span class="radio-name">直接打开</span>
                            </label>
                        </div>
                    </div>

                </div>
                <div class="bodyLi">
                    <div class="win-input mb10">
                        <span class="input-name">标题</span>
                        <input type="text" class="text-full" placeholder="请输入">
                    </div>

                    <div class="win-input mb10">
                        <span class="input-name">关键词</span>
                        <input type="text" class="text-full" placeholder="请输入">
                    </div>

                    <div class="win-input">
                        <span class="textarea-name">描述</span>
                        <div class="textarea-box">
                            <textarea class="textarea" cols="30" rows="5" placeholder="请输入"></textarea>
                        </div>
                    </div>

                </div>
                <div class="bodyLi">
                    富文本编辑器请置入
                </div>
            </div>

            <div class="actionBtnGroup">
                <button class="button-normal button-add" onclick="submit()">保存</button>
            </div>
        </div>
    </div>
    <link rel="stylesheet" href="./staticAdmin/css/css.css">
  

    <script>
        $(function () {
            $('.tabWrap .tabBtn').click(function () {
                $(this).addClass('tabActive').siblings('span').removeClass('tabActive');
                var idx = $(this).index();
                $(".bodyLi").eq(idx).addClass('bodyActive').siblings('.bodyLi').removeClass('bodyActive');
            })


            $('.button-del').click(function () {
                popupAlert({
                    title: "您真的要删除当前这个类目么？",
                    info: "当前栏目AAAA123456",
                    btnSure: "确定",
                    btnCancel: "取消"
                }, function (sure) {
                    tipAlert({
                        title: "删除成功",
                        state: "true", //true成功 fail失败
                        time: 1 //3秒后关闭
                    });
                }, function (cancel) {
                });
            })
        })
    </script>
    <script>
	    $("#file-0").fileinput({
	        'allowedFileExtensions' : ['jpg', 'png','gif'],
	    });
	    $("#file-1").fileinput({
	        uploadUrl: '#', // you must set a valid URL here else you will get an error
	        allowedFileExtensions : ['jpg', 'png','gif'],
	        overwriteInitial: false,
	        maxFileSize: 1000,
	        maxFilesNum: 10,
	        //allowedFileTypes: ['image', 'video', 'flash'],
	        slugCallback: function(filename) {
	            return filename.replace('(', '_').replace(']', '_');
	        }
		});
	    /*
	    $(".file").on('fileselect', function(event, n, l) {
	        alert('File Selected. Name: ' + l + ', Num: ' + n);
	    });
	    */
		$("#file-3").fileinput({
			showUpload: false,
			showCaption: false,
			browseClass: "btn btn-primary btn-lg",
			fileType: "any",
	        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
		});
		$("#file-4").fileinput({
			uploadExtraData: {kvId: '10'}
		});
	    $(".btn-warning").on('click', function() {
	        if ($('#file-4').attr('disabled')) {
	            $('#file-4').fileinput('enable');
	        } else {
	            $('#file-4').fileinput('disable');
	        }
	    });    
	    $(".btn-info").on('click', function() {
	        $('#file-4').fileinput('refresh', {previewClass:'bg-info'});
	    });
	    /*
	    $('#file-4').on('fileselectnone', function() {
	        alert('Huh! You selected no files.');
	    });
	    $('#file-4').on('filebrowse', function() {
	        alert('File browse clicked for #file-4');
	    });
	    */
	    $(document).ready(function() {
	        $("#test-upload").fileinput({
	            'showPreview' : false,
	            'allowedFileExtensions' : ['jpg', 'png','gif'],
	            'elErrorContainer': '#errorBlock'
	        });
	        /*
	        $("#test-upload").on('fileloaded', function(event, file, previewId, index) {
	            alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
	        });
	        */
	    });
		</script>
</body>

