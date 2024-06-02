<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Books</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img1 {
	background: url("img/15.png");
	height: 105vh;
	width: 80%;
	background-size: cover;
	background-repeat: no-repeat;
	margin-top:-40px;
}
.back-img2 {
	background: url("img/16.png");
	height: 105vh;
	width: 80%;
	background-size: cover;
	background-repeat: no-repeat;
	margin-top:-40px;
	
}

 .card1 {
        background-color: rgba(255, 255, 255, 0.5);
        padding: 10px;
        border: none;
        margin-top: 0px;
        margin-left: 10px;
    }
   .card2 {
        background-color: rgba(255, 255, 255, 0.5);
        padding: 10px;
        border: none;
        margin-top: 0px;
        margin-left: -15px;
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
       
    }
.crd-ho:hover {
	background-color: white;
}
.card-down {
	margin-top: 340px; 
}
.card-cart {
	margin-left: 70px; 
}
.btn-new {
	background-color: #5e544b; 
	color: white;
	font-weight:bold;
	margin-right: 5px;
    margin-top: 20px;
}
.btn-new1{
	background-color: #5e544b; 
	color: white;
	font-weight:bold;
	 margin-right: 70px;
	  margin-top: 20px;
    
}
.price-container {
        align-items: center;
}
.cart-button {
     padding: 10px;
    margin-right: 70px;
    font-weight:bold;
}

.price {
     margin-right: -90px;
     margin-top: -49px;
     font-weight:bold;
}
</style>
</head>
<body style="background-color: #FEF9F0;">
	<%@ include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("user");
	%>
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
	BookDetails b = dao.getBookById(bid);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 text-center bg-white back-img1 card1">
			<div class="card-down">
				<img src="book/<%=b.getPhotoName()%>"
					style="height: 290px; width: 300px"><br>
				<h4 class="mt-3 " style="color: #805942;  font-weight: bold;">
					Book Name :   <span class="text-success"><%=b.getBookname()%></span>
				</h4 >
				<h4 style="color: #805942;  font-weight: bold;">
					Author Name :   <span class="text-success"> <%=b.getAuthor()%>
					</span>
				</h4 >
				<h4 style="color: #805942;  font-weight: bold;">
					Category :   <span class="text-success"><%=b.getBookCategory()%></span>
				</h4>
				</div>
			</div>
			
			<div class="col-md-6 text-center bg-white back-img2 card2 ">
				<div class="card-down">
				<h2><%=b.getBookname()%></h2>
				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<h3 class=" p-3" style="color: #805942;  font-weight: bold;">Contact to Seller</h3>
				<h5 class="text-primary p-3">
					<i class="far fa-envelope"></i> Email:
					<%=b.getEmail()%>
				</h5>
				<%
				}
				%>
				<div class="row p-3">
					<div class="col-md-3 text-danger text-center card-cart p-2" style="font-weight: bold;">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash on Delivery</p>

					</div>
					<div class="col-md-3 text-danger text-center p-2" style="font-weight: bold;">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Book</p>
					</div>
					<div class="col-md-3 text-danger text-center p-2" style="font-weight: bold;">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				
				<div class="price-container">
				<div class="cart-button">
                    <% if ("Old".equals(b.getBookCategory())) { %>
            
        <% } else { %>
            <% if (u == null) { %>
                <a href="login.jsp" class="btn btn-sm text-white card2" style="background-color: #d42a2a; font-weight: bold;">Add to cart</a>
            <% } else { %>
                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-sm text-white card2 " style="background-color: #d42a2a; font-weight: bold;">Add to cart</a>
            <% } %>
        <% } %>
                    </div>
                   <div class="price">
                    <%
                    if ("Old".equals(b.getBookCategory())) {
                    %>
                    <a href="index.jsp" class="btn btn-new"><i class="fa fa-solid fa-cart-plus"></i> Continue Shopping</a>
                    <a href="" class="btn btn-new1"><i class="fa fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
                    <%
                    } else {
                    %>
                    <a href="" class="btn btn-primary"><i class="fa fa-solid fa-dollar-sign"></i><%=b.getPrice()%></a>
                    <% 
                    } 
                    %>
                    </div>

                </div>
			</div>
			</div>
			
		</div>
	</div>
<div class="footer"><%@ include file="all_component/footer.jsp"%></div>
</body>
</html>