package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import com.DAO.UserDAOimpl;
import com.DB.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			UserDAOimpl dao=new UserDAOimpl(DBConnect.getConn());
			
			HttpSession session=req.getSession();
			
			String email=req.getParameter("email");
			String password=req.getParameter("password");

			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User us=new User();
				us.setName("Admin");
				session.setAttribute("user",us);
				resp.sendRedirect("admin/home.jsp");
			}else {
				
				User us=dao.login(email,password);
				if (us!=null)
				{		
					session.setAttribute("user",us);	
					resp.sendRedirect("index.jsp");
						
				}else {
					session.setAttribute("Failed","Invalid Email or Password");
					resp.sendRedirect("login.jsp");
					}
				}
				
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	

}
