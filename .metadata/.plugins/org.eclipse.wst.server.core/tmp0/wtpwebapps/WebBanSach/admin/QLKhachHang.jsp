<%@page import="model.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Admin Quản Lý</title>
<link rel="icon" type="image/png" href="../image/LOGO.ico" />

<link rel="stylesheet" type="text/css" href="../lib/css/stylesheet.css"
	data-minify="1" />
<link rel="stylesheet" type="text/css" href="../lib/css/style.css">
<link rel="stylesheet" type="text/css" href="../lib/css/sheet.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script type="text/javascript" src="../lib/js/jquery-3.3.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../lib/js/vu.js"></script>

</head>
<body>

	<!-- Phần header cho trang Web -->
	<%@ include file="../comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<div class="row" style="background-color: #eeeeee;">
			<div class="col-sm-12"">
				<h3>
					<small>Quản lý khách hàng</small>
				</h3>
				<hr>
				<div class="sbDH">
					<div class="container">
						<form action="" method="GET" style="text-align: center;">
							<input type="text" class="btnSearch" name="btnSearch"
								placeholder="Tìm kiếm" id="btnSearch"> <span>
								<button onclick="reloadKH()" class="dropbtn">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</form>

					</div>
				</div>
				<hr>
				<div class="board">
					<!-- 	<ul class="ochuaQLDH">
						<li class="tbHere"><a href="#">Tất cả</a></li>
						<li><a href="#">TOP 10 tích lũy</a></li>

					</ul> -->
					<div class="QLDH_tbDonHang">
						<table id="tbKH">
							<tr id="dongKH">
								<th>Tên đăng nhập</th>
								<th>Tên khách hàng</th>
								<th>Xem chi tiết</th>
							</tr>

							<%
								Object result = request.getAttribute("danhsachkhachhang");

								Object resultSearch = request.getAttribute("strSearch");
								Account[] accounts = (Account[]) result;
								Account[] accountsSearch = (Account[]) resultSearch;
								if (result != null && result instanceof Account[]) {

									for (int i = 0; i < accounts.length; i++) {
										String TenDangNhap = accounts[i].getTenDangNhap();
										String TenTaiKhoan = accounts[i].getTenTaiKhoan();
										out.println("<tr id=\"dongKH\"><td>" + TenDangNhap + "</td>");
										out.println("<td>" + TenTaiKhoan + "</td>");
										out.println("<td><a onclick=\"openNewTab('CT-KhachHang?id=" + TenDangNhap
												+ "')\" style=\"cursor: pointer\">Xem chi tiết</a></td></tr>");
									}
								}

								else {

									for (int i = 0; i < accountsSearch.length; i++) {
										String TenDangNhap = accountsSearch[i].getTenDangNhap();
										String TenTaiKhoan = accountsSearch[i].getTenTaiKhoan();
										out.println("<tr id=\"dongKH\"><td>" + TenDangNhap + "</td>");
										out.println("<td>" + TenTaiKhoan + "</td>");
										out.println("<td><a onclick=\"openNewTab('CT-KhachHang?id=" + TenDangNhap
												+ "')\" style=\"cursor: pointer\">Xem chi tiết</a></td></tr>");
									}
								}
							%>

						</table>
					</div>
				</div>
				<hr>

			</div>

			<hr>
		</div>
	</div>


	<!-- Phần footer cho trang Web -->
	<%@ include file="../comp/Footer.jsp"%>
	<script>
		function reloadKH() {
			var URL = window.location.href;
			var searchU = document.getElementById("btnSearch").value;
			$("#tbKH").load(window.location.href + searchU + " #dongKH");
			document.getElementById("btnSearch").value = searchU;

		}

		function openNewTab(url) {
			window.open(url, '_blank');
		}
	</script>
</body>
</html>