<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old Book</title>
<%@ include file="all_component/allCss.jsp"%>
<style>
 
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
    .back-img {
	background: url("img/table2.jpg");
	min-height: 100vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	
}
</style>
</head>
<body  style="background-color: #f5f3eb;">
	<%@ include file="all_component/navbar.jsp"%>
	
	
						<c:if test="${not empty Success }">
							<div class="alert alert-success text-center">${Success}</div>
							<c:remove var="Success" scope="session" />
						</c:if>
						
						
	<div class="container-fluid back-img">
		<h3 class="text-center p-2" style="color: #805942;  font-weight: bold;">Your Sold Books Vault</h3>
<div class="container table-container">
		<table class="table table-striped mt-3">
			<thead style="background-color: #baa599;">
				<tr>
					
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			
			User u =(User)session.getAttribute("user");
			String email=u.getEmail();
			BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
			List<BookDetails> list = dao.getBookByOld(email,"Old");
			for (BookDetails b : list) {
				
			%>
			<tr>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>" class="btn btn-sm btn-danger">Delete</a></td>
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