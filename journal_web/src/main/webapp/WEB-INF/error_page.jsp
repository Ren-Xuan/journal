<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>错误</title>
		<meta name="viewpoint" content="width=device-width,initial-scale=1">
		<link rel="stylesheet" href="./static/error/css/404.css" />
		<script src="./static/error/js/jquery.min.js"></script>
		<script type="text/javascript">
			function back(){
				window.history.back(-1);
			}
		</script>
	</head>
	<body>
		<div class="code">
			<p>遇到了一些错误</p>
		</div>
		<div class="road">
			<div class="shadow">
				<div class="shelt">
					<div class="head">
						<div class="eyes">
							<div class="lefteye">
								<div class="eyeball"></div>
								<div class="eyebrow"></div>
							</div>
							<div class="righteye">
								<div class="eyeball"></div>
								<div class="eyebrow"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="hat"></div>
				<div class="bubble">
					<a href="javascript:;">返回首页?</a>
				</div>
			</div>
			<p>${message }</p>
		</div>
	</body>
	<script type="text/javascript" src="./static/error/js/404.js" ></script>
</html>
