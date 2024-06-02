<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helpline</title>
<%@ include file="all_component/allCss.jsp"%>
<style>
.back-img {
	background: url("img/helpline2.png");
	height: 85vh;
	width: 75%;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center top;
	margin-left: 150px;
	margin-top: -30px;
}

 .footer {
        background-color: #00838f; 
        width: 100%;
        color: white;
        text-align: center;
        margin-top:-50px;
}
.card{

		position: relative; 
        top: 150px;
    	background-color: transparent;
    	border:none;
		right: -120px;
		
}


</style>
</head>
<body style="background-color: #FFF7EA;">
<%@ include file="all_component/navbar.jsp"%>
<div class="container-fluid back-img">
<div class="container">
		<div class="row p-5">
			<div class="col-md-4 offset-md-3 text-center">
				<div class="card">
					<div class="card-body">
					<div  style="color:  #15b34f;" class="mt-1">
						<i class="fas fa-phone-square-alt fa-4x"></i>
					</div>
					<h2 style="color: #5c0b2d; font-weight:bold;"> 24/7 Service </h2>
					<h3 style="color: #5c0b2d; font-weight:bold;"> Help Line Number </h3>
					<h5 style="color: #5c0b2d; font-weight:bold;"> ++880 9122020238 </h5>
					<div class="text-center">
								<style>
								.custom-btn {
										background-color: #805942; 
										color: white;
										font-weight: bold; 
										}
								
								</style>
						<a href="index.jsp" class="btn custom-btn">Home</a>
						
						</div>
					
					</div>
				</div>

				<div></div>
			</div>
		</div>
	</div>
	</div>
	<div class="footer"><%@ include file="all_component/footer.jsp"%></div>
</body>
</html>