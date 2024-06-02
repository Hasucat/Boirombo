<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Book</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">

.back-img {
	background: url("img/book.jpg");
	height: 60vh;
	width: 98%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #c9bfb1;
}
.card1{
		margin-left: 42px;
	  
}
.card3{
		margin-left: 5px;
	  
}
.card2{
		margin-left: 1px;
	    
}
</style>
</head>
<body style="background-color: #f5f3eb;">
<%@ include file="all_component/navbar.jsp"%>
<div class="container-fluid">
		<div class="row p-3">
		<%
			BookDAOimpl dao3 = new BookDAOimpl(DBConnect.getConn());
			List<BookDetails> list3 = dao3.getAllOldBooks();
			for (BookDetails b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-5">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 250px" class="img thumblin mt-3">
						<p><%=b.getBookname()%></p>
						<p> Author: <%=b.getAuthor()%></p>
						<p> Category: <%=b.getBookCategory()%></p>
						<div class="row text-center ml-5">
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm card1">Details</a> <a
								href="" class="btn btn-primary btn-sm card3"><i class="fa fa-solid fa-dollar-sign"></i> <%=b.getPrice() %></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>