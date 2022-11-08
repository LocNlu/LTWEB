<%@page import="model.bean.Account"%>
<%@page import="model.bean.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Yêu Sách Bookstore</title>
<link rel="icon" type="image/png" href="image/LOGO.ico"/>

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css"
	data-minify="1" />
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet" type="text/css" href="lib/css/sheet.css">
<link rel="stylesheet" type="text/css" href="lib/css/BEM_Style.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="lib/js/Cookies.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- Phần header cho trang Web -->
	<%@ include file="../comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
				<div class="board">


					<%
						Object result = request.getAttribute("userProfile");
						Account userPro = (Account) result;
						if (result != null && result instanceof Account) {

							String TenDangNhap = userPro.getTenDangNhap();
							String TenTaiKhoan = userPro.getTenTaiKhoan();
							String ChucVu = userPro.getChucVu();
							String GioiTinh = userPro.getGioiTinh();
							String NgaySinh = userPro.getNgaySinh();
							String DiaChi = userPro.getDiaChi();
							String SDT = userPro.getSdt();
							String Email = userPro.getEmail();
							out.println(
									"<div class=\"board__header\"><i class=\"fa fa-user-circle\" style=\"font-size: 30px !important;\"></i> <span class=\"title\" style=\"position: relative; bottom: 5px; margin: 0em 1em;\">"
											+ TenDangNhap + "</span></div>");
							out.println("<ul class=\"board__main\">");
							out.println("<li class=\"board__main__title\"><span>Thông tin cá nhân</span></li>");
							out.println(
									"<li class=\"board__main__detail\"><span class=\"board__main__detail__lable\">Họ tên:</span> <span class=\"board__main__detail__content\">"
											+ TenTaiKhoan + "</span></li>");
							out.println(
									"<li class=\"board__main__detail\"><span class=\"board__main__detail__lable\">Chức năng người dùng:</span> <span class=\"board__main__detail__content\">"
											+ ChucVu + "</span></li>");
							out.println(
									"<li class=\"board__main__detail\"><span class=\"board__main__detail__lable\">Giới tính:</span> <span class=\"board__main__detail__content\">"
											+ GioiTinh + "</span> </li>");
							out.println(
									"<li class=\"board__main__detail\"><span class=\"board__main__detail__lable\">Ngày sinh:</span> <span class=\"board__main__detail__content\">"
											+ NgaySinh + "</span> </li>");
							out.println(
									"<li class=\"board__main__detail\"><span class=\"board__main__detail__lable\">Địa chỉ:</span> <span class=\"board__main__detail__content\">"
											+ DiaChi + "</span> </li>");
							out.println(
									"<li class=\"board__main__detail\"><span class=\"board__main__detail__lable\">Liên hệ:</span> <span class=\"board__main__detail__content\">"
											+ SDT + "</span></li>");
							out.println(
									"<li class=\"board__main__detail\"><span class=\"board__main__detail__lable\">Email:</span> <span class=\"board__main__detail__content\">"
											+ Email + "</span></li>");
						}
					%>
					
					</ul>
					<div class="button-modify"
						style="margin: 1em 0em; text-align: center;">
						<div class="button-rect forest" href="#UpPass-box" onclick="">
							<i class="fa fa-edit"></i> <span class="content-inner">Chỉnh
								sửa</span>
						</div>
					</div>
					<div class="button-modify"
						style="margin: 1em 0em; text-align: center;">
						<div class="button-rect cool" href="#Pass-box" onclick="">
							<i class="fa fa-lock"></i> <span class="content-inner">Đổi
								mật khẩu</span>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
				<div class="board QLDH_tbDonHang">
					<p
						style="font-size: medium; font-weight: bold; color: #ff5301; border-bottom: 1px groove; padding-bottom: 1em; margin: 0.5em 0em;">
						Lịch sử mua hàng</p>
					<table id="table">
						<tr style="font-weight: bold;">
							<th>Mã hóa đơn</th>
							<th>Thời gian mua</th>
							<th>Tình trạng</th>
							<th>Chi tiết</th>
							<th>Thao tác</th>
						</tr>
						<%
							Object resultOrder = request.getAttribute("userOrder");
							Order[] orders = (Order[]) resultOrder;
							if (resultOrder != null && resultOrder instanceof Order[]) {
								for (int i = 0; i < orders.length; i++) {
									String MaDonHang = orders[i].getMaHoaDon();
									String NgayIn = orders[i].getNgayIn();
									String TinhTrang = orders[i].getTinhTrang();
									String ThaoTac = "";
									boolean isChangeState = false;
									if (TinhTrang.equalsIgnoreCase("Chờ Duyệt")) {
										ThaoTac = "Hủy";
										isChangeState = true;
									}
									out.println("<tr><td>" + MaDonHang + "</td>");
									out.println("<td>" + NgayIn + "</td>");
									out.println("<td>" + TinhTrang + "</td>");
									out.println("<td><a onclick=\"openNewTab('UserCT-DonHang?id=" + MaDonHang
											+ "')\" style=\"cursor: pointer;\">Xem chi tiết</a></td>");
									out.println("<td><a onclick=\"changeStateOrder('" + MaDonHang + "', " + isChangeState
											+ ")\" style=\"cursor: pointer;\">" + ThaoTac + "</a></td></tr>");
								}
							}
						%>
						<!-- <tr>
							<td>HD0001</td>
							<td>11-20-2018</td>
							<td>Đang vận chuyển</td>
							<td><a onclick="" style="cursor: pointer;">Xem chi tiết</a></td>
						</tr> -->
					</table>
				</div>
			</div>
		</div>

		<!-- Phần footer cho trang Web -->
		<%@ include file="../comp/Footer.jsp"%>
		<script>
			function openNewTab(url) {
				window.open(url, '_blank');
			}
			function changeStateOrder(maHD, bool) {
				if (bool) {
					var url = window.location.href;
					$(".QLDH_tbDonHang").load(url + " #table", {
						maHD : maHD
					});
				}
			}
			function reloadKH() {
				var URL = window.location.href;
				var searchU = document.getElementById("btnSearch").value;
				document.getElementById("btnSearch").value = searchU;

			}
			function refreshPage() {
				window.location.href = window.location.href
			}
		</script>

		<%
			if (result != null && result instanceof Account) {

				String TenDangNhap = userPro.getTenDangNhap();
				String TenTaiKhoan = userPro.getTenTaiKhoan();
				String ChucVu = userPro.getChucVu();
				String GioiTinh = userPro.getGioiTinh();
				String NgaySinh = userPro.getNgaySinh();
				String DiaChi = userPro.getDiaChi();
				String SDT = userPro.getSdt();
				String Email = userPro.getEmail();
				out.println("<div class=\"signup-container\" id=\"UpPass-box\"> <h1>Thông tin cá nhân</h1>");
				out.println("<span class=\"img-close\"><i id=\"size-icon\" class=\"fa fa-close\"></i></span>");
				out.println("<form class=\"signup-content\" action=\"ViewInfo?action=UpdateInfo\" method=\"POST\">");
				out.println("<div class=\"form-group\">");
				out.println("<label class=\"control-label\" for=\"UserSignUp\">Tên người dùng</label> ");
				out.println("<input type=\"text\" name=\"UserSignUp\" value=\""+TenTaiKhoan +"\" placeholder=\"\"  id=\"UserSignUps\" required> </div>");
				out.println("<div class=\"form-group\">");
				out.println("<label class=\"control-label\" for=\"Sex\">Giới tính</label> ");
				out.println("<select class=\"form-control\" name=\"Sex\" id=\"Sexs\"><option>Nam</option><option>Nữ</option></select></div>");				
				out.println("<div class=\"form-group\">");
				out.println("<label class=\"control-label\" for=\"BirthDate\">Ngày sinh</label> ");
				out.println("<input id=\"typedates\" type=\"date\" name=\"Date\" value=\""+NgaySinh+"\" id=\"BirthDate\" required></div>");		
				out.println("<div class=\"form-group\">");
				out.println("<label class=\"control-label\" for=\"Address\">Địa chỉ</label> ");
				out.println("<input type=\"text\" name=\"Address\" value=\""+ DiaChi+"\" placeholder=\"\" maxlength=\"255\" id=\"Addresss\" required> </div>");
				out.println("<div class=\"form-group\">");
				out.println("<label class=\"control-label\" for=\"Email\">Email</label>");
				out.println("<input type=\"email\" name=\"Email\" value=\""+Email+"\" placeholder=\"\" maxlength=\"50\" id=\"Emails\" required></div>");
				out.println("<div class=\"form-group\">");
				out.println("<label class=\"control-label\" for=\"PhoneNumber\">Số điệnthoại liên hệ</label>");
				out.println("<input type=\"text\" name=\"PhoneNumber\" value=\""+ SDT+"\" placeholder=\"\"  id=\"PhoneNumbers\" required></div>");
				out.println("<div style=\"position: relative; width: 100%; text-align: center\">");
				out.println("<button class=\"button submit-button\">Xác nhận</button>");
				out.println("</div></br></form></div>");
			}
		%>
