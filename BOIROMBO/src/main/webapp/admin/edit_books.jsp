<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="com.mysql.cj.jdbc.Driver" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
<%@ include file="allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("1.png");
	height: 100vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	
}
 .card {
        background-color: rgba(255, 255, 255, 0.5);
        min-height: 630px;
        border-radius: 10px;
        overflow: hidden;
         
    }
.card1{
     margin-top: -150px;
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
        margin-top: -160px;
    }
.crd-ho:hover {
	background-color: white;
}
.card-bg {
    background: url("form4.png");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    border-radius: 10px;
}
</style>
</head>
<body style="background-color: #fafaf5;">
	<%@ include file="navbar.jsp"%>
	<div class="container-fluid back-img">
	<div class=" container h-100">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-md-4">

				<div class="card1">
				<div class="card card-bg">
					<div class="card-body">
						<h4 class="text-center" style="color: #00838f;  font-weight: bold; "> Edit Books</h4>
						
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
						BookDetails b = dao.getBookById(id);
						%>
						<form action="../edit_books" method="post" enctype="multipart/form-data">
						<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getBookname()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getAuthor()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getPrice()%>">
							</div>

							<div class="form-group">
								<label for="inputstate">Book Status</label> <select
									id="inputstate" name="status" class="form-control">
									<% if ("Active".equals(b.getStatus())){%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
								}else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									} 
									%>

								</select>
							</div>
							
							<div class="text-center">
								<style>
								.custom-btn {
										background-color: #00838f; 
										color: white;
										font-weight: bold; 
										}
								
								</style>
						<button type="submit" class="btn custom-btn">Update</button>
						
						</div>
						</form>
					</div>
					</div>
				</div>

			</div>
		</div>
</div>
	</div>
	<div class="footer"><%@ include file="footer.jsp"%></div>
</body>
</html>