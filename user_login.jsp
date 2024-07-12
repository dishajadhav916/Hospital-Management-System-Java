<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp" %>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body class="bg-light">
	<%@include file="component/navbar.jsp" %>
	<div class="container p-5">
		<div class="row">
			<div class = "col-md-4 offset-md-4">
				<div class ="card paint-card">
					<div class="card-body">
						<p class ="fs-4 text-center">User Login</p>
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var = "succMsg" />
						</c:if>
						
						<c:if test="${not empty errMsg }">
						<p class="text-center text-success">${errMsg }</p>
						<c:remove var = "errMsg" />
						</c:if>
						
						<form action="user_Login" method = "post">
							  <div class="mb-3">
							    <label class="form-label">Email</label>
							    <input required type="email" name = "email" class="form-control">
							  </div>
							  <div class="mb-3">
							    <label class="form-label">Password</label>
							    <input required type="password" name = "password" class="form-control">
							  </div>
							  <button type="submit" class="btn bg-success text-white col-md-12">Login</button>
						</form>
						<br> don't have an account? <a href="signup.jsp" class="text-decoration-none"> Create Account</a>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>