<!--
		<div class="signup-container" id="UpPass-box"> <h1>Thông tin cá nhân</h1>
			<span class="img-close"><i id="size-icon" class="fa fa-close"></i></span>
			<form class="signup-content"> <div class="form-group">
					<label class="control-label" for="NameSignUp">Tên đăng nhập</label>
					<input type="text" name="NameSignUp" value=""placeholder="User name" maxlength="10" autocomplete="off" id="NameSignUp" required></div>
						
				<div class="form-group">
					<label class="control-label" for="UserSignUp">Tên người
						dùng</label> <input type="text" name="UserSignUp" value=""
						placeholder="Your name" maxlength="50" autocomplete="off"
						id="UserSignUp" required> </div>
				<div class="form-group">
					<label class="control-label" for="Sex">Giới tính</label> 
					<select class="form-control" name="Sex" id="Sex"><option>Nam</option><option>Nữ</option></select></div>
				<div class="form-group">
					<label class="control-label" for="BirthDate">Ngày sinh</label> <input
						id="typedate" type="date" name="Date" value="" id="BirthDate"
						required>
				</div>
				<div class="form-group">
					<label class="control-label" for="Address">Địa chỉ</label> <input
						type="text" name="Address" value="" placeholder="Address"
						maxlength="255" id="Address" required>
				</div>
				<div class="form-group">
					<label class="control-label" for="Email">Email</label> <input
						type="email" name="Email" value="" placeholder="Email"
						maxlength="50" id="Email" required>
				</div>
				<div class="form-group">
					<label class="control-label" for="PhoneNumber">Số điện
						thoại liên hệ</label> <input type="number" name="PhoneNumber" value=""
						placeholder=" Your phone number" maxlength="10" id="PhoneNumber"
						required>
				</div>
				<div style="position: relative; width: 100%; text-align: center">
					<button class="button submit-button" onclick="">Xác nhận</button>
				</div></br></form></div> -->
		<div class="signup-container" id="Pass-box">
			<h1>Đổi mật khẩu</h1>
			<span class="img-close"><i id="#size-icon" class="fa fa-close"></i></span>
			<form class="signup-content">
				<div class="form-group">
					<label class="control-label" for="Password">Mật khẩu cũ</label> <input
						type="text" name="Password" value="" placeholder=" Your password"
						id="Password">
				</div>
				<div class="form-group">
					<label class="control-label" for="Newpassword"> Mật khẩu
						mới </label> <input type="text" name="Newpassword" value=""
						placeholder=" Your new password" id="Newpassword">
				</div>
				<div class="form-group">
					<label class="control-label" for="Confirmpassword"> Xác
						nhận mật khẩu </label> <input type="text" name="Confirmpasswords" value=""
						placeholder=" Confirm your password" id="Confirmpasswords">
				</div>
				<div style="position: relative; width: 100%; text-align: center">
					<button class="button submit-button" onclick="Doimatkhau()">Xác
						nhận</button>
				</div>
				</br>
			</form>
		</div>
		<script>
			$(document).ready(function() {
				$(' div.cool').click(function() {
					var PassBox = $(this).attr('href');
					$(PassBox).fadeIn(400);
					$('body').append('<div id="over">');
					$('#over').fadeIn(400);
					return false;
				});

				// khi click đóng hộp thoại
				$(document).on('click', "span.img-close, #over", function() {
					$('#over, .login-container').fadeOut(200, function() {
						$('#over').remove();
					});
					return false;
				});
			});
		</script>
		<script>
			$(document).ready(function() {
				$('div.forest').click(function() {
					var loginBox = $(this).attr('href');
					$(loginBox).fadeIn(400);
					$('body').append('<div id="over">');
					$('#over').fadeIn(400);
					return false;
				});
				$(document).on('click', "span.img-close, #over", function() {
					$('#over, .login-container').fadeOut(200, function() {
						$('#over').remove();
					});
					return false;
				});
			});
		</script>
		<script>
			function Doimatkhau() {
				var Matkhaumoi = $('#Newpassword').val();
				var Xacnhanmk = $('#Confirmpasswords').val();
				if (confirmpasss(Matkhaumoi, Xacnhanmk) == true) {
					$.post("ViewInfo?action=UpPass", {
						Matkhaumoi : Matkhaumoi,
					}, function(loadtrang) {
						location.reload();
					});
				}
			}
			function confirmpasss(Matkhaumoi, Xacnhanmk) {
				return (Matkhaumoi == Xacnhanmk)

			}
			function UpdateUserInfo()
			{
				var TenNguoiDung,GioiTinh,NgaySinh,DiaChi,Email,SDT;
				TenNguoiDung=$('#UserSignUps').val();
				GioiTinh=$('#Sexs').val();
				NgaySinh=$('#typedates').val(); 
				DiaChi=$('#Addresss').val();
				Email=$('#Emails').val();
				SDT=$('#PhoneNumber').val();
				$.post("ViewInfo?action=UpdateInfo",{
							
							TenNguoiDung:TenNguoiDung,
							GioiTinh:GioiTinh,
							NgaySinh:NgaySinh,
							DiaChi:DiaChi,
							Email:Email,
							SDT:SDT,
						}, function(loadtrang){
							location.reload();
						}				
						);
			}
		</script>
</body>
</html>
