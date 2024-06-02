<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Home</title>
<%@ include file="allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
<style type="text/css">
.back-img {
	background: url("admin.png");
	height: 100vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	
}
 .card {
        background-color: rgba(255, 255, 255, 0.5);
        padding: 10px;
        border-radius: 10px;
        margin-top: 20px;
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
        margin-top: -10px;
    }
.crd-ho:hover {
	background-color: white;
}
</style>
</head>
<body style="background-color: #fcf8e3;">
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty user}">
	<c:redirect url="../login.jsp"/>
	</c:if>
	
	<div class="container-fluid back-img">
	<div class="container">
		<div class="row  p-5 d-flex justify-content-center align-items-center">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center ">
						<div style="color: #79a133;">
							<i class="fa fa-solid fa-plus fa-3x"></i></div><br>
							<h4>Add Books</h4>
							-------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
			<a href="all_books.jsp">
				<div class="card">
					<div class="card-body text-center" >
					<div style="color: #915d74;">
					<i class="fa fa-solid fa-book-open fa-3x"></i>
					</div>
						<br>
						<h4>All Books</h4>
						-------------
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-3">
			<a href="orders.jsp">
				<div class="card">
					<div class="card-body text-center">
						<div style="color: #b88137;">
						<i class="fa fas fa-box-open fa-3x"></i></div><br>
						<h4>Orders</h4>
						-------------
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-3">
			<a data-toggle="modal" data-target="#exampleModal">
				<div class="card">
					<div class="card-body text-center">
						<div style="color: #e63912;"><i class="fa fas fa-sign-out-alt fa-3x"></i></div><br>
						<h4>Logout</h4>
						-------------
					</div>
				</div>
				</a>
			</div>

		</div>

	</div>
	
<!-- logout  modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close"></button>
					<span aria-hidden="true">&times;</span>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>Do you want to Logout?</h4>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<a href="../login.jsp" type="button" class="btn btn-primary text-white">Logout</a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
</div>

<!-- end  logout  modal -->
	<div class="footer"><%@ include file="footer.jsp"%></div>

</body>
</html>