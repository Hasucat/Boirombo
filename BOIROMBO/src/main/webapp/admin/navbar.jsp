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
	style="height: 10px; background-color: #6d4c41"></div>

<style>
 
.custom-modal-header {
    background-color: #f7f7f7; 
    color: white;
    border: none; 
}

.custom-modal-body {
    position: relative;
    background-color: #f1f1f1; /* Change body background color */
}

.image-container {
    position: relative;
    text-align: center;
    color: white;
    border: none; 
}

.logout-image {
    max-width: 100%;
    height: auto;
   
}

.button-overlay {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
}
.button-overlay h4 {
    margin-bottom: 20px;
}
.btn-logout {
    background-color: #71b0b0; 
    border: none; 
    font-weight:bold;
}

.btn-cancel {
    background-color: #6e6a69;
    border: none; 
    font-weight:bold;
}
    
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
</style>

<div class="container-fluid p-3 " style="background-color:#FFF7EA;" >
	<div class="row">
		<div class="col.md.3 text-success">
			<h3 class="ebooks-heading">
				<i class=" fa fa-solid fa-book"></i> BOIROMBO
			</h3>
		</div>

		<div class="col-md-3">
			<c:if test="${not empty user }">
				<a class="btn custom-login-btn text-white"><i
					class="fas fa-user"></i> ${user.name}</a>
				<a data-toggle="modal" data-target="#exampleModal"
					class="btn custom-register-btn text-white"><i
					class="fas fa-sign-in-alt"></i> Logout</a>
			</c:if>
			<c:if test="${empty user }">
				<a href="../login.jsp" class="btn custom-login-btn text-white"><i
					class="fas fa-sign-in-alt"></i> Login</a>
				<a href="../register.jsp" class="btn custom-register-btn text-white"><i
					class="fas fa-user-plus"></i> Register</a>
			</c:if>

		</div>

	</div>
</div>

<!-- logout  modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header custom-modal-header " >
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
			</div>
			
				<div class="image-container">
				 <img src="logoutbar.jpg" alt="Logout Image" class="logout-image">
					 <div class="button-overlay">
					 <h2 style="color: #42280d; font-weight:bold;">Do you wish to logout?</h2>
					<button type="button" class="btn btn-cancel text-white"
						data-dismiss="modal">Cancel</button>
					<a href="../login.jsp" type="button" class="btn btn-logout text-white">Logout</a>
				</div>
			</div>
			
			
		</div>
	</div>
</div>

<!-- end  logout  modal -->

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
			<li class="nav-item active"><a class="nav-link" href="home.jsp">
			<i class="fa fa-solid fa-house-user"></i> Home <span class="sr-only">(current)</span>
			</a></li>
			</form>
	</div>
</nav>