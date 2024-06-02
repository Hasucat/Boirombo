<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Register</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/1.png");
	height: 80vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	
}
.card-bg {
    background: url("img/register.png");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    border-radius: 10px;
}
 .card {
        background-color: rgba(255, 255, 255, 0.5);
        min-height: 680px;
        border-radius: 10px;
         overflow: hidden;
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
        margin-top: 50px;
    }
.crd-ho:hover {
	background-color: white;
}
.card-bg {
    background: url("img/register.png");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    border-radius: 10px;
}
</style>
</head>
<body style="background-color: #fafaf5;">
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
	<div class=" container h-100">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card card-bg">
					<div class="card-body">
						<h4 class="text-center" style="color: #805942;  font-weight: bold;">Register Here</h4>
						
						<c:if test="${not empty Failed }">
							<p class="text-center text-danger">${Failed}</p>
							<c:remove var="Failed" scope="session" />
						</c:if>
						<c:if test="${not empty Success }">
							<h5 class="text-center text-success">${Success}</h5>
							<c:remove var="Success" scope="session" />
						</c:if>
						
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1 ">Full Name:</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter name"
									required="required" name="fname">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email:</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone:</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter phone"
									required="required" name="phno">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password:</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Password" required="required"
									name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms and Conditions</label>
							</div>
							<div class="text-center">
								<style>
								.custom-btn {
										background-color: #805942; 
										color: white;
										font-weight: bold; 
										}
								
								</style>
						<button type="submit" class="btn custom-btn">Submit</button>
						
						</div>
						</form>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="footer"><%@ include file="all_component/footer.jsp"%></div>
</body>
</html>