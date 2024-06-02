<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
<%@ include file="allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("1.png");
	height: 80vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	
}
 .card {
        background-color: rgba(255, 255, 255, 0.5);
        min-height: 800px;
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
        margin-top:170px;
        
    }
.crd-ho:hover {
	background-color: white;
}
.card-bg {
    background: url("form4.png");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    border-radius: 10px;
   
}
</style>
</head>
<body style="background-color:#fafaf5;">
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty user}">
	<c:redirect url="../login.jsp"/>
	</c:if>
	<div class="container-fluid back-img">
	<div class="container h-100">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-md-6">

				<div class="card">
				<div class="card card-bg">
					<div class="card-body">
						<h4 class="text-center" style="color: #805942;  font-weight: bold;">Add Books</h4>
						
							<c:if test="${not empty Failed }">
							<p class="text-center text-danger">${Failed}</p>
							<c:remove var="Failed" scope="session" />
						</c:if>
						<c:if test="${not empty Success }">
							<h5 class="text-center text-success">${Success}</h5>
							<c:remove var="Success" scope="session" />
						</c:if>
						
						
						<form action ="../add_books" method ="post" enctype="multipart/form-data" >

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
							<label for="inputstate">Book Categories</label> <select 
								id="inputstate" name="categories" class="form-control">
								<option selected>--select--</option>
								<option value="New">New</option>
								<option value="Recent">Recent</option>
								<option value="Old">Old</option>  
								</select>
						</div>
						<div class="form-group">
							<label for="inputstate">Book Status</label> <select 
								id="inputstate" name="status" class="form-control">
								<option selected>--select--</option>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option> 
								</select>
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
						<button type="submit" class="btn custom-btn">Add</button>
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	</div>
	</div>
	<div class="footer"><%@ include file="footer.jsp"%></div>
</body>
</html>