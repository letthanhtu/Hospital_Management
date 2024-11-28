package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDAO;
import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/deleteAppointment")
public class DeleteAppointment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  req.setCharacterEncoding("UTF-8");

		int id = Integer.parseInt(req.getParameter("id"));
		
		AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.deleteAppointment(id)) {
			session.setAttribute("succMsg", "Xóa lịch thành công.");
			resp.sendRedirect("view_appointment.jsp");
		} else {
			session.setAttribute("errorMsg", "Xóa không thành công");
			resp.sendRedirect("view_appointment.jsp");
		}
		

	}

}