<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}


</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>


	<div class="container p-3">
		<div class="row">


			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">Đặt lịch hẹn khám</p>
						<c:if test="${empty userObj }">
							<a href="user_login.jsp"
							   class="d-flex justify-content-center title btn-danger border border-warning m-3 p-2"
							   style="text-decoration: none;">
								Vui lòng đăng nhập để đặt lịch hẹn
							</a>


						</c:if>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form class="row g-3" action="appAppointment" method="post">

							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<%--@declare id="inputemail4"--%><label for="inputEmail4" class="form-label">Họ và tên</label> <input
									required type="text" class="form-control" name="fullname" value="${userObj.fullName }" readonly>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Giới tính</label>
								<input type="text" class="form-control" name="gender" value="${userObj.gender}" readonly>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Tuổi</label> <input
									required type="number" class="form-control" name="age" value="${userObj.age }" readonly>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Ngày hẹn khám</label>
								<input type="date" class="form-control" required
									name="appoint_date">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" name="email" value="${userObj.email }" readonly>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Số điện thoại</label> <input
									maxlength="10" required type="number" class="form-control"
									name="phno" value="${userObj.phoneNumber}" readonly>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Bệnh án</label> <input
									required type="text" class="form-control" name="diseases">
							</div>

							<div class="col-md-6">
								<%--@declare id="inputpassword4"--%><label for="inputPassword4" class="form-label">Bác sĩ</label> <select
									required class="form-control" name="doct">
									<option value="">--chọn bác sĩ điều trị--</option>

									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)
									</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="col-md-12">
								<label for="inputEmail4" class="form-label">Địa chỉ</label>
								<input required type="text" class="form-control" name="address" value="${userObj.address}" readonly>
							</div>
							<c:if test="${empty userObj }">
								<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Đặt lịch</a>
							</c:if>

							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-success">Đặt lịch</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-4 p-5 ">
				<img alt="" src="img/doc1.jpg">
			</div>
		</div>

	</div>
	<%@include file="component/footer.jsp"%>

</body>
</html>