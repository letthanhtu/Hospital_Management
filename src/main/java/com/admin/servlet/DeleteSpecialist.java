package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DBConnect;

@WebServlet("/deleteSpecialist")
public class DeleteSpecialist extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  req.setCharacterEncoding("UTF-8");

		int id = Integer.parseInt(req.getParameter("id"));
		
		SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.deleteSpecialist(id)) {
			session.setAttribute("succMsg", "Xóa chuyên khoa thành công..");
			resp.sendRedirect("admin/index.jsp");
		} else {
			session.setAttribute("errorMsg", "Xóa không thành công");
			resp.sendRedirect("admin/index.jsp");
		}
		

	}

}