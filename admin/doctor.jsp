<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
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
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
							<c:if test="${not empty succMsg }">
								<p class="text-center text-success">${succMsg }</p>
								<c:remove var="succMsg" />
							</c:if>
					
							<c:if test="${not empty errMsg }">
								<p class="text-center text-success">${errMsg }</p>
								<c:remove var="errMsg" />
							</c:if>
	
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						
						
						<form action="../addDoctor" method ="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label>
								<input type="text" required name= "fullname" class="form-control">
								
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label>
								<input type="date" required name= "dob" class="form-control">
								
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label>
								<input type="text" required name= "qualification" class="form-control">
								
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label>
								<select name="spec" required class="form-control">
								<option>--select--</option>
								
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
								<input type="text" required name= "email" class="form-control">
								
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label>
								<input type="text" required name= "mob" class="form-control">
								
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label>
								<input type="text" required name= "password" class="form-control">
								
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>

					</div>
				</div>
			</div>
			
			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Dob</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No.</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									DoctorDao dao2 =new DoctorDao(DBConnect.getConn());
									List<Doctor> list2 = dao2.getAllDoctor();
									for(Doctor d:list2)
									{%>
										<tr>
										<td><%=d.getFullName() %></td>
										<td><%=d.getDob() %></td>
										<td><%=d.getQualification() %></td>
										<td><%=d.getSpecialist() %></td>
										<td><%=d.getEmail() %></td>
										<td><%=d.getMobNo() %></td>
										<td>
											<a href="editDoctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-primary">Edit</a>
											<a href="../deleteDoctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
										</td>
										</tr>
										
									<%}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			
		</div>
	</div>


</body>
</html>