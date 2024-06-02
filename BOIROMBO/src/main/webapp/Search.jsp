<%@page import="com.entity.User"%>
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
<title> Search Book</title>
<%@ include file="all_component/allCss.jsp"%>
</style>
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
<%
	User u = (User) session.getAttribute("user");
	%>
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
		<%
		   String ch=request.getParameter("ch");
			BookDAOimpl dao2 = new BookDAOimpl(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getBookBySearch(ch);
			for (BookDetails b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 250px" class="img thumblin mt-3">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>

						<%
						if (b.getBookCategory().equals("Old")) {
						%>
						<p> Categories: <%=b.getBookCategory()%> </p>
						<div class="row text-center ml-5">
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm card1">Details</a> <a
								href="" class="btn btn-primary btn-sm card3"><i class="fa fa-solid fa-dollar-sign"></i><%=b.getPrice() %> </a>
						</div>
						<%
						} else {
						%>
						<p> Categories:<%=b.getBookCategory()%></p>
						<div class="row text-center ml-5">
						
						<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm card2"> Add
								to cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm card2"> Add to cart</a>
							<%
							}
							%>
							 <a href="view_books.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm ml-1">Details</a> <a href=""
								class="btn btn-primary btn-sm ml-1"><i class="fa fa-solid fa-dollar-sign"></i> <%=b.getPrice() %> </a>
						</div>
						<%
						}
						%>
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