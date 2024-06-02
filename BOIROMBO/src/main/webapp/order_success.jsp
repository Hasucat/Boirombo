<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">

.back-img-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 80vh;
        }


.back-img-left{
	background: url("img/Thank U.gif");
	height: 90vh;
	width: 50%;
	background-size: cover;
	background-repeat: no-repeat;
	float: left;
}

.card {
	background-color: rgba(255, 255, 255, 0.5);
	padding: 10px;
	border-radius: 10px;
	margin-top: 20px;
}

.container-content {
	width: 50%;
    text-align: center;
    margin-top:10%;
            
}

.card:hover {
	background-color: rgba(255, 255, 255, 0.8);
}

.back-img .container {
	height: 100%;
}

.back-img .container .row {
	height: 100%;
	justify-content: center;
	align-items: center;
}

.footer {
	background-color: #00838f;
	width: 100%;
	color: white;
	text-align: center;
	margin-top:100px;
	
}

.crd-ho:hover {
	background-color: white;
}
</style>
</head>
<body style="background-color: #ffffff;">
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
	 <div class="col-md-6 back-img-left"></div>
	 <div class="back-img-container">
		<div class="container content ">
			<div class="row h-80 justify-content-center align-items-center">
				<div class="col-md-6  text-center mt-1">

					<div style="color: #34c969;">
						<i class="fas fa-check-circle fa-4x"></i>
					</div>
					<h2 style="color: #5c0b2d;  font-weight: bold; ">Your Order has been placed
						Successfully</h2>
					<h5 style="color: #5c0b2d; font-weight: bold;">You will recieve your order within
						7 working days</h5>

					<div class="text-center">
						<style>
.custom-btn {
	background-color: #b3a292;
	color: white;
	font-weight: bold;
}

.custom-order-btn {
	background-color: #5c3347;
	color: white;
	font-weight: bold;
}
</style>
						<a href="index.jsp" class="btn custom-btn">Home</a> <a
							href="order_history.jsp" class="btn custom-order-btn ">View
							Order</a>

					</div>



					<div></div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="footer"><%@ include file="all_component/footer.jsp"%></div>
</body>
</html>