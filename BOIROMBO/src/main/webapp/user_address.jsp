<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address Update </title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #fafaf5;">
<%@ include file="all_component/navbar.jsp"%>
<div class="container">
		<div class="row p-5">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body ">
					<h5 class="text-center" style="color: #357582;  font-weight: bold;">Add Address</h5>
					<form action="" method="post">
							
							
							<div class="form-group">
								<label for="inputAddress">Address</label> <input type="text"
									class="form-control" id="inputAddress" >
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" >
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">PinCode</label> <input type="number"
										class="form-control" id="inputPassword4" >
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" >
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" >
								</div>
							</div>

							
							<div class="text-center">
								<style>
								.custom-btn {
										background-color: #00838f; 
										color: white;
										font-weight: bold; 
										}
								
								</style>
						<button type="submit" class="btn custom-btn">Add Address</button>
						
						</div>
						</form>
					
					</div>
				</div>

				<div></div>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>