package com.user.servlet;

import java.io.IOException;

import com.DAO.BookDAOimpl;
import com.DB.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String em=req.getParameter("em");
			int id=Integer.parseInt(req.getParameter("id"));
			BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
			boolean f= dao.deleteOldBooks(em,"Old",id);
			
			
			HttpSession session=req.getSession();
			if (f)
			{
				session.setAttribute("Success","Old book has been deleted");
				resp.sendRedirect("old_book.jsp");
			}else {
				session.setAttribute("Failed","Something wrong on server....");
				resp.sendRedirect("old_book.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
