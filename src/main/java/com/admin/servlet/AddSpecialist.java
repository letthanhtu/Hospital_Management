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
import com.entity.User;

@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String specName = req.getParameter("specName");

		SpecialistDao dao = new SpecialistDao(DBConnect.getConn());

		HttpSession session = req.getSession();

		if (dao.checkSpecialist(specName)) {
			session.setAttribute("errorMsg", "Chuyên khoa đã tồn tại.");
			resp.sendRedirect("admin/index.jsp");
		} else {
			boolean f = dao.addSpecialist(specName);

			if (f) {
				session.setAttribute("succMsg", "Thêm chuyên khoa thành công..");
				resp.sendRedirect("admin/index.jsp");
			} else {
				session.setAttribute("errorMsg", "Thêm không thành công");
				resp.sendRedirect("admin/index.jsp");
			}
		}

	}

}