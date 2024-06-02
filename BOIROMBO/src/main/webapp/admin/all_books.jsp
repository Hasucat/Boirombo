<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="com.mysql.cj.jdbc.Driver" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
<%@ include file="allCss.jsp"%>
<style>
html, body {
    height: 100%;
    margin: 0;
    background-color: #html, body {
    height: 100%;
    margin: 0;
    background-color: #a9d6cf;
};
}
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
<body style="background-color: #f5f3eb;">
<%@ include file="navbar.jsp"%>
<c:if test="${empty user}">
	<c:redirect url="../login.jsp"/>
	</c:if>
	<c:if test="${not empty Success }">
		<h5 class="text-center text-success">${Success}</h5>
		<c:remove var="Success" scope="session" />
	</c:if>
	<c:if test="${not empty Failed }">
		<p class="text-center text-danger">${Failed}</p>
		<c:remove var="Failed" scope="session" />
	</c:if>
	
	
	<div class="back-img">
	<h3 class="text-center p-2" style="color: #805942; font-weight: bold;">Hello Admin</h3>
	<div class="container  table-container">
	<table class="table table-striped">
		<thead class="text-black" style="background-color: #baa599;">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

  <%
  BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
  List<BookDetails> list = dao.getAllBooks();
  for (BookDetails b : list){ 
  %>
			
			<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_books.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary"><i class="fas fa-edit"></i> Edit</a> <a
					href="../delete?id=<%=b.getBookId() %>"
					class="btn btn-sm btn-danger"><i class=" fa fa-solid fa-trash"></i> Delete</a></td>
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