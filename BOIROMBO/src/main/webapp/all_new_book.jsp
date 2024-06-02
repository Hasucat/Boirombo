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
<title>All New Book</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
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

	<c:if test="${not empty addCart }">
		<div id="toast">${ addCart }</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
	</c:if>
	<c:remove var="addCart" scope="session" />

	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
			List<BookDetails> list = dao.getAllNewBooks();
			for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-5">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 250px" class="img thumblin mt-3">
						<p><%=b.getBookname()%></p>
						<p> Author: <%=b.getAuthor()%></p>
						<p>
							 Category: <%=b.getBookCategory()%></p>
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

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">Details</a> <a href=""
								class="btn btn-primary btn-sm ml-1"><i
								class="fa fa-solid fa-dollar-sign"></i> <%=b.getPrice()%> </a>
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