<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
<meta charset="utf-8">
<title>登陆</title>
	<link rel="stylesheet" href="./static/login_css/style.css">
	<link rel="stylesheet" href="./static/css/bootstrap.min.css"/>	
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
	/*  该function用于用户登陆的验证，其功能如下：
		1.当用户账号为空时，警告：用户名必填！
		2.当用户密码为空时，警告：密码必填！
		3.通过ajax连接后端，如果账号密码验证成功，就跳转至主页，否则警告：账号或者密码错误！
	*/
	
	function login()
	{
		var name = $("#name").val();//取值
		var password = $("#password").val();
		if(!name){
			new TipBox({type:'error',str:"请填写用户名",hasBtn:true});
			$("#username").focus();//获取焦点
			return ;
		}
		if(!password){
			new TipBox({type:'error',str:"请填写密码",hasBtn:true});
			$("#password").focus();//获取焦点
			return ;
		}
		$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "../journal_web/loginAction" ,//url
                data: {
                	"name":name,
                	"password":password//多数据用,分隔
                },
                success: 
                	function (ret) {
                    if (ret) {
                    	window.location.href="../journal_web/to_admin";

                    }
                    else
                    {
                    	
                    	var pw =$(".passwordLabel");
             			var myDiv=document.getElementById("passwordLabel");
             			myDiv.innerText="密码错误";
             			pw.addClass("wrong");
                    }
                    ;
                },
                error : 
                	function() {
                    alert("不好意思，服务器跑到火星去了，登陆异常！");
                }
            });
	}
	function signin()
	{
		var name = $("#newname").val();//取值
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();
		var tel=$("#tel").val();
		var department=$("#department").val();
		if(!name){
			new TipBox({type:'error',str:"请填写用户名",hasBtn:true});
			$("#newname").focus();//获取焦点
			return ;
		}
		if(!password1){
			new TipBox({type:'error',str:"请填写密码",hasBtn:true});
			$("#password1").focus();//获取焦点
			return ;
		}
		if(!password2){
			new TipBox({type:'error',str:"请填写确认密码",hasBtn:true});
			$("#password2").focus();//获取焦点
			return ;
		}
		if(!tel){
			new TipBox({type:'error',str:"请填写电话",hasBtn:true});
			$("#tel").focus();//获取焦点
			return ;
		}
		if(!department){
			new TipBox({type:'error',str:"请填写工作部门",hasBtn:true});
			$("#department").focus();//获取焦点
			return ;
		}
		$.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "./registerAction" ,//url
                data: {
                	"name":name,
                	"tel":tel,
                	"department":department,
                	"password1":password1,//多数据用,分隔
                	"password2":password2//多数据用,分隔
                	
                },
                success: 
                	function (ret) {
                    if (ret.result=="success") {
                    	new TipBox({type:'success',str:"注册成功,快去登陆吧",hasBtn:true});
                    }
                    else
                    {
                    	console.log(periodical);
                    	 new TipBox({type:'error',str:ret.result,hasBtn:true});
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
	<style type="text/css">
			label
		{
			font-size:1.0em;
		}
	</style>

</head>

<body>

    <div class="content">
        <div class="form sign-in">
        	<label>
           		<h2>这里登陆</h2>
          </label>
          <br>
            <label>
                <span>用户账号/手机</span>
                <input type="text" id = "name" />
            </label>
            <br>
            <label>
                <span>密码</span>
                <input type="password" id = "password" class="password"/>
            </label>
            
            <label class="passwordLabel" id="passwordLabel"></label>
            <button type="button" class="submit" onclick="login()">登 录</button>
            <button type="button" class="fb-btn" onclick="login()">使用管理员帐号登录</button>
        </div>
        <div class="sub-cont">
            <div class="img">
                <div class="img__text m--up">
                    <h2>还未注册？</h2>
                    <p>立即注册，发现大量机会！</p>
                </div>
                <div class="img__text m--in">
                    <h2>已有帐号？</h2>
                    <p>有帐号就登录吧，好久不见了！</p>
                </div>
                <div class="img__btn">
                    <span class="m--up">注 册</span>
                    <span class="m--in">登 录</span>
                </div>
            </div>
            <div class="form sign-up">
                <div>
                <label>
                    <h2>Sign In </h2>
                    </label>
                    <label>
                        <span>username</span>
                        <input type="text"  id="newname"/>
                    </label><br>
                    <label>
                        <span>telphone</span>
                        <input type="tel" name="telephone" id="tel"/>
                    </label><br>
                    <label>
                        <span>departure</span>
                        <input type="text"  name="departure" id="department"/>
                    </label><br>
                    <label>
                        <span>password</span>
                        <input type="password" placeholder="password" name="password" id="password1"/>
                    	<input type="password" placeholder="确认password" name="password" id="password2"/>
                    </label><br>
                   
                   </div>
                    <button type="button" class="submit" onclick="signin()">sign in</button>
                

<!--                <button type="button" class="fb-btn"><span>manager</span> 帐号注册</button>-->
            </div>
        </div>
    </div>
 	<div class="backgroundImg">"></div>
    <script src="./static/login_js/script.js"></script>
   
</body>

</html>