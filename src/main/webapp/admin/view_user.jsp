<%@page import="com.entity.User"%>
<%@page import="com.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
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

			
			
			<div class="col-md-8 offset-md-2">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Danh sách người dùng</p>
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
									<th scope="col">Email</th>
									<th scope="col">Thao tác</th>
								</tr>
							</thead>
							<tbody>
							<%
								UserDao dao2 = new UserDao(DBConnect.getConn());
								List<User> list2 = dao2.getAllUser();
								for (User d : list2) {
								%>
								<tr>
									<td><%=d.getFullName()%></td>
									<td><%=d.getEmail()%></td>
									<td>
									<button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal<%=d.getId()%>">
										Xóa
									</button>
									</td>
								</tr>

							<!-- Modal Xác nhận Xóa -->
							<div class="modal fade" id="deleteModal<%=d.getId()%>" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											Bạn có chắc chắn muốn xóa người dùng"<%=d.getFullName()%>" không?
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
											<a href="../deleteUser?id=<%=d.getId()%>" class="btn btn-primary">Xóa</a>
										</div>
									</div>
								</div>
							</div>
							<%
								}%>
							</tbody>
						</table>

					</div>
				</div>
			</div>

			
		</div>
	</div>
</body>
</html>