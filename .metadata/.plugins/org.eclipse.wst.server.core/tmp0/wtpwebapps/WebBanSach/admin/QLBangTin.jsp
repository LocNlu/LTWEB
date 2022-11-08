<%@page import="model.bean.Banner"%>
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
<link rel="stylesheet" type="text/css" href="../lib/css/styleTable.css">
<link rel="stylesheet" type="text/css" href="../lib/css/styleDialog.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script type="text/javascript" src="../lib/js/jquery-3.3.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

	<!-- Phần header cho trang Web -->
	<%@ include file="../comp/Header.jsp"%>

	<div class="container-fluid" id="content" style="width: 80%; transform: translateX(11.5%); margin: 1.5em 0em; margin-top: 110px !important;">
		<div class="row">
			<div class="col-xs-12">
				<div id="my-carousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#my-carousel" data-slide-to="0" class="active"></li>
						<li data-target="#my-carousel" data-slide-to="1" class=""></li>
						<li data-target="#my-carousel" data-slide-to="2" class=""></li>
					</ol>
					<div class="carousel-inner">
						<%
							Object result = request.getAttribute("danhsachbantin");
							Banner[] banners = (Banner[]) result;
							if (result != null && result instanceof Banner[]) {
								out.println("<div class=\"item active\"><a> <img src=\"../image/" + banners[0].getAnh()
										+ "\" style=\"width: 100%; background-repeat: no-repeat; cursor:pointer;\"> </a></div>");
								for (int i = 1; i < banners.length; i++) {
									out.println("<div class=\"item\"><a> <img src=\"../image/" + banners[i].getAnh()
											+ "\" style=\"width: 100%; background-repeat: no-repeat; cursor:pointer;\"></a></div>");
								}
							}
						%>
						<a class="left carousel-control" href="#my-carousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							class="right carousel-control" href="#my-carousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</div>
			</div>
			<div class="col-ms-12">
				<div class="board" style="margin: 1em 0">
					<span class="title">Quản lý bảng tin</span> <span id="delete"
						class="f-right" style="margin-left: 2em;"><i
						class="table-icon fa fa-trash"></i></span> <span id="update"
						class="f-right" style="margin-left: 2em;"><i
						style="margin-top: 1px;" class="table-icon fa fa-pencil-square-o"></i></span>
					<span id="add" class="f-right" style="margin-left: 2em;"><i
						class="table-icon fa fa-plus-circle"></i></span>

					<table>
						<tr>
							<th class="s-small a-center">STT</th>
							<th class="a-center">Tiêu đề</th>
							<th class="a-center">Nội dung</th>
							<th class="s-medi a-center">Ảnh</th>
						</tr>
						<%
							if (result != null && result instanceof Banner[]) {
								for (int i = 0; i < banners.length; i++) {
									String MaTin = banners[i].getMaTin();
									String NoiDung = banners[i].getNoiDung();
									String Anh = banners[i].getAnh();
									String TieuDe = banners[i].getTieuDe();
									int stt = i + 1;
									out.println("<tr id=\"" + MaTin + "\" class=\"data defalut-style\">");
									out.println("<td class=\"s-small a-center\">" + stt + "</td>");
									out.println("<td>" + TieuDe + "</td>");
									out.println("<td>" + NoiDung + "</td>");
									out.println("<td class=\"s-medi a-center\"><img class=\"s-parent\" src=\"../image/" + Anh
											+ "\" alt=\"\" /></td> </tr>");

								}
							}
						%>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="dialog" id="input-form" style="width: 75%;">
			<div class="header">
				<div class="title">Tạo bảng tin mới</div>
				<a class="f-right close" href="#"><i class="fa fa-close"></i></a>
			</div>

			<ul class="content">
				<li class="item" style="height: 175px;">
					<div class="detail">
						<input type="text" name="titleBT" placeholder="Title" id="titleBT">
						<textarea rows="5" placeholder="Nội dung bảng tin..."
							id="contentBT" name="contentBT"></textarea>
					</div>
				</li>
				<li class="item" style="height: 200px;"><span class="title">Ảnh</span>
					<div class="detail">
						<input type="file" class="anh" id="inputImage" style="with: 100%;" />
					</div> <img class="mini-image" src="#" id="showImage"></img></li>
				<li class="item">
					<button class="summit button submit-button" id="MaBangTin">Thêm</button>
				</li>
			</ul>


		</div>
	</div>

	<div>
		<div class="dialog" id="confirm-form" style="width: 50%;">
			<div class="header">
				<div class="title">Thông báo</div>
				<a class="f-right close" href="#"><i class="fa fa-close"></i></a>
			</div>
			<ul class="content">
				<li class="item" style="text-align: center;"><span
					class="title">Bạn có chắc chắn muốn xóa bảng tin này?</span></li>
				<li class="item" style="flex-direction: row;">
					<button class="button submit" id="btnXoaBT">Xác nhận</button> <span
					style="flex-grow: 1;"></span>
					<button class="button cancel">Hủy</button>
				</li>
			</ul>
		</div>
	</div>

	<!-- Phần footer cho trang Web -->
	<%@ include file="../comp/Footer.jsp"%>
	<script type="text/javascript" src="../lib/js/ActionBangTin.js"></script>
	<script>
		$(function() {
			$("#inputImage").change(function() {
				readURL(this);
			});
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					//alert(e.target.result);
					$('#showImage').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}
		function addBT() {
			var contentBT, inputImage, titleBT;
			contentBT = $("#contentBT").val();
			titleBT = $("#titleBT").val();
			inputImage = document.getElementById("inputImage").files[0].name;
			$.post("../Manager/BangTin?action=add", {
				contentBT : contentBT,
				inputImage : inputImage,
				titleBT : titleBT
			}, function(data, status) {
				window.location.reload();
			});
		}
		function upBT() {
			var id, contentBT, inputImage, titleBT;
			id = $(this).attr("id");
			contentBT = $("#contentBT").val();
			titleBT = $("#titleBT").val();
			inputImage = document.getElementById("inputImage").files[0].name;
			if (inputImage == null) {
				var img = $("#showImage").attr("src");
				inputImage = img.substring(img.lastIndexOf("/") + 1, img
						.length());
			}
			$.post("../Manager/BangTin?action=update", {
				id : id,
				contentBT : contentBT,
				inputImage : inputImage,
				titleBT : titleBT
			}, function(data, status) {
				window.location.reload();
			});
		}
		function delBT() {
			var id;
			id = $(this).attr("id");
			$.post("../Manager/BangTin?action=delete", {
				id : id,
			}, function(data, status) {
				window.location.reload();
			});
		}
	</script>
</body>
</html>