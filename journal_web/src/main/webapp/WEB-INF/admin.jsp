<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<body onmousewheel="top.document.body.scrollTop-=event.wheelDelta">
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>admin</title>
    <link rel="stylesheet" href="./staticAdmin/css/css.css">
    <script src="./staticAdmin/js/main.min.js"></script>

	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    <!-- 对话框 -->
<script type="text/javascript" src="./dialog/js/zepto.min.js"></script>
<script type="text/javascript" src="./dialog/js/mdialog.js"></script>
<link rel="stylesheet" type="text/css" href="./dialog/css/mdialog.css">
</head>
<body>
    <div class="admin">
        <div class="top">
            <div class="logo">
				renxuan
            </div>

            <div class="toolBtn">
                <span class="home">
                    <em>访问主页</em>
                </span>
                <span class="bar">
                    <em>快捷导航</em>
                </span>
                <span class="clear" id="clearCache">
                    <em>清除缓存</em>
                </span>
                <span class="set">
                    <em>网站设置</em>
                </span>
                <span class="shutdown" id="logout">
                    <em>退出登录</em>
                </span>
            </div>
        </div>
        <div class="body">
            <div class="left">
                <ul class="navTools">
                    <li>
                        <div class="menuLiT indexLink"><span class="t1 toolLink">
						<a href="to_admin_home" target="rightiframe">控制面板</a></span></div>
                    </li>
					
					<li>
                       <div class="menuLi"><span class="t4 toolLink">个人管理</span></div>
                       <dl class="downmenu">
                           <dd><a href="to_admin_home" target="rightiframe">个人信息</a></dd>
                           <dd><a href="to_admin_home_article_list" target="rightiframe">个人文章</a></dd>
						   <dd><a href="to_admin_home_setting" target="rightiframe">个人信息修改</a></dd>
                       </dl>
                   </li>
                  <li>
                        <div class="menuLi"><span class="t3 toolLink">个人文章</span></div>
                        <dl class="downmenu">
                            <dd><a href="to_admin_home_article_list" target="rightiframe">个人文章</a></dd>
                            <dd><a href="to_admin_home_article_create" target="rightiframe">创建文档</a></dd>
                        </dl>
                    </li>
                 <li>
                     <div class="menuLi"><span class="t7 toolLink">用户管理</span></div>
                     <dl class="downmenu">
                         <dd><a href="to_admin_user_list" target="rightiframe">用户列表</a></dd>
                         <dd><a href="to_admin_user_create" target="rightiframe">创建用户</a></dd>
                     </dl>
                 </li>
                    <li>
                        <div class="menuLi"><span class="t3 toolLink">文档管理</span></div>
                        <dl class="downmenu">
                        
                            <dd><a href="to_admin_article_list" target="rightiframe">文档列表</a></dd>
                            <dd><a href="to_admin_home_article_create" target="rightiframe">创建文档</a></dd>
                        </dl>
                    </li>
                    
                    <li>
                        <div class="menuLi"><span class="t5 toolLink">期刊管理</span></div>
                        <dl class="downmenu">
                        
                            <dd><a href="to_admin_periodical_list" target="rightiframe">期刊列表</a></dd>
                            <dd><a href="to_admin_periodical_create" target="rightiframe">创建期刊</a></dd>
                        </dl>
                    </li>
                    <li>
                        <div class="menuLi"><span class="t6 toolLink">网站设置</span></div>
                        <dl class="downmenu">
                            <dd><a href="admin_webset_setting_one.html" target="rightiframe">基础设置</a></dd>
                            <dd><a href="admin_webset_setting_two.html" target="rightiframe">公司信息</a></dd>
                            <dd><a href="admin_webset_setting_three.html" target="rightiframe">邮箱服务</a></dd>
                        </dl>
                    </li>
                   <li>
                       <div class="menuLi"><span class="t4 toolLink">图片管理</span></div>
                       <dl class="downmenu">
                           <dd><a href="picture.html" target="rightiframe">图片列表</a></dd>
                           <dd><a href="picture_create.html" target="rightiframe">创建图片</a></dd>
                       </dl>
                   </li>
                    <li>
                        <div class="menuLi"><span class="t8 toolLink">友情链接</span></div>
                        <dl class="downmenu">
                            <dd><a href="friendlinks.html" target="rightiframe">友情列表</a></dd>
                            <dd><a href="friendlinks-create.html" target="rightiframe">创建友链</a></dd>
                        </dl>
                    </li>
                    <li>
                        <div class="menuLi"><span class="t9 toolLink">网站日志</span></div>
                        <dl class="downmenu">
                            <dd><a href="log.html" target="rightiframe">日志列表</a></dd>
                        </dl>
                    </li>
                    <li>
                        <div class="menuLi"><span class="t10 toolLink">用户留言 [5]</span></div>
                        <dl class="downmenu">
                            <dd><a href="message.html" target="rightiframe">留言列表</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="right">
                <iframe src="to_admin_home" frameborder="0" id="rightiframe" name="rightiframe"></iframe>
            </div>
        </div>
    </div>

    <script>
    function SetWinHeight(obj) {
        if (document.getElementById) {
            if (obj && !window.opera) {
                if (obj.contentDocument && obj.contentDocument.body.offsetHeight)
                    obj.height = obj.contentDocument.body.offsetHeight;
                else if (obj.Document && obj.Document.body.scrollHeight)
                    obj.height = obj.Document.body.scrollHeight;
            }
        }
    }

        var clearCache = document.getElementById('clearCache');
        clearCache.onclick = function () {
            tipAlert({
                title: "缓存清除成功",
                state: "true", //true成功 fail失败
                time: 1 //3秒后关闭
            });
        }
		
        var logout=document.getElementById('logout');
        logout.onclick=function()
    	{
    		
    		$.ajax({
                //几个参数需要注意一下
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "../journal_web/logoutAction" ,//url
                    data: {
                    },
                    success: 
                    	function (ret) {
                        if (ret) {
                        	new TipBox({type:'success',str:"成功注销登陆",hasBtn:true});
                        }
                        else
                        {
                        	new TipBox({type:'error',str:"服务器错误",hasBtn:true});
                        }
                        ;
                    },
                    error : 
                    	function() {
                    	new TipBox({type:'error',str:"服务器错误",hasBtn:true});
                    }
                });
    	}
    	
        $(function () {
            $('.indexLink .toolLink').click(function () {
                $('.navTools> li> .menuLi').removeClass('menuActive');
                $('.downmenu>dd').removeClass('onLink');
            })
            $('.navTools> li> .menuLi').click(function () {
                if (!$(this).hasClass('menuActive')) {
                    $('.navTools> li> .menuLi').removeClass('menuActive');
                    $(this).addClass('menuActive');
                } else {
                    $(this).removeClass('menuActive');
                }
            })

            $('.downmenu>dd>a').click(function (event) {
                event.stopPropagation();
                $('.downmenu>dd').removeClass('onLink');
                $(this).parent('dd').addClass('onLink');
            });

        })
    </script>
</body>
