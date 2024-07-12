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
@WebServlet("/user_Login")
public class UserLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserDAO dao = new UserDAO(DBConnect.getConn());
		User u = dao.login(email, password);
		
		HttpSession session = req.getSession();
		
		if(u != null) {
			
			session.setAttribute("userobj", u);
			resp.sendRedirect("index.jsp");
		}
		else {
			session.setAttribute("errMsg", "id or password incorrect");
			resp.sendRedirect("user_login.jsp");
		}
	}

	
}
