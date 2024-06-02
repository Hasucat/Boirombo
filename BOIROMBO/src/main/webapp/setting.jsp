<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setting page</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}

.back-img {
	background: url("img/setting.png");
	height: 110vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	
	
}

.footer {
        background-color: #00838f; 
        width: 100%;
        color: white;
        text-align: center;
         margin-top: -100px;
    }
.card-first{

		background-color: transparent; 
	    margin-top: 130px;
	    border:none;
}
.card-second{

		background-color: transparent; 
	    border:none;
}
</style>
</head>
<body style="background-color: #fafaf5;">
	<%@ include file="all_component/navbar.jsp"%>

<c:if test="${ empty user}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<div class="container-fluid back-img">
	<div class=" container h-100">
		<div class="row justify-content-center align-items-center">
			<div class="col-md-4">
				<a href="sell_book.jsp">
				<div class="card card-first" >
						<div class="card-body text-center">
							<div style="color: #346670">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<div style="color: #402714;">
								<h3>Sell Your Book</h3>
							</div>
						</div>
					</div>
					</a>
			</div>
			
			<div class="col-md-4">
				<a href="old_book.jsp"><div class="card card-first"  >
						<div class="card-body text-center">
							<div style="color: #9e7287">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<div style="color: #402714;">
								<h3>Your Old Books</h3>
							</div>
						</div>
					</div>
					</a>
			</div>
			
			<div class="col-md-4">
				<a href="edit_profile.jsp">
				<div class="card card-first" >
						<div class="card-body text-center">
							<div style="color: #97bcc7;">
								<i class="fas fa-edit fa-3x"></i>
							</div>
							<div style="color: #402714;">
								<h3>Edit Profile</h3>
							</div>
						</div>
					</div>
					</a>
			</div>
			
			
			
			<div class="col-md-4 mt-3">
				<a href="order_history.jsp"><div class="card card-second" >
						<div class="card-body text-center">
							<div style="color: #a11515;">
								<i class="fas fa-box-open fa-3x"></i>
							</div>
							<div style="color: #402714;">
								<h3>Order List</h3>
							</div>
							<p>Track your Order</p>
						</div>
					</div>
					</a>
			</div>
			
			<div class="col-md-4 mt-3">
				<a href="helpline.jsp"><div class="card card-second" >
						<div class="card-body text-center">
							<div style="color: #34c969;">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<div style="color: #402714;">
								<h3>Help Centre</h3>
							</div>
							<p>24/7 Service</p>
						</div>
					</div>
					</a>
			</div>

			<div>
			</div>
		</div>
	</div>
	</div>
<div class="footer"><%@ include file="all_component/footer.jsp"%></div>
</body>
</html>