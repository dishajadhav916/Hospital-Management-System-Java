<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import = "com.db.DBConnect" %>

<%@ page import = "com.dao.AppointmentDao" %>


<%@ page import = "com.entity.Appointment" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comment</title>
<%@include file="../component/allcss.jsp" %>
<style>
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

<div class="container p-3">
	<div class="row">
	<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4  text-center"> Patient Comment</p>
						
									<%
									int id = Integer.parseInt(request.getParameter("id"));
									AppointmentDao dao =new AppointmentDao(DBConnect.getConn());
									
									Appointment ap = dao.getAllAppointmentById(id);
									%>
						
						<form action="../updateStatus" class="row" method="post">
							<div class="col-md-6">
								<label>Patient Name</label>
								<input type="text" readonly value="<%=ap.getFullName() %>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Age</label>
								<input type="text" readonly value="<%=ap.getAge() %>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Mob No.</label>
								<input type="text" readonly value="<%=ap.getPhNo() %>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Diseases</label>
								<input type="text" readonly value="<%=ap.getDiseases() %>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Comment</label>
								<textarea required name="comm" class="form-control" row="3" cols""></textarea>
							</div>
							<input type="hidden" name="id" value="<%=ap.getId() %>">
							<input type="hidden" name="did" value="<%=ap.getDoctorId() %>">
							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
						
						</form>
						
					</div>
				</div>
			</div>
			</div>

</body>
</html>