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
<title>View Appointment</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@ include file="component/allcss.jsp"%>
	<%@ include file="component/navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url = "user_login.jsp"></c:redirect>
	</c:if>
	
	
	<div class="container p-3">
	<div class="row">
	<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
									<%
									User user = (User) session.getAttribute("userobj");
									AppointmentDao dao =new AppointmentDao(DBConnect.getConn());
									DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
									List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
									for(Appointment ap:list){
										Doctor d = dao2.getDoctorById(ap.getDoctorId());
									%>
										<tr>
										<td><%=ap.getFullName() %></td>
										<td><%=ap.getGender() %></td>
										<td><%=ap.getAge() %></td>
										<td><%=ap.getAppointDate() %></td>
										<td><%=ap.getDiseases() %></td>
										<td><%=d.getFullName() %></td>
										<td>
											<%
												if("Pending".equals(ap.getStatus())){%>
													<a href="#" class="btn btn-sm btn-warning">Pending</a>
													
													
												<%}else{%>
													
												<%=ap.getStatus() %>
												<%}
											%>
										</td>
										</tr>
										
									<%}
									%> 
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-3 p-3">
				<img src="img/team3.jpg" alt="err">
			</div>
			</div>
			</div>

</body>
</html>