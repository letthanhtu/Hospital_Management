<%@page import="com.db.DBConnect" %> <%@page import="java.sql.Connection" %> <%@
page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <%@include file="component/allcss.jsp" %>
    <style type="text/css">
      .paint-card {
        box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
      }
    </style>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
   
   
   
  </head>
 
  <body>
    <!-- Navbar -->
    <%@include file="component/navbar.jsp" %>
    <!-- Navbar -->
    <div
      id="carouselExampleControls"
      class="carousel slide"
      data-bs-ride="carousel"
    >
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img
            src="img/hos2.jpg"
            class="d-block w-100"
            alt="..."
            height="600px"
          />
        </div>
        <div class="carousel-item">
          <img
            src="img/hos1.jpg"
            class="d-block w-100"
            alt="..."
            height="600px"
          />
        </div>
        <div class="carousel-item">
          <img
            src="img/hos3.jpg"
            class="d-block w-100"
            alt="..."
            height="600px"
          />
        </div>
      </div>
      <button
        class="carousel-control-prev"
        type="button"
        data-bs-target="#carouselExampleControls"
        data-bs-slide="prev"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button
        class="carousel-control-next"
        type="button"
        data-bs-target="#carouselExampleControls"
        data-bs-slide="next"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
    <div class="ourdoc">
      <div class="container p-3">
        <p class="text-center fs-2">
          Các đặc điểm nổi bật của bệnh viện chúng tôi
        </p>

        <div class="row">
          <div class="col-md-8 p-5">
            <div class="row">
              <div class="col-md-6">
                <div class="card paint-card">
                  <div class="card-body">
                    <p class="fs-5">An toàn 100%</p>
                    <p>
                      Chúng tôi cam kết mang đến môi trường điều trị an toàn
                      tuyệt đối, đảm bảo sức khỏe và sự an tâm cho bệnh nhân.
                    </p>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card paint-card">
                  <div class="card-body">
                    <p class="fs-5">Môi trường sạch sẽ</p>
                    <p>
                      Bệnh viện luôn duy trì không gian sạch sẽ và hợp vệ sinh,
                      đáp ứng các tiêu chuẩn nghiêm ngặt về y tế.
                    </p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 mt-2">
                <div class="card paint-card">
                  <div class="card-body">
                    <p class="fs-5">Bác sĩ thân thiện</p>
                    <p>
                      Đội ngũ bác sĩ giàu kinh nghiệm, luôn tận tâm chăm sóc và
                      mang đến sự thoải mái cho bệnh nhân.
                    </p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 mt-2">
                <div class="card paint-card">
                  <div class="card-body">
                    <p class="fs-5">Nghiên cứu y khoa</p>
                    <p>
                      Chúng tôi tiên phong trong các nghiên cứu y khoa, không
                      ngừng nâng cao chất lượng khám chữa bệnh.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-md-4">
            <img style="margin-top: 64px" alt="" src="img/doc1.jpg" />
          </div>
        </div>
      </div>
    </div>
    <div class="ourdoc">
      <div class="container p-2">
        <p class="text-center fs-2">Đội ngũ của chúng tôi</p>

        <div class="row">
          <div class="col-md-3">
            <div class="card paint-card">
              <div class="card-body text-center">
                <img src="img/doc11.jpg" width="250px" height="300px" />
                <p class="fw-bold fs-5">Nguyễn Hồng Loan</p>
                <p class="fs-7">(CEO & Founder)</p>
              </div>
            </div>
          </div>

          <div class="col-md-3">
            <div class="card paint-card">
              <div class="card-body text-center">
                <img src="img/doc7.jpg" width="250px" height="300px" />
                <p class="fw-bold fs-5">Lê Thị Thanh Tú</p>
                <p class="fs-7">(Bác sĩ trưởng)</p>
              </div>
            </div>
          </div>

          <div class="col-md-3">
            <div class="card paint-card">
              <div class="card-body text-center">
                <img src="img/doc13.jpg" width="250px" height="300px" />
                <p class="fw-bold fs-5">Lê Văn Phúc</p>
                <p class="fs-7">(Bác sĩ trưởng)</p>
              </div>
            </div>
          </div>

          <div class="col-md-3">
            <div class="card paint-card">
              <div class="card-body text-center">
                <img src="img/doc5.jpg" width="250px" height="300px" />
                <p class="fw-bold fs-5">Trịnh Văn Nam</p>
                <p class="fs-7">(Bác sĩ trưởng)</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- ################# Our Departments Starts Here#######################--->

    <section id="services" class="key-features department">
      <div class="container">
        <div class="inner-title">
          <h2>Các dịch vụ chính của chúng tôi</h2>
          <p>Hãy xem một số dịch vụ chính của chúng tôi</p>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="single-key">
              <i class="fas fa-heartbeat"></i>
              <h5>Tim mạch</h5>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="single-key">
              <i class="fas fa-ribbon"></i>
              <h5>Chỉnh hình</h5>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="single-key">
              <i class="fab fa-monero"></i>
              <h5>Thần kinh</h5>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="single-key">
              <i class="fas fa-capsules"></i>
              <h5>Dược phẩm</h5>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="single-key">
              <i class="fas fa-prescription-bottle-alt"></i>
              <h5>Đội ngũ dược phẩm</h5>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="single-key">
              <i class="far fa-thumbs-up"></i>
              <h5>Phương pháp điều trị chất lượng cao</h5>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!--  ************************* Gallery Starts Here ************************** -->
    <div id="gallery" class="gallery">
      <div class="container">
        <div class="inner-title">
          <h2>Phòng trưng bày của chúng tôi</h2>
          <p>Xem phòng trưng bày của chúng tôi</p>
        </div>
        <div class="row">
          <div class="gallery-filter d-none d-sm-block">
            <button class="btn btn-default filter-button" data-filter="all">
              Tất cả
            </button>
            <button class="btn btn-default filter-button" data-filter="hdpe">
              Nha khoa
            </button>
            <button
              class="btn btn-default filter-button"
              data-filter="sprinkle"
            >
              Tim mạch
            </button>
            <button class="btn btn-default filter-button" data-filter="spray">
              Thần kinh
            </button>
            <button
              class="btn btn-default filter-button"
              data-filter="irrigation"
            >
              Phòng thí nghiệm
            </button>
          </div>
          <br />

          <div
            class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe"
          >
            <img src="img/gallery/gallery_01.jpg" class="img-responsive" />
          </div>

          <div
            class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter sprinkle"
          >
            <img src="img/gallery/gallery_02.jpg" class="img-responsive" />
          </div>

          <div
            class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe"
          >
            <img src="img/gallery/gallery_03.jpg" class="img-responsive" />
          </div>

          <div
            class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter irrigation"
          >
            <img src="img/gallery/gallery_04.jpg" class="img-responsive" />
          </div>

          <div
            class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter spray"
          >
            <img src="img/gallery/gallery_05.jpg" class="img-responsive" />
          </div>

          <div
            class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter spray"
          >
            <img src="img/gallery/gallery_06.jpg" class="img-responsive" />
          </div>
        </div>
      </div>
    </div>
    <!--  ************************* Contact Us Starts Here ************************** -->

    <section id="contact_us" class="contact-us-single">
      <div class="row no-margin">
        <div class="col-sm-12 cop-ck">
          <form method="post">
            <h2>Liên hệ</h2>
            <div class="row cf-ro">
              <div class="col-sm-3"><label>Họ và tên:</label></div>
              <div class="col-sm-8">
                <input
                  type="text"
                  placeholder="Nhập họ và tên"
                  name="fullname"
                  class="form-control input-sm"
                  required
                />
              </div>
            </div>
            <div class="row cf-ro">
              <div class="col-sm-3"><label>Email:</label></div>
              <div class="col-sm-8">
                <input
                  type="text"
                  name="emailid"
                  placeholder="Nhập địa chỉ Email"
                  class="form-control input-sm"
                  required
                />
              </div>
            </div>
            <div class="row cf-ro">
              <div class="col-sm-3"><label>Số điện thoại:</label></div>
              <div class="col-sm-8">
                <input
                  type="text"
                  name="mobileno"
                  placeholder="Nhập số điện thoại"
                  class="form-control input-sm"
                  required
                />
              </div>
            </div>
            <div class="row cf-ro">
              <div class="col-sm-3"><label>Tin nhắn:</label></div>
              <div class="col-sm-8">
                <textarea
                  rows="5"
                  placeholder="Nhập tin nhắn bạn muốn trao đổi với chúng tôi"
                  class="form-control input-sm"
                  name="description"
                  required
                ></textarea>
              </div>
            </div>
            <div class="row cf-ro">
              <div class="col-sm-3"><label></label></div>
              <div class="col-sm-8">
                <button
                  class="btn btn-success btn-sm"
                  type="submit"
                  name="submit"
                >
                  Gửi tin nhắn
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </section>
    <%@include file="component/footer.jsp" %>
  </body>
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="plugins/scroll-nav/js/jquery.easing.min.js"></script>
  <script src="plugins/scroll-nav/js/scrolling-nav.js"></script>
  <script src="plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>

  <script src="js/script.js"></script>
</html>
