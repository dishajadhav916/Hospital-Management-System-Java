<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import = "com.db.DBConnect" %>
<%@ page import = "com.dao.DoctorDao" %>
<%@ page import = "com.dao.AppointmentDao" %>
<%@ page import = "com.entity.Doctor" %>
<%@ page import = "com.entity.User" %>
<%@ page import = "com.entity.Appointment" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Details</title>
<%@include file="../component/allcss.jsp" %>
<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

<%@include file="navbar.jsp" %>

<div class="container p-3">
	<div class="row">
	<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3  text-center">Patient Details</p>
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var = "succMsg" />
						</c:if>
						
						<c:if test="${ empty errMsg }">
						<p class="text-center text-success">${errMsg }</p>
						<c:remove var = "errMsg" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name </th>
									<th scope="col">Address</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
									<%
									AppointmentDao dao =new AppointmentDao(DBConnect.getConn());
									DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
									List<Appointment> list = dao.getAllAppointment();
									for(Appointment ap:list){
											Doctor d = dao2.getDoctorById(ap.getDoctorId());
									%>
										<tr>
										<td><%=ap.getFullName() %></td>
										<td><%=ap.getGender() %></td>
										<td><%=ap.getAge() %></td>
										<td><%=ap.getAppointDate() %></td>
										<td><%=ap.getEmail() %></td>
										<td><%=ap.getPhNo() %></td>
										<td><%=ap.getDiseases() %></td>
										<td><%=d.getFullName() %></td>
										<td><%=ap.getAddress() %></td>
										<td><%=ap.getStatus() %></td>
										
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