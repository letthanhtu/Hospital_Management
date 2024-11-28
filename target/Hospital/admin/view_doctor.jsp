<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
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
	<div class="container-fluid p-3">
		<div class="row">

			
			
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Danh sách bác sĩ</p>
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
									<th scope="col">Họ và tên</th>
									<th scope="col">Ngày sinh</th>
									<th scope="col">Trình độ</th>
									<th scope="col">Chuyên khoa</th>
									<th scope="col">Email</th>
									<th scope="col">Số điện thoại liên hệ</th>
									<th scope="col">Thao tác</th>
								</tr>
							</thead>
							<tbody>
							<%
								DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
								List<Doctor> list2 = dao2.getAllDoctor();
								for (Doctor d : list2) {
								%>
								<tr>
									<td><%=d.getFullName()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQualification()%></td>
									<td><%=d.getSpecialist()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getMobNo()%></td>
									<td><a href="edit_doctor.jsp?id=<%=d.getId()%>"
										class="btn btn-sm btn-primary">Sửa</a>

										<button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal<%=d.getId()%>">
											Xóa
										</button>

										<!-- Modal Xác nhận Xóa -->
										<div class="modal fade" id="deleteModal<%=d.getId()%>" tabindex="-1" aria-labelledby="deleteModalLabel<%=d.getId()%>" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="deleteModalLabel<%=d.getId()%>">Xác nhận xóa</h5>
														<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														Bạn có chắc chắn muốn xóa bác sĩ "<%=d.getFullName()%>" không?
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
														<a href="../deleteDoctor?id=<%=d.getId()%>" class="btn btn-primary">Xóa</a>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
							<%
								}
							%>
							</tbody>
							</table>

						</div>
					</div>
				</div>


			</div>
		</div>
	</body>
	</html>