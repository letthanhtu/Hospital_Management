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

@WebServlet("/patientUpdateProfile")
public class EditProfile extends HttpServlet {
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				req.setCharacterEncoding("UTF-8"); // Đảm bảo yêu cầu (request) sử dụng UTF-8
				resp.setContentType("text/html; charset=UTF-8"); // Đảm bảo phản hồi (response) sử dụng UTF-8
				// Lấy dữ liệu từ form
				String fullName = req.getParameter("fullName");
				String email = req.getParameter("email");
				String password = req.getParameter("password");
				int age = Integer.parseInt(req.getParameter("age"));
				String phoneNumber = req.getParameter("phoneNumber");
				String address = req.getParameter("address");
				String gender = req.getParameter("gender");

				int id = Integer.parseInt(req.getParameter("id"));

				// Tạo đối tượng User mới từ dữ liệu form
				User user = new User(fullName, email, password, age, phoneNumber, address, gender);
				user.setId(id);

				// Tạo đối tượng UserDao để thực hiện thao tác với cơ sở dữ liệu
				UserDao dao = new UserDao(DBConnect.getConn());
				HttpSession session = req.getSession();

				// Cập nhật thông tin bệnh nhân trong cơ sở dữ liệu
				if (dao.editUserProfile(user)) {
					User updatedUser = dao.getUserById(id);  // Lấy lại thông tin đã cập nhật
					session.setAttribute("succMsgs", "Cập nhật thông tin thành công.");
					session.setAttribute("userObj", updatedUser);  // Lưu đối tượng User vào session
					resp.sendRedirect("change_password.jsp");  // Điều hướng về trang edit_profile.jsp
				} else {
					session.setAttribute("errorMsgs", "Cập nhật thông tin không thành công.");
					resp.sendRedirect("change_password.jsp");  // Quay lại trang chỉnh sửa
				}
			} catch (Exception e) {
				e.printStackTrace();
				resp.sendRedirect("change_password.jsp");
			}
		}
	}