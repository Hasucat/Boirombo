<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOimpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Admin: All Orders</title>
<%@ include file="allCss.jsp"%>
<style>

.back-img {
	background: url("table2.jpg") repeat;
	min-height: 100vh;
	background-size: cover;
	display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
	
}
.container-fluid {
    flex: 1;
    width: 100%;
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
<%@ include file="navbar.jsp"%>

<c:if test="${empty user}">
	<c:redirect url="../login.jsp"/>
	</c:if>
	
<div class="back-img">	
<h3 class="text-center p-3" style="color: #805942; font-weight: bold;" >Hello Admin</h3>
<div class="container p-3 table-container">
<table class="table table-striped ">
  <thead class="text-black" style="background-color: #baa599;">
    <tr>
      <th scope="col">Order ID</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Phone No</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">PaymentType</th>
    </tr>
  </thead>
  <tbody>
    
           <%
			BookOrderDAOimpl dao = new BookOrderDAOimpl(DBConnect.getConn());
			List<Book_Order> list = dao.getAllOrder();
			for (Book_Order b : list) {
				
			%>
			<tr>
			<th scope="row"><%=b.getOrderId() %></th>
				<td><%=b.getUsername()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getFulladd()%></td>
				<td><%=b.getPhno()%></td>
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
<div class="footer"><%@ include file="footer.jsp"%></div>
</body>
</html>