package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.DAO.BookOrderDAOimpl;
import com.DAO.CartDAOimpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			HttpSession session = req.getSession();
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");

			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;

			/*System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType);*/
			
			CartDAOimpl dao = new CartDAOimpl(DBConnect.getConn());
			List<Cart> list = dao.getBookByUser(id);
			
			
			if (list.isEmpty())
			{
				session.setAttribute("Failed", "Add item to your cart");
				resp.sendRedirect("cart.jsp");
			}else {
				
				BookOrderDAOimpl dao2 = new BookOrderDAOimpl(DBConnect.getConn());
				ArrayList<Book_Order> orderlist = new ArrayList<Book_Order>();
				Random r = new Random();
				for (Cart c : list) {
					Book_Order o = new Book_Order();
					o.setOrderId("BOOK-ORD-00" + r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(paymentType);
					orderlist.add(o);

				}
				if ("noselect".equals(paymentType)) 
				{
					session.setAttribute("Failed", "Please select payment method");
					resp.sendRedirect("cart.jsp");

				} else 
				{
					
					boolean f = dao2.saveOrder(orderlist);
					if (f) 
					{
						resp.sendRedirect("order_success.jsp");
					} else {
						session.setAttribute("Failed", "Your order placement is denied");
						resp.sendRedirect("cart.jsp");
					}

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
