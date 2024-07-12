package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.entity.User;
@WebServlet("/user_register")

public class Register extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			try {
				
				String fullName = req.getParameter("name");
				String email = req.getParameter("email");
				String password = req.getParameter("password");
				
				User u = new User(fullName, email, password);
				
				UserDAO dao = new UserDAO(DBConnect.getConn());
				 
				boolean f= dao.UserRegister(u);
				
				HttpSession session = req.getSession();
				
				if(f==true) {
					session.setAttribute("succMsg", "Register Successfully");
					resp.sendRedirect("signup.jsp");
					
				}
				else {
					session.setAttribute("errMsg", "Something wrong on server");
					resp.sendRedirect("signup.jsp");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
	
	}
	
}
