<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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
<c:if test="${empty doctObj }">
	<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>
<%@include file="navbar.jsp"%>
<div class="container p-3">
	<div class="row">

		<div class="col-md-12">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-3 text-center">Danh sách bệnh nhân</p>
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
							<th scope="col">Email</th>
							<th scope="col">Số điện thoại</th>
							<th scope="col">Bệnh trạng</th>
							<th scope="col">Hành động</th>
							<th scope="col">Thao tác</th>
						</tr>
						</thead>
						<tbody>
							<%
								Doctor d = (Doctor) session.getAttribute("doctObj");
								AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
								List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
								for (Appointment ap : list) {
								%>
						<tr>
							<th><%=ap.getFullName()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppoinDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getDiseases()%></td>
							<td>
								<%
									if ("Chưa khám".equals(ap.getStatus())) {
								%>
								<a href="comment.jsp?id=<%=ap.getId()%>"
								   class="btn btn-success btn-sm " style="width:100px">Chưa duyệt</a>
								<%
								} else {
								%>
								<a href="comment.jsp" class="btn btn-success btn-sm disabled"style="width:100px">Đã duyệt</a>
								<%
									}
								%>
							</td>
							<td><a href="view_patient.jsp?id=<%=ap.getId()%>"
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
											Bạn có chắc chắn muốn xóa bệnh nhân "<%=ap.getFullName()%>" không?
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
											<a href="../doctorDeleteDoctor?id=<%=ap.getId()%>" class="btn btn-primary">Xóa</a>
										</div>
									</div>
								</div>
							</div>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>