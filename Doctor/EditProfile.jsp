<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored = "false" %>
 <%@ page import = "com.db.DBConnect" %>
<%@ page import = "com.dao.SpecialistDao" %>
<%@ page import = "com.dao.DoctorDao" %>
<%@ page import = "com.entity.Specialist" %>
<%@ page import = "com.entity.Doctor" %>

<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
<c:if test="${empty doctObj }">
	<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<%@include file="navbar.jsp" %>
<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var = "succMsg" />
						</c:if>
						
						<c:if test="${ empty errMsg }">
						<p class="text-center text-danger">${errMsg }</p>
						<c:remove var = "errMsg" />
						</c:if>
					
					<div class="card-body">
						<form action="../doctorChangePassword" method ="post">
							<div class="mb-3">
								<label>Enter New Password</label>
								<input type="password" name = "newPassword" class="form-control" required>
							</div>
							
							<div class="mb-3">
								<label>Enter old Password</label>
								<input type="password" name = "oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value = "${doctObj.id }" name = "uid">
							<button class="btn btn-success col-md-12">Change Password</button>
						</form>
					</div>
				</div>
			</div>
			
			<div  class="col-md-5 offset-md-2">
				<div class="card paint-card">
				<p class="text-center">Edit Profile</p>
				
					<c:if test="${not empty succMsgd }">
						<p class="text-center text-success">${succMsgd }</p>
						<c:remove var = "succMsgd" />
						</c:if>
						
						<c:if test="${ empty errMsgd }">
						<p class="text-center text-danger">${errMsgd }</p>
						<c:remove var = "errMsgd" />
						</c:if>
				
					<div class="card-body">
						<form action="../doctorUpdateProfile" method ="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label>
								<input type="text" required name= "fullname" class="form-control"
								value="${doctObj.fullName }">
								
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label>
								<input type="date" required name= "dob" class="form-control"
								value="${doctObj.dob }">
								
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label>
								<input type="text" required name= "qualification" class="form-control"
								value="${doctObj.qualification }">
								
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label>
								<select name="spec" required class="form-control">
								<option>value="${doctObj.specialist }"</option>
								
									<%SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for(Specialist s:list)
									{%>
										<option><%=s.getSpecialistName() %></option>
									<%}
								%>
								</select>
								
								
								
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label>
								<input type="text" readonly required name= "email" class="form-control"
								value="${doctObj.email }">
								
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label>
								<input type="text" required name= "mob" class="form-control"
								value="${doctObj.mobNo }">
								
							</div>
							<input type="hidden" name="id" value="${ doctObj.id}">
							<button type="submit" class="btn btn-primary">Update </button>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>