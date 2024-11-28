<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Danh sách lịch hẹn</p>
				<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Ngày hẹn khám</th>
							<th scope="col">Họ và tên</th>
							<th scope="col">Giới tính</th>
							<th scope="col">Tuổi</th>					
							<th scope="col">Email</th>
							<th scope="col">Số điện thoại liên hệ</th>
							
							<th scope="col">Bác sĩ</th>
						
							<th scope="col">Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<%
						AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
						DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
						List<Appointment> list = dao.getAllAppointment();
					 	if (list.isEmpty()) {
					        %>
					            <tr>
					                <td colspan="10" class="text-center">Không có lịch nào</td>
					            </tr>
					        <%
					   }else {
						for (Appointment ap : list) {
							Doctor d = dao2.getDoctorById(ap.getDoctorId());
						%>
						<tr>
						<th><%=ap.getAppoinDate()%></th>
							<th><%=ap.getFullName()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>							
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							
							<td><%=d.getFullName()%></td>
							
							<!-- <td><%=ap.getStatus()%></td> -->
							<td>
								<a href="view_patient.jsp?id=<%=ap.getId()%>"
										class="btn btn-sm btn-primary">Xem</a>
			                    <a href="../adminDeletePatient?id=<%= ap.getId() %>" class="btn btn-sm btn-danger">Xóa</a>
			                </td>
						</tr>
						<%
						}
						}
						%>


					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>