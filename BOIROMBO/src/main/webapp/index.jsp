<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.entity.User"%>
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
<title>Ebook: Index</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/Boirombo Logo2.png");
	height: 100vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
.back-book-img {
	background: url("img/book.jpg");
	height: 60vh;
	width: 98%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color:#c9bfb1;
}
.card1{
		margin-left: 103px;
	    
}
.card2{
		margin-left:60px;
	    
}
.card3{
		margin-left: 5px;
	    
}
</style>
</head>
<body style="background-color: #f5f3eb;">


	<%
	User u = (User) session.getAttribute("user");
	%>

	<%@ include file="all_component/navbar.jsp"%>
	
	<div class="container-fluid back-img" ></div>


<!-- Start Recent Book -->

	<div class="container-fluid">
		<h3 class="text-center text-black p-2" style="color: #5c0b2d; font-weight:bold;">Recent Book</h3>
		<div class="row p-3">

			<%
			BookDAOimpl dao2 = new BookDAOimpl(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getRecentBooks();
			for (BookDetails b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 250px" class="img thumblin mt-3">
						<p><%=b.getBookname()%></p>
						<p> Author: <%=b.getAuthor()%></p>

						<%
						if (b.getBookCategory().equals("Old")) {
						%>
						<p>
							 Category: <%=b.getBookCategory()%></p>
						<div class="row text-center ">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm card1">Details</a> <a href=""
								class="btn btn-primary btn-sm card3"><i
								class="fa fa-solid fa-dollar-sign"></i> <%=b.getPrice()%> </a>
						</div>
						<%
						} else {
						%>
						<p>
							 Category: <%=b.getBookCategory()%></p>
						<div class="row text-center ">

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

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">Details</a> <a href=""
								class="btn btn-primary btn-sm ml-1"><i
								class="fa fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
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
		<div class="text-center mt-2">
			<a href="all_recent_book.jsp"
				class="btn btn-sm text-white mt-1" style="background-color:#94653e; font-weight:bold;">View All </a>
		</div>
	</div>
	<!-- End Recent Book -->

	<hr>

	<!-- Start New Book -->

	<div class="container-fluid">
		<h3 class="text-center text-black" style="color: #5c0b2d; font-weight:bold;">New Book</h3>
		<div class="row p-3">

			<%
			BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
			List<BookDetails> list = dao.getNewBooks();
			for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 250px" class="img thumblin mt-3">
						<p><%=b.getBookname()%></p>
						<p> Author: <%=b.getAuthor()%></p>
						<p>
							 Category: <%=b.getBookCategory()%></p>
						<div class="row text-center">

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


							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">Details</a> <a href=""
								class="btn btn-primary btn-sm ml-1"><i
								class="fa fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="all_new_book.jsp"
				class="btn  btn-sm text-white mt-1" style="background-color:#94653e; font-weight:bold;">View All </a>
		</div>
	</div>
	<!--  End New Book  -->
	

	<hr>

	<!--  Start Old Book  -->
	
	<div class="container-fluid">
		<h3 class="text-center text-black" style="color: #5c0b2d; font-weight:bold;">Old Book</h3>
		<div class="row p-3">
			<%
			BookDAOimpl dao3 = new BookDAOimpl(DBConnect.getConn());
			List<BookDetails> list3 = dao3.getOldBooks();
			for (BookDetails b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 250px" class="img thumblin mt-3">
						<p><%=b.getBookname()%></p>
						<p> Author: <%=b.getAuthor()%></p>
						<p> Category: <%=b.getBookCategory()%></p>
						<div class="row text-center ">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm card1">Details</a> <a href=""
								class="btn btn-primary btn-sm  card3"><i
								class="fa fa-solid fa-dollar-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="all_old_book.jsp"
				class="btn btn-sm text-white mt-1" style="background-color:#94653e; font-weight:bold;">View All </a>
		</div>
	</div>
	<!--  End Old Book  -->
	

	<%@ include file="all_component/footer.jsp"%>
</body>
</html>
