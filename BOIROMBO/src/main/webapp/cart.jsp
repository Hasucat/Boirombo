<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOimpl"%>
<%@page import="com.entity.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/boho.jpg");
	height: 93vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	
}
.back-img2 {
	background: url("img/cart.png");
	height: 95vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	
}
 .card1 {
        background-color: rgba(255, 255, 255, 0.5);
        padding: 10px;
        border: none;
        margin-top: 9px;
        margin-left: -150px;
    }
   .card2 {
        background-color: rgba(255, 255, 255, 0.5);
        padding: 10px;
        border: none;
        margin-top: 9px;
        margin-left: -160px;
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
        margin-top: 10px; 
    }
.crd-ho:hover {
	background-color: white;
}


</style>
</head>

<body style="background-color: #FFF7EA;">
	<%@ include file="all_component/navbar.jsp"%>
	
	<c:if test="${not empty Failed }">
							<div class="alert alert-danger text-center" role="alert">
  							${Failed}</div>
							<c:remove var="Failed" scope="session" />
						</c:if>
	<c:if test="${not empty Success }">
							<div class="alert alert-success text-center" role="alert">
  							${Success}</div>
							<c:remove var="Success" scope="session" />
						</c:if>
						
	<c:if test="${ empty user}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<div class="container-fluid back-img2">
	<div class="container-fluid ">
	<div class="col-md-4"></div>
	<div class=" container h-100">
		<div class="row h-100 justify-content-center align-items-center">
		

			<div class="col-md-6">
				<div class="card1 back-img" style="background-color: #97bcc7;">
					<div class="card-body">
						<h3 class="text-center" style="color: #5c0b2d; font-weight:bold;">Order Summary</h3>
						<form action="order" method="post">
						
						<input type="hidden" value="${user.id}" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4" style="font-weight:bold;">Name</label> <input type="text" name ="username"
										class="form-control" id="inputEmail4" value="${user.name}" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4" style="font-weight:bold;">Phone no</label> <input type="number" name ="phno"
										class="form-control" id="inputEmail4" value="${user.phno}" required>
								</div>

							</div>

							<div class="form-group">
								<label for="inputAddress" style="font-weight:bold;">Email</label> <input type="email" name ="email"
									class="form-control" id="inputAddress" value="${user.email}" required>
							</div>
							<div class="form-group">
								<label for="inputAddress" style="font-weight:bold;">Address</label> <input type="text" name ="address"
									class="form-control" id="inputAddress" value="${user.address}" required>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4" style="font-weight:bold;">Landmark</label> <input type="text" name ="landmark"
										class="form-control" id="inputEmail4" value="${user.landmark}"required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" style="font-weight:bold;">PinCode</label> <input type="number" name ="pincode"
										class="form-control" id="inputPassword4" value="${user.pincode}" required>
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4" style="font-weight:bold;">State</label> <input type="text" name ="state"
										class="form-control" id="inputEmail4" value="${user.state}" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" style="font-weight:bold;">City</label> <input type="text"name ="city"
										class="form-control" id="inputPassword4" value="${user.city}" required>
								</div>
							</div>

							<div class="form-group">
								<label style="font-weight:bold;">Payment Method</label> <select class="form-control" name ="payment">
									<option value="noselect">---Select---</option>
									<option value="COD">Cash on Delivery</option>
									<option value ="Card">Card payment</option>
									<option value ="Loan">Installment</option>
								</select>
							</div>


							<div class="text-center">
								<style>
								.custom-btn {
										background-color: #806863; 
										color: white;
										font-weight: bold; 
										}
								.custom-btn-continue {
           						 background-color: #57332b;
           						 color: white; 
           						 font-weight: bold; 
        							}
								</style>
								<button class=" btn custom-btn">Place order</button>
								<a href="index.jsp" class="btn custom-btn-continue"> Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="card2 back-img mr-1" style="background-color: #97bcc7;">
					<div class="card-body">
						<h3 class="text-center" style="color: #5c0b2d; font-weight:bold;"">My Cart</h3>
						<table class="table table-striped"
							style="background-color: #f5f7f7;">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("user");

								CartDAOimpl dao = new CartDAOimpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>" 
									class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>
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
