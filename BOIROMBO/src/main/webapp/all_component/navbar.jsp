<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<style>
   
    .ebooks-heading {
        color: #42311a; 
        margin-left: 10px; 
        font-weight:bold;"
    }
</style>
<div class="container-fluid"
	style="height: 10px; background-color: #6d4c41;"></div>

<style>
    
    .custom-login-btn {
        background-color: #825951; 
        color: white; 
        font-weight: bold;
    }

    .custom-register-btn {
        background-color: #ad9590;
        color: white; 
        font-weight: bold; 
    }
    
    .custom-search-btn {
        background-color: #a1887f;
        color: white; 
        font-weight: bold; 
    }
    .custom-cart-btn {
       color: #543c37; 
    }
</style>

<div class="container-fluid p-3" style="background-color:#FFF7EA;">
	<div class="row">
		<div class="col.md.3 text-success">
			<h3  class="ebooks-heading">
				<i class=" fa fa-solid fa-book"></i> BOIROMBO
			</h3>
		</div>
		<div class="col.md.6">
			<form class="form-inline my-2 my-lg-0"action="Search.jsp" method="post">
				<input class="form-control mr-sm-2 ml-3" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn custom-search-btn  my-2 my-sm-0" type="submit">
					Search</button>
			</form>
		</div>


		<c:if test="${not empty user }">
			<div class="col.md.3">
			<a href="cart.jsp" class=" custom-cart-btn ml-3"><i class="fas fa-cart-plus fa-2x"></i></a>
			<a href="login.jsp" class="btn custom-login-btn ml-3"><i class="fas fa-user-plus"></i> ${user.name} </a>
			 <a href="logout" class="btn custom-register-btn ml-3"><i class="fas fa-sign-in-alt"></i> Logout</a>
		</div></c:if>
		
		<c:if test="${empty user }">
		<div class="col.md.3">
			<a href="login.jsp" class="btn custom-login-btn ml-3"><i class="fas fa-sign-in-alt"></i> Login</a>
			 <a href="register.jsp" class="btn custom-register-btn ml-3"><i class="fa fa-solid fa-plus"></i> Register</a>
		</div>
		
		</c:if>
	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp" style="font-weight: bold;"><i
					class="fa fa-solid fa-house-user"></i> Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" style="font-weight: bold;"
				href="all_recent_book.jsp"><i class="fa fa-solid fa-book-open"></i>
					Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link" style="font-weight: bold;"
				href="all_new_book.jsp"><i class="fa fa-solid fa-book-open"></i>
					New Book</a></li>

			<li class="nav-item active"><a class="nav-link disabled" style="font-weight: bold;"
				href="all_old_book.jsp"><i class="fa fa-solid fa-book-open"></i>
					Old Book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0" style="color: #91664d; font-weight: bold;" type="submit">
				<i class="fa fa-solid fa-bars"></i> Setting
			</a>
			<a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-2" style="color: #91664d; font-weight: bold;" type="submit">
				<i class="fa fa-solid fa-phone"></i> Contact Us</a>
			
		</form>
	</div>
</nav>