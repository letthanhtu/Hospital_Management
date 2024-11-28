<%@page import="com.entity.User"%>
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
    <%@include file="component/allcss.jsp"%>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
<%@include file="component/navbar.jsp"%>

<!-- Chi tiết bệnh nhân -->
<div class="row mt-4">
    <div class="col-md-10  offset-md-1 ">
        <div class="card paint-card">
            <div class="card-body">
                <p class="fs-4 text-center">Chi tiết bệnh nhân</p>
                <c:if test="${not empty errorMsg}">
                <p class="fs-3 text-center text-danger">${errorMsg}</p>
                    <c:remove var="errorMsg" scope="session" />
                </c:if>
                <c:if test="${not empty succMsg}">
                <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                    <c:remove var="succMsg" scope="session" />
                </c:if>
                <table class="table table-bordered">
                    <tbody>
                        <%
                            int id = Integer.parseInt(request.getParameter("id"));
                            AppointmentDAO dao2 = new AppointmentDAO(DBConnect.getConn());
                            Appointment	 d = dao2.getAppointmentById(id);
						
                            DoctorDao dao = new DoctorDao(DBConnect.getConn());
							Doctor d1 = dao.getDoctorNameById(d.getDoctorId());
								%>
                    <tr>
                        <th>Tên bệnh nhân</th>
                        <td><%=d.getFullName()%></td>
                        <th>Email</th>
                        <td><%=d.getEmail()%></td>
                    </tr>
                    <tr>
                        <th>Số điện thoại bệnh nhân</th>
                        <td><%=d.getPhNo() %></td>
                        <th>Địa chỉ bệnh nhân</th>
                        <td><%=d.getAddress() %></td>
                    </tr>
                    <tr>
                        <th>Giới tính</th>
                        <td><%=d.getGender() %></td>
                        <th>Lịch sử bệnh án của bệnh nhân (nếu có)</th>
                        <td><%=d.getDiseases() %></td>
                    </tr>
                    <tr>
                        <th>Tuổi</th>
                        <td><%=d.getAge() %></td>
                        <th>Bác sĩ điều trị</th>
                        <td><%=d1.getFullName() %></td>
                    </tr>
                        <tr >
                            <th>Chuẩn đoán của bác sĩ</th>
                            <td colspan="3"><%=d.getStatus() %></td>
                        </tr>
                        <%

                        %>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



</body>
</html>