package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;


@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  req.setCharacterEncoding("UTF-8");

		try {
			String fullName = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			int age = Integer.parseInt(req.getParameter("age"));
			String phoneNumber = req.getParameter("phone_number");
			String address = req.getParameter("address");
			String gender = req.getParameter("gender");

			User u = new User(fullName, email, password, age, phoneNumber, address, gender);

			UserDao dao = new UserDao(DBConnect.getConn());

			HttpSession session = req.getSession();
			boolean exist = dao.isEmailUsed(email);
			if (!exist){
				boolean f = dao.register(u);
				if (!isValidPhoneNumber(phoneNumber)) {
					session.setAttribute("errorMsg", "Số điện thoại không hợp lệ.");
					resp.sendRedirect("signup.jsp");
					return;
				}
			if (f) {
				session.setAttribute("sucMsg", "Đăng ký thành công");
				resp.sendRedirect("signup.jsp");


			} else {
				session.setAttribute("errorMsg", "Đăng ký không thành công");
				resp.sendRedirect("signup.jsp");
			}
			} else {
				session.setAttribute("errorMsg", "Email đã được sử dụng");
				resp.sendRedirect("signup.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	// Phương thức kiểm tra số điện thoại hợp lệ
	private boolean isValidPhoneNumber(String phno) {
		// Kiểm tra nếu số điện thoại không phải là số hoặc độ dài không bằng 10
		return phno != null && phno.matches("\\d{10}");
	}
}

