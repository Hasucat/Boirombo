<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>Sell book</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/1.png");
	height: 87vh;
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
        min-height: 700px;
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
        margin-top: 20px;
    }
.crd-ho:hover {
	background-color: white;
}

</style>
</head>
<body style="background-color: #fafaf5;">
	<%@ include file="all_component/navbar.jsp"%>
<c:if test="${ empty user}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container-fluid back-img">
	<div class="container">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-md-6 ">
				
				<div class="card">
				<div class="card card-bg">
					<div class="card-body ">
					<h5 class="text-center" style="color: #805942;  font-weight: bold;">Sell Old Book</h5>
					
					
						<c:if test="${not empty Failed }">
							<p class="text-center text-danger">${Failed}</p>
							<c:remove var="Failed" scope="session" />
						</c:if>
						<c:if test="${not empty Success }">
							<h5 class="text-center text-success">${Success}</h5>
							<c:remove var="Success" scope="session" />
						</c:if>
					
					
					<form action ="add_old_book" method ="post" enctype="multipart/form-data" >
					
					<input type="hidden" value="${user.email}" name="user">
						<div class="form-group">
							<label for="exampleInputEmail1">Book Name*</label> <input name="bname"
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" >
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Author Name*</label> <input name="author"
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" >
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Price*</label> <input name="price"
								type="number" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" >
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">Upload Photo</label> <input name="bimg"
								type="file" class="form-control-file" id="exampleInputFile1">
						</div>
						<div class="text-center">
						<style>
								.custom-btn {
										background-color: #805942; 
										color: white;
										font-weight: bold; 
										}
								
						</style>
						<button type="submit" class="btn custom-btn">Press to Sell </button>
						</div>
						
					</form>
					
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