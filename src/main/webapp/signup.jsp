<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="component/allcss.jsp" %>
<style type="text/css">
		.paint-card {
			box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	}
	</style>
</head>
<body>
<%@ include file="component/navbar.jsp" %>


<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Đăng ký người dùng</p>
						
						<c:if test="${not empty sucMsg }">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-3">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						
						<form action="user_register" method="post">
						
						<div class="mb-3">
								<label class="form-label">Họ và tên</label> <input required
									name="fullname" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input required
									name="email" type="email" class="form-control">
							</div>
							<div class="row mb-3">
								<!-- Age -->
								<div class="col-md-6">
									<label class="form-label">Tuổi</label>
									<input required name="age" type="number" class="form-control">
								</div>

								<!-- Gender -->
								<div class="col-md-6">
									<label class="form-label">Giới tính</label>
									<select name="gender" class="form-select" required>
										<option value="Nam">Nam</option>
										<option value="Nữ">Nữ</option>
									</select>
								</div>
							</div>

							<!-- Phone Number -->
							<div class="mb-3">
								<label class="form-label">SĐT</label>
								<input required name="phone_number" type="text" class="form-control">
							</div>

							<!-- Address -->
							<div class="mb-3">
								<label class="form-label">Địa chỉ</label>
								<input required name="address" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Mật khẩu</label> <input required
																				  name="password" type="password" class="form-control">
							</div>
							<button type="submit" class="btn bg-success text-white col-md-12">Đăng ký</button>
						</form>
						<br> Bạn đã có tài khoản <a href="user_login.jsp"
													   class="text-decoration-none"> Đăng Nhập</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>