package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/logout")
public class logoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session=req.getSession();
			session.removeAttribute("user");
			
			@SuppressWarnings("unused")
			HttpSession session2=req.getSession();
			session.setAttribute("Success","Logged Out");
			resp.sendRedirect("login.jsp");
		}catch (Exception e){
			e.printStackTrace();
	}

}
}
