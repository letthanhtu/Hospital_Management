<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>


	<%@include file="navbar.jsp"%>


	<%
	Doctor d = (Doctor) session.getAttribute("doctObj");
	DoctorDao dao = new DoctorDao(DBConnect.getConn());
	%>
		<div class="container p-5 mt-5 card paint-card" >
	  	<div class="row">    
	   		<div class="col-md-4">
	      		<img src="../img/card.png" alt="" class="img-fluid">
	    	</div>
	
	    
	    	<div class="col-md-8 mt-3 ">
	      		<p class="mb-0">Bác sĩ</p>
	      		<h2 class="text-success mt-1">${doctObj.fullName }</h2>
			     <p class="mt-3 mt-0">Chào mừng bạn đến với hệ thống quản lý của bệnh viện! Đây là trang cá nhân của bác sĩ, nơi cung cấp các thông tin về bệnh nhân, theo dõi lịch trình và cập nhật thông tin điều trị một cách nhanh chóng và thuận tiện.</p>
	    	</div>
	  </div>
	</div>
	
	<p class="text-center fs-3 mt-3 mb-0">Thống kê</p>
	
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-2 mt-4">
				<div class="card paint-card">
					<div class="card-body text-right text-white d-flex align-items-center justify-content-center" style="background: linear-gradient(to left, #fba2f6 49%, #75cee8 80%);">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center ms-auto  mb-0 fw-bold">
							Tổng bác sĩ <br><%=dao.countDoctor()%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-4" >
				<div class="card paint-card">
				<a href="patient.jsp" class="text-white text-decoration-none">
					<div class="card-body text-right text-white d-flex align-items-center justify-content-center" style="background: linear-gradient(to left, #9cb8ed 49%, #cd7cdb 80%);">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center ms-auto  mb-0 fw-bold">
							Tổng lịch hẹn <br>
							<%=dao.countAppointmentByDocotrId(d.getId())%>
						</p>
					</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>