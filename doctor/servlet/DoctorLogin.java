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
@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		Doctor d = dao.login(email, password);
		
		if(d != null) {
			
			session.setAttribute("doctObj", d);
			resp.sendRedirect("Doctor/index.jsp");
		}
		else {
			session.setAttribute("errMsg", "id or password incorrect");
			resp.sendRedirect("doctor_login.jsp");
		}
	}

}
