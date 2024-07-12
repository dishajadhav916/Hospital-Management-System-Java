package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;
@WebServlet("/doctorUpdateProfile")
public class Editprofile extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String specialist = req.getParameter("spec");
			String email = req.getParameter("email");
			String mob = req.getParameter("mob");
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			Doctor d = new Doctor(id, fullName, dob, qualification, specialist, email, mob, "");
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			HttpSession session = req.getSession();
			
			if(dao.editDoctorProfile(d)){
				Doctor updateDoctor = dao.getDoctorById(id);
				session.setAttribute("succMsgd", "Doctor updated successfully");
				session.setAttribute("doctObj", updateDoctor);
				resp.sendRedirect("Doctor/EditProfile.jsp");
			}
			else {
				session.setAttribute("errMsgd", "Something wrong on server");
				resp.sendRedirect("Doctor/EditProfile.jsp");
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
