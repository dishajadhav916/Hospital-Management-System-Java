<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored = "false" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
<%@ include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>


<body class="bg-light">
	<%@include file="component/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Register</p>
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var = "succMsg" scope= "session"/>
						</c:if>
						
						<c:if test="${not empty errMsg }">
						<p class="text-center text-success">${errMsg }</p>
						<c:remove var = "errMsg" scope= "session"/>
						</c:if>

						<form action="user_register" method="post">
							<div class="mb-3">
							    <label class="form-label">Full Name</label>
							    <input required type="text" name="name"
									class="form-control">
							  </div>
							  <div class="mb-3">
							    <label class="form-label">Email</label>
							    <input required type="email" name="email"
									class="form-control">
							  </div>
							  <div class="mb-3">
							    <label class="form-label">Password</label>
							    <input required type="password" name="password"
									class="form-control">
							  </div>
							  <button type="submit"
								class="btn bg-success text-white col-md-12">Register</button>
						</form>
						<br> Already have an account? <a href="user_login.jsp"
							class="text-decoration-none">Login</a>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
	

</body>


</html>