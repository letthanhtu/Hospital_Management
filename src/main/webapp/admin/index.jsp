<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specalist"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp" %>
<style type="text/css">
	.paint-card {
		box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<div class="container p-5 mt-5 card paint-card" >
	  	<div class="row">    
	   		<div class="col-md-4">
	      		<img src="../img/card.png" alt="" class="img-fluid">
	    	</div>
	
	    
	    	<div class="col-md-8 mt-3 ">
	      		
	      		<h2 class="text-success">Xin chào Admin</h2>
			     <p class="mt-3">Hệ thống Quản lý Bệnh viện giúp bạn theo dõi và quản lý các hoạt động chính của bệnh viện một cách nhanh chóng, chính xác và tiện lợi. Dưới đây là những tính năng chính mà bạn có thể thực hiện trong hệ thống</p>
	    	</div>
	  </div>
	</div>

	
	
	<c:if test="${ empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>
	
	<div class="container p-5">
		<p class="text-center fs-3 text-success">Thống kê</p>
		<c:if test="${not empty errorMsg}">
			<p class="fs-3 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty succMsg}">
			<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<%DoctorDao dao= new DoctorDao(DBConnect.getConn());
		%>
		<div class="row">
			<div class="col-md-4 mt-4">
				<div class="card paint-card">
			 		<a href="view_doctor.jsp" class="text-white text-decoration-none">
						<div class="card-body text-right text-white d-flex align-items-center justify-content-center" style="background: linear-gradient(to left, #fba2f6 49%, #75cee8 80%);">
							<i class="fas fa-user-md fa-3x"></i>
							<p class="fs-4 text-center ms-auto  mb-0 fw-bold">
								Tổng bác sĩ <br><%=dao.countDoctor()%>
							</p>
						</div>
					</a>
				</div>
			
			</div>
		
			<div class="col-md-4 mt-4">
			    <div class="card paint-card">
			        <a href="view_user.jsp" class="text-white text-decoration-none">
			            <div class="card-body text-right text-white d-flex align-items-center justify-content-center" style="background: linear-gradient(to left, #f5b3c7 27%, #95eb95 94%);">
			                <i class="fas fa-user-circle fa-3x"></i>
			                <p class="fs-4 text-center ms-auto mb-0 fw-bold">
			                    Tổng người dùng <br><%=dao.countUSer() %>
			                </p>
			            </div>
			        </a>
			    </div>
			</div>

		<div class="col-md-4 mt-4">
				<div class="card paint-card">
					<a href="patient.jsp" class="text-white text-decoration-none">
						<div class="card-body text-rightr text-white d-flex align-items-center justify-content-center" style="background: linear-gradient(to left, #01cb75 27%, #9cb8ed 94%);">
							<i class="fas fa-user-circle fa-3x"></i>
							<p class="fs-4 text-center ms-auto  mb-0 fw-bold">
								Tổng bệnh nhân <br><%=dao.countPatient() %>
							</p>
						</div>
					</a>
				</div>
			</div>
			<div class="col-md-4 mt-4">
				<div class="card paint-card">
					<a href="view_appointment.jsp" class="text-white text-decoration-none">
						<div class="card-body text-right text-white d-flex align-items-center justify-content-center" style="background: linear-gradient(to left, #9cb8ed 49%, #cd7cdb 80%);">
							<i class="far fa-calendar-check fa-3x"></i>
							<p class="fs-4 text-center ms-auto  mb-0 fw-bold">
								Tổng lịch hẹn <br><%=dao.countAppointment() %>
							</p>
						</div>
					</a>
				</div>
			</div>
		
			<div class="col-md-4 mt-4">
				 <div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
				    <div class="card-body text-white d-flex align-items-center justify-content-center" style="background: linear-gradient(to left, #97ddc5 49%, #ffe176 94%);">
				      <i class="far fa-calendar-check fa-3x "></i>
				      <p class="fs-4 text-center ms-auto  mb-0 fw-bold">
				        Chuyên khoa <br><%=dao.countSpecialist() %>
				      </p>
				    </div>
				 </div>
			</div>


		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">Thêm chuyên khoa</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <form action="../addSpecialist" method="post">
	                    <div class="form-group">
	                        <label>Nhập tên chuyên khoa</label>
	                        <input type="text" name="specName" class="form-control" required>
	                    </div>
	                    <div class="text-center mt-3">
	                        <button type="submit" class="btn btn-primary">Thêm</button>
	                    </div>
	                </form>
	                <!-- Bảng hiển thị thông tin chuyên khoa -->
						<div class="container mt-4">
						    <h3 class="text-center">Danh sách chuyên khoa</h3>
						    <table class="table table-striped">
						        <thead>
						            <tr>
						                <th scope="col">#</th>
						                <th scope="col">Tên chuyên khoa</th>
						                <th scope="col">Thao tác</th>
						            </tr>
						        </thead>
						        <tbody>
						            <%
						            // Lấy danh sách chuyên khoa từ cơ sở dữ liệu
						            SpecialistDao specialistDAO = new SpecialistDao(DBConnect.getConn());
						            List<Specalist> specialists = specialistDAO.getAllSpecialist();
						
						            if (specialists.isEmpty()) {
						            %>
						                <tr>
						                    <td colspan="3" class="text-center">Không có chuyên khoa nào</td>
						                </tr>
						            <%
						            } else {
						                int index = 1;
						                for (Specalist spec : specialists) {
						            %>
						                    <tr>
						                        <th scope="row"><%= index++ %></th>
						                        <td><%= spec.getSpecialistName() %></td>
						                        <td>
						                            <a href="../deleteSpecialist?id=<%= spec.getId() %>" class="btn btn-sm btn-danger">Xóa</a>
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
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
	            </div>
	        </div>
	    </div>
	</div>



</body>
</html>