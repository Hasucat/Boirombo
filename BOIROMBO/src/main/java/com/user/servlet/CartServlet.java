package com.user.servlet;

import java.io.IOException;

import com.DAO.BookDAOimpl;
import com.DAO.CartDAOimpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@SuppressWarnings("serial")
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
			BookDetails b= dao.getBookById(bid);
			
			Cart c=new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookname());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOimpl dao2=new CartDAOimpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			
			
			HttpSession session=req.getSession();
			if (f)
			{
				session.setAttribute("addCart","Book added to Cart");
				resp.sendRedirect("all_new_book.jsp");
			}else {
				session.setAttribute("Failed","Something wrong on server....");
				resp.sendRedirect("all_new_book.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}