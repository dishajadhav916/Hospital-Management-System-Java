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
@WebServlet("/doctorChangePassword")
public class DoctorPasswordChange extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int uid = Integer.parseInt(req.getParameter("uid"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		HttpSession session = req.getSession();
		
		if(dao.checkOldPassword(uid, oldPassword)) {
			if(dao.changePassword(uid, newPassword)) {
				session.setAttribute("succMsg", "Password change succesfully");
				resp.sendRedirect("Doctor/EditProfile.jsp");
			}
			else {
				session.setAttribute("errMsg", "Something wrong on server");
				resp.sendRedirect("Doctor/EditProfile.jsp");
			}
		}
		else {
			session.setAttribute("errMsg", "Old Password Incoorect");
			resp.sendRedirect("Doctor/EditProfile.jsp");
		}
	}
}
