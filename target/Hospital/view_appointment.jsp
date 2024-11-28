<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hos1.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Danh sách lịch khám</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<table class="table">
						    <thead>
						        <tr>
						            <th scope="col">Họ và tên</th>
						            <th scope="col">Giới tính</th>
						            <th scope="col">Tuổi</th>
						            <th scope="col">Ngày hẹn khám</th>
						            <th scope="col">Bệnh án</th>
						            <th scope="col">Bác sĩ</th>
						            <th scope="col">Trạng thái</th>
						            <th scope="col">Thao tác</th>
						        </tr>
						    </thead>
						    <tbody>
						        <%
						        User user = (User) session.getAttribute("userObj");
						        AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
						        DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
						        List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
						
						        if (list.isEmpty()) {
						        %>
						            <tr>
						                <td colspan="8" class="text-center">Không có lịch nào đã đặt</td>
						            </tr>
						        <%
						        } else {
						            for (Appointment ap : list) {
						                Doctor d = dao2.getDoctorById(ap.getDoctorId());
						        %>
						                <tr>
						                    <td><%= ap.getFullName() %></td>
						                    <td><%= ap.getGender() %></td>
						                    <td><%= ap.getAge() %></td>
						                    <td><%= ap.getAppoinDate() %></td>
						                    <td><%= ap.getDiseases() %></td>
						                    <td><%= d.getFullName() %></td>
						                    <td>
						                        <%
												if ("Chưa khám".equals(ap.getStatus())) {
												%> 
												<span class="btn btn-warning  btn-sm disabled"style="width:100px">Chưa duyệt</span> 
												 <%
												 } else {
												 %> 
												 <span class="btn btn-success btn-sm disabled"style="width:100px">Đã duyệt</span> 
												 <%
												 }
												 %>
						                    </td>
						                    <td>
						                    <a href="view_patient.jsp?id=<%=ap.getId()%>"
										class="btn btn-sm btn-primary">Xem</a>
												<button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal<%=ap.getId()%>">
													Xóa
												</button>
											</td>
										</tr>

								<!-- Modal Xác nhận Xóa -->
								<div class="modal fade" id="deleteModal<%=ap.getId()%>" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa</h5>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												Bạn có chắc chắn muốn xóa Lịch Hẹn Sau không?
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
												<a href="../deleteAppointment?id=<%=ap.getId()%>" class="btn btn-primary">Xóa</a>
											</div>
										</div>
									</div>
								</div>
								<% }
								}%>
							</tbody>
						</table>

						

					</div>
				</div>
			</div>
			<div class="col-md-3 p-3">
				<img alt="" src="img/doc1.jpg">
			</div>
		</div>
	</div>
	
</body>
</html>