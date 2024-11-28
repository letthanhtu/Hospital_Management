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
  </style>
</head>
<body>
<%@include file="component/navbar.jsp"%>

<c:if test="${ empty userObj }">
  <c:redirect url="user_login.jsp"></c:redirect>
</c:if>
<div class="container p-4">
  <div class="row">
    <div class="col-md-4">
      <div class="card paint-card">
        <p class="text-center fs-3">Đổi mật khẩu</p>
        <c:if test="${not empty succMsg }">
          <p class="text-center text-success fs-3">${succMsg}</p>
          <c:remove var="succMsg" scope="session" />
        </c:if>

        <c:if test="${not empty errorMsg }">
          <p class="text-center text-danger fs-5">${errorMsg}</p>
          <c:remove var="errorMsg" scope="session" />
        </c:if>
        <div class="card-body">
          <form action="userChangePassword" method="post">
            <div class="mb-3">
              <label>Mật khẩu mới</label> <input type="password"
                                                 name="newPassword" class="form-control" required>
            </div>

            <div class="mb-3">
              <label>Mật khẩu cũ</label> <input type="password"
                                                name="oldPassword" class="form-control" required>
            </div>
            <input type="hidden" value="${userObj.id }" name="uid">
            <button class="btn btn-success col-md-12">Thay đổi</button>
          </form>
        </div>
      </div>
    </div>
    <div class="col-md-5 offset-md-2">
      <div class="card paint-card">
        <p class="text-center fs-3">Chỉnh sửa thông tin cá nhân</p>
        <c:if test="${not empty succMsg}">
          <p class="text-center text-success fs-3">${succMsg}</p>
        </c:if>
        <c:if test="${not empty errorMsg}">
          <p class="text-center text-danger fs-5">${errorMsg}</p>
        </c:if>
        <div class="card-body">
          <form action="../patientUpdateProfile" method="post">
            <!-- Form thông tin -->
            <div class="mb-3">
              <label class="form-label">Họ và tên</label>
              <input type="text" name="fullName" class="form-control" required value="${userObj.fullName}">
            </div>
            <div class="mb-3">
              <label class="form-label">Email</label>
              <input type="email" name="email" class="form-control" readonly required value="${userObj.email}">
            </div>
            <div class="mb-3">
              <label class="form-label">Tuổi</label>
              <input type="number" name="age" class="form-control" required value="${userObj.age}">
            </div>
            <div class="mb-3">
              <label class="form-label">Số điện thoại</label>
              <input type="text" name="phoneNumber" class="form-control" required value="${userObj.phoneNumber}">
            </div>
            <div class="mb-3">
              <label class="form-label">Địa chỉ</label>
              <input type="text" name="address" class="form-control" required value="${userObj.address}">
            </div>
            <div class="mb-3">
              <label class="form-label">Giới tính</label>
              <select name="gender" class="form-control" required>
                <option value="Male" ${userObj.gender == 'Male' ? 'selected' : ''}>Nam</option>
                <option value="Female" ${userObj.gender == 'Female' ? 'selected' : ''}>Nữ</option>
                <option value="Other" ${userObj.gender == 'Other' ? 'selected' : ''}>Khác</option>
              </select>
            </div>
            <input type="hidden" name="id" value="${userObj.id}">
            <button type="submit" class="btn btn-success col-12">Cập nhật</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>