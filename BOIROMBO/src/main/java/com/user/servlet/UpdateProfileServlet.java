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
@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			
			
		    
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			
			
			HttpSession session=req.getSession();
		
			UserDAOimpl dao=new UserDAOimpl(DBConnect.getConn());
			boolean f=dao.checkPassword(id,password);
			
			if(f)
			{
				boolean f2=dao.updateProfile(us);
				if(f2)
				{
					session.setAttribute("Success","Profile Updated successfully");
					resp.sendRedirect("edit_profile.jsp");
					
				}else {
					session.setAttribute("Failed","Something wrong on server....");
					resp.sendRedirect("edit_profile.jsp");
				}
				
			}else {
				session.setAttribute("Failed","Invalid Password");
				resp.sendRedirect("edit_profile.jsp");
			}
		
		}catch (Exception e){
			e.printStackTrace();
		}
	}

}
