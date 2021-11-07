<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="./staticAdmin/css/tam.css">
		<link rel="stylesheet" href="./staticAdmin/css/LineIcons.min.css">
		<link rel="stylesheet" href="./staticAdmin/css/vendor.css">
		<script src="./staticAdmin/js/custom.js"></script>
		<script src="./staticAdmin/js/map.js"></script>
		<script src="./staticAdmin/js/vendor.js"></script>
	</head>
	<body>
		<!-- START: ABOUT -->
				<div class="section section-about" id="about">
					<div class="container">
						<div class="section-head">
							<span>Home</span>
							<h2>About Me -${sessionScope.user.grade}</h2>
						</div>
		
						<div class="row justify-content-center align-items-center">
							<div class="col-md-6">
								<img class="about-img img-fluid wow fadeInUp" 
								data-wow-duration="1s" src="${sessionScope.user.portrait_path}${sessionScope.user.portrait_name}" 
								alt="About Picture">
							</div>
							<div class="col-md-6" >
								
								<div class="about-desc wow fadeInUp" data-wow-duration="1s"  data-wow-delay="500ms">
									<div class="about-desc-content">
										<h1 class="font-weight-light mb-5">Name ${sessionScope.user.name}(${sessionScope.user.user_id})</h1>
										<p class="font-weight-light my-3">${sessionScope.user.description}</p>
									</div>
		
									<div class="about-desc-more text-left mt-5">
										<div class="row">
											<div class="col-md-6">
												<div class="about-desc-info">
													<b>Grade : </b>
													<span>${sessionScope.user.grade}</span>
												</div>
											</div>
											<div class="col-md-6">
												<div class="about-desc-info">
													<b>Department : </b>
													<span>${sessionScope.user.department}</span>
												</div>
											</div>
											<div class="col-md-6">
												<div class="about-desc-info">
													<b>ID : </b>
													<span>${sessionScope.user.user_id}</span>
												</div>
											</div>
											<div class="col-md-6">
												<div class="about-desc-info">
													<b>Phone : </b>
													<a href="tel:beingeorge">${sessionScope.user.tel}</a>
												</div>
											</div>
											<div class="col-md-6">
												<div class="about-desc-info">
													<b>xxxxx : </b>
													<a href="tel:0987654321">xxxxxxx</a>
												</div>
											</div>
											<div class="col-md-6">
												<div class="about-desc-info">
													<b>Email :</b>
													<a href="mailto:hello@beingeorge.com">renxuan@renxuan.com</a>
												</div>
											</div>
											
										</div>
									</div>
								</div>
							</div>
		
						</div>
					</div>
		
					<div class="container mt-5 pt-3">
						<div class="section-head ">
							<span>ABILITIES</span>
							<h2>My Articles</h2>
						</div>
		
						<div class="section-skills-wrap">
							<div class="row">
								
								<div class="col-md-6">
									<div class="resume-panel">
										<c:forEach items="${myArticles}" var="item">
										<div class="mb-4 wow fadeInUp"  data-wow-duration="1.5s">
											<h6>${item.title}(id:${item.article_id}) </h6>
											<div class="progress mt-2">
											
												<div class="progress-bar" role="progressbar" style="width: ${item.viewer div totalViewer * 100 }%;" 
												aria-valuenow="${item.viewer}" aria-valuemin="0" aria-valuemax="${totalViewer}"></div>
											</div>
										</div>
		
										</c:forEach>
		
									</div>
								</div>	
							</div>
						</div>
					</div>
				</div>
				<!-- END: ABOUT -->
	</body>
</html>
