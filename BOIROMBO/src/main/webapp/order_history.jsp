<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookOrderDAOimpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order History</title>
<%@ include file="all_component/allCss.jsp"%>
<style>
.back-img {
	background: url("img/table2.jpg");
	min-height: 100vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	
}
.table-container {
    background-color: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    margin-top: 20px;
}
 .footer {
        background-color: #00838f; 
        width: 100%;
        color: white;
        text-align: center;
}
</style>
</head>
<body style="background-color: #f5f3eb;">
	<%@ include file="all_component/navbar.jsp"%>
	
	<c:if test="${ empty user}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	
	<div class="container-fluid back-img">
		<h3 class="text-center p-2" style="color: #805942;  font-weight: bold;">Your Order
			History</h3>
<div class="container table-container">
		<table class="table table-striped mt-3">
			<thead style="background-color: #baa599;">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Method</th>
				</tr>
			</thead>
			<tbody>
			
			
			<%
			
			User u =(User)session.getAttribute("user");
			BookOrderDAOimpl dao = new BookOrderDAOimpl(DBConnect.getConn());
			List<Book_Order> list = dao.getBook(u.getEmail());
			for (Book_Order b : list) 
			{%>
			<tr>
			<th scope="row"><%=b.getOrderId()%></th>
				<td><%=b.getUsername()%></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPaymentType()%></td>
			</tr>
			<%
			}
			%>
				


			</tbody>
		</table>
	</div>
	</div>
	<div class="footer"><%@ include file="all_component/footer.jsp"%></div>
</body>
</html>
