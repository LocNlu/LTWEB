<%@page import="model.bean.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Admin Quản Lý</title>
<link rel="icon" type="image/png" href="../image/LOGO.ico"/>

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
			<div class="col-sm-12">
				<h3>
					<small>Quản lý đơn hàng</small>
				</h3>
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
				<div class="board" style="overflow-x: auto;">


					<div class="QLDH_tbDonHang">
						<table id="table">
							<tbody>
								<tr>
									<th>Mã đơn hàng</th>
									<th>Tài khoản mua</th>
									<th>Tên khách hàng</th>
									<th>Số điện thoại</th>
									<th>Tình Trạng</th>
									<th>Thao tác</th>
									<th>Xem chi tiết</th>
								</tr>
								<%
									Object result = request.getAttribute("danhsachdonhang");

									Object resultSearch = request.getAttribute("strSearch");
									Order[] orders = (Order[]) result;
									Order[] ordersSearch = (Order[]) resultSearch;
									if (result != null && result instanceof Order[]) {

										for (int i = 0; i < orders.length; i++) {
											String MaDonHang = orders[i].getMaHoaDon();
											String TaiKhoan = orders[i].getMaTaiKhoan();
											String TenNguoimua = orders[i].getTenNguoiMua();
											String SDT = orders[i].getSDT();
											String TinhTrang = orders[i].getTinhTrang();
											String ThaoTac = "";
											boolean isChangeState = false;
											if (TinhTrang.equalsIgnoreCase("Chờ Duyệt")){
												ThaoTac = "Duyệt";
												isChangeState = true;
											} else {
												if (TinhTrang.equalsIgnoreCase("Đã Duyệt")){
													ThaoTac = "Vận chuyển";
													isChangeState = true;
												} else {
													if (TinhTrang.equalsIgnoreCase("Vận Chuyển")){
														ThaoTac = "Hoàn Thành";
														isChangeState = false;
													}
												}
											}
											out.println("<tr><td>" + MaDonHang + "</td>");
											out.println("<td>" + TaiKhoan + "</td>");
											out.println("<td>" + TenNguoimua + "</td>");
											out.println("<td>" + SDT + "</td>");
											out.println("<td>" + TinhTrang + "</td>");
											out.println("<td><a onclick=\"changeStateOrder('"+ MaDonHang +"', "+ isChangeState +")\" style=\"cursor: pointer;\">" + ThaoTac + "</a></td>");
											out.println("<td><a onclick=\"openNewTab('CT-DonHang?id="+ MaDonHang +"')\" style=\"cursor: pointer;\">Xem chi tiết</a></td></tr>");										}
									}

									else {

										for (int i = 0; i < ordersSearch.length; i++) {
											String MaDonHang = ordersSearch[i].getMaHoaDon();
											String TaiKhoan = ordersSearch[i].getMaTaiKhoan();
											String TenNguoimua = ordersSearch[i].getTenNguoiMua();
											String SDT = ordersSearch[i].getSDT();
											String TinhTrang = ordersSearch[i].getTinhTrang();
											String ThaoTac = "";
											boolean isChangeState = false;
											if (TinhTrang.equalsIgnoreCase("Chờ Duyệt")){
												ThaoTac = "Duyệt";
												isChangeState = true;
											} else {
												if (TinhTrang.equalsIgnoreCase("Đã Duyệt")){
													ThaoTac = "Vận chuyển";
													isChangeState = true;
												} else {
													if (TinhTrang.equalsIgnoreCase("Vận Chuyển")){
														ThaoTac = "Hoàn Thành";
														isChangeState = false;
													}
												}
											}
											out.println("<tr><td>" + MaDonHang + "</td>");
											out.println("<td>" + TaiKhoan + "</td>");
											out.println("<td>" + TenNguoimua + "</td>");
											out.println("<td>" + SDT + "</td>");
											out.println("<td>" + TinhTrang + "</td>");
											out.println("<td><a onclick=\"changeStateOrder('"+ MaDonHang +"', "+ isChangeState +")\" style=\"cursor: pointer;\">" + ThaoTac + "</a></td>");
											out.println("<td><a onclick=\"openNewTab('CT-DonHang?id='"+ MaDonHang +"')\" style=\"cursor: pointer;\">Xem chi tiết</a></td></tr>");
										}
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
				<hr>

			</div>

		</div>
	</div>

	<!-- Phần footer cho trang Web -->
	<%@ include file="../comp/Footer.jsp"%>
	<script>
		function changeStateOrder(maHD, bool){
			if (bool){
				var url = window.location.href;
				$(".QLDH_tbDonHang").load(url + " #table", {
					maHD: maHD
				});
			}
		}
		function reloadKH() 
		{
			var URL = window.location.href;
			var searchU = document.getElementById("btnSearch").value;
			document.getElementById("btnSearch").value=searchU;

		}
		function refreshPage()
		{
			window.location.href=window.location.href
		} 
		function openNewTab(url){
			window.open(url, '_blank');
		}
	</script>
</body>
</html>