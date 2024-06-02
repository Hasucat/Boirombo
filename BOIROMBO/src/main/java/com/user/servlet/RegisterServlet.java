package com.user.servlet;
import java.io.IOException;
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
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
		    
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			HttpSession session=req.getSession();
		
		if (check!=null)
		{
			UserDAOimpl dao=new UserDAOimpl(DBConnect.getConn());
			boolean f2=dao.checkuser(email);
			
			if(f2)
			{
				boolean f=dao.userRegister(us);
				if(f)
				{
					session.setAttribute("Success","Registration done successfully");
					resp.sendRedirect("register.jsp");
						
				}else
				{
					session.setAttribute("Failed","Something wrong on server....");
					resp.sendRedirect("register.jsp");
				}
				
			}else {
				session.setAttribute("Failed","User already exists.Pls try another email.");
				resp.sendRedirect("register.jsp");
			}
		}else 
		{
			session.setAttribute("Failed","Please Agree Terms and Conditions");
			resp.sendRedirect("register.jsp");
		}
		
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
}
