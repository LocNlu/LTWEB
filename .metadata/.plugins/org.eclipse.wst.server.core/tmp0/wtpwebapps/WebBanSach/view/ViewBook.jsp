<%@page import="model.bean.Comment"%>
<%@page import="model.bean.Image"%>
<%@page import="model.bean.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Thông tin chi tiết</title>
<link rel="icon" type="image/png" href="image/LOGO.ico" />

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css"
	data-minify="1" />
<link rel="stylesheet" type="text/css" href="lib/css/styleView.css" />
<link rel="stylesheet" type="text/css" href="lib/css/styleDialog.css" />
<link rel="stylesheet" type="text/css" href="lib/css/style.css" />
<link rel="stylesheet" type="text/css" href="lib/css/sheet.css">
<link rel="stylesheet" type="text/css" href="lib/css/BEM_Style.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="lib/js/Cookies.js"></script>
<script type="text/javascript" src="lib/js/ActionBook.js"></script>

</head>
<body>
	<%@ include file="../comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<div class="row">
			<div class="col-md-9 col-sm-8 col-xs-12">
				<article>
					<div class="row">
						<div class="board">
							<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
								<div class="thumbnail">
									<%
										Object book = request.getAttribute("book");
										String pathImage = "";
										if (book != null && book instanceof Book) {
											Image pathsImage = ((Book) book).getImages();
											if (pathsImage != null) {
												pathImage = "lib/image/" + pathsImage.getDuongDan();
											}
										}
										out.println(
												"<img src=\"" + pathImage + "\" id=\"zoom-image\" style=\"content: url('" + pathImage + "');\">");
									%>
								</div>
							</div>
							<div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
								<div id="info">

									<%
										if (book == null) {
											out.println("<p class=\"error\">Mã sách không hợp lệ</p>");
										} else if (book instanceof Book) {
											out.println("<ul>");

											out.println("<li>");
											out.println("<div class=\"row\">");
											out.println(
													"<div class=\"col-lg-3 col-md-4 col-sm-5 col-xs-3\"><p><strong>Tên sách: </strong></p></div>");
											out.println("<div class=\"col-lg-9 col-md-8 col-sm-7 col-xs-9\"><span>" + ((Book) book).getTenSach()
													+ "</span></div>");
											out.println("</div>");
											out.println("</li>");

											out.println("<li>");
											out.println("<div class=\"row\">");
											out.println(
													"<div class=\"col-lg-3 col-md-4 col-sm-5 col-xs-3\"><p><strong>Tác giả: </strong></p></div>");
											out.println("<div class=\"col-lg-9 col-md-8 col-sm-7 col-xs-9\"><span>" + ((Book) book).getTacGia()
													+ "</span></div>");
											out.println("</div>");
											out.println("</li>");

											out.println("<li>");
											out.println("<div class=\"row\">");
											out.println(
													"<div class=\"col-lg-3 col-md-4 col-sm-5 col-xs-3\"><p><strong>Giá bán: </strong></p></div>");
											out.println("<div class=\"col-lg-9 col-md-8 col-sm-7 col-xs-9\"><span>" + ((Book) book).getGiaBan()
													+ "</span></div>");
											out.println("</div>");
											out.println("</li>");

											out.println("<li>");
											out.println("<div class=\"row\">");
											out.println(
													"<div class=\"col-lg-3 col-md-4 col-sm-5 col-xs-3\"><p><strong>Đánh giá: </strong></p></div>");
											out.println(
													"<div class=\"col-lg-9 col-md-8 col-sm-7 col-xs-9\"><span style=\"margin: 5px 0px;\" id=\"rating\">");

											//Đánh giá sản phẩm
											int danhGia = Integer.parseInt(request.getAttribute("rate").toString());
											int temp = danhGia;
											for (int i = 0; i < 5; i++) {
												if (temp > 0) {
													out.println(
															"<i class=\"fa fa-star\" style=\"display: inline-block; color:gold; cursor:default; margin: 0px 1px\" id=\"star\"></i>");
													temp--;
												} else {
													out.println(
															"<i class=\"fa fa-star\" style=\"display: inline-block; cursor: default; margin: 0px 1px\" id=\"star\"></i>");
												}
											}
											out.println("<span id=\"txtRate\">(" + danhGia + "/5 sao)</span>");
											out.println("</span></div></div></li></ul>");
										}
									%>
								</div>

								<div class="row" style="margin-top: 20px;">
									<div class="col-lg-2 col-md-12" id="countInput"
										style="text-align: center">
										<input type="number" name="quantity" min="1" max="100"
											value="1" id="count">
									</div>
									<div class="col-lg-5 col-md-12" style="text-align: center">
										<div class="button-modify">
											<%
												if (book != null) {
													String maSach = ((Book) book).getMaSach();
													out.println("<div class=\"button-rect forest\" onclick='addBookToCart(\"" + maSach
															+ "\", getNumberBuy());'>");
													out.println("<i class=\"fa fa-cart-plus\"></i>");
													out.println("<span class=\"content content-inner\">Cho vào giỏ</span></div>");
												}
											%>
										</div>
									</div>
									<div class="col-lg-5 col-md-12" style="text-align: center">
										<div class="button-modify">
											<%
												if (book != null) {
													String maSach = ((Book) book).getMaSach();
													out.println("<div class=\"button-rect danger\" onclick='buyNow(\"" + maSach + "\", getNumberBuy());'>");
													out.println("<i class=\"fa fa-money\"></i>");
													out.println("<span class=\"content content-inner\">Mua ngay</span></div>");
												}
											%>
										</div>
									</div>
								</div>
							</div>

							<div class="col-ms-12 figureBook">
								<p class="header">Giới thiệu tác phẩm</p>
								<%
									if (book != null && book instanceof Book) {
										String figure = ((Book) book).getMoTa();
										if (figure.length() > 0)
											out.println("<p class=\"content\">" + figure + "</p>");
										else
											out.println("<p class=\"content\">Đang cập nhật nội dung</p>");
									}
								%>
							</div>
						</div>
					</div>
				</article>
			</div>

			<div class="col-md-3 col-sm-4 col-xs-12">
				<div class="board mini-board">
					<div class="title">Sản phẩm tương tự</div>
					<ul class="content">
						<%
							Object bookTT = request.getAttribute("bookTT");
							if (bookTT != null && bookTT instanceof Book[]) {
								Book[] bookTTs = (Book[]) bookTT;
								for (int i = 0; i < bookTTs.length; i++) {
									String MaSach = bookTTs[i].getMaSach();
									String DuongDanAnh = bookTTs[i].getImages().getDuongDan();
									String TenSach = bookTTs[i].getTenSach();
									out.println("<a href=\"ViewBook?id=" + MaSach + "\"><li class=\"item\"><img src=\"lib/image/"
											+ DuongDanAnh + "\"></img> <span>" + TenSach + "</span></li></a>");
								}
							}
						%>
					</ul>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="board" id="board_comment">
					<p class="board__title">Đánh giá</p>
					<%
						Object comments = request.getAttribute("comment");
						if (comments != null) {
							Comment[] c = (Comment[]) comments;
							int danhGia = Integer.parseInt(request.getAttribute("rate").toString());
							for (int i = 0; i < c.length; i++) {
								Comment comment = c[c.length - 1 - i];

								out.println("<ul class=\"comment\">");
								out.println("<li class=\"comment__item\">");
								out.println(
										"<span class=\"comment__item__icon\"><i class=\"fa fa-user\" style=\"cursor: default;\"></i></span>");
								out.println("<span class=\"comment__item__name\">" + comment.getTenNguoiDung() + "</span>");
								out.println("<span class=\"comment__item__time\">" + comment.getThoiGian() + "</span>");
								out.println("<span class=\"comment__item__rate\">Đã đánh giá: " + comment.getDanhGia()
										+ "/5 sao</span>");
								out.println("<span class=\"comment__item__content\">" + comment.getNoiDung() + "</span>");
								out.println("</li>");
								out.println("</ul>");
							}
						}
					%>
				</div>

				<div class="board">
					<p class="board__title">Thêm đánh giá</p>
					<div class="comment__new">
						<%
							Account account = null;
							if ((account = (Account) request.getSession().getAttribute("User")) != null) {
								out.println("<input type=\"text\" value=\"" + account.getTenTaiKhoan()
										+ "\" placeholder=\"Tên của bạn...\" class=\"comment__new__name\" id=\"name\" disabled=\"disabled\"></input>");
							} else {
								out.println(
										"<input type=\"text\" value=\"\" placeholder=\"Tên của bạn...\" class=\"comment__new__name\" id=\"name\"></input>");
							}

							out.println("<div class=\"comment__new__rate\">");
							out.println("<span style=\" margin: 0em 1em; font-weight: bold;\">  Đánh giá của bạn:</span>");
							out.println("<span id=\"danhGia\" style=\"margin: 5px 0px;\">");
							for (int i = 0; i < 5; i++) {
								out.println(
										"<i class=\"fa fa-star\" style=\"display: inline-block; color:gold; cursor:default;\" onclick=\"setUserRate("
												+ (i + 1) + ")\"></i>");
							}
							out.println("</span></div>");
						%>

						<textarea rows="5" placeholder="Nội dung bình luận..."
							class="comment__new__content" id="comment"></textarea>
						<div class="comment__new__button button-modify">
							<div class="button-rect cool" style="cursor: pointer;"
								onclick="sendCommentOfUser(false)">
								<i class="fa fa-send"></i> <span class="content-inner">Gửi
									đánh giá</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div>
		<div class="dialog" id="confirm-form" style="width: 60%;">
			<div class="header">
				<div class="title">Thanh toán</div>
				<a class="f-right close" href="#"><i class="fa fa-close"></i></a>
			</div>
			<ul class="content">
				<li class="item" style="height: 100px;"><span class="title">Tên
						người mua</span>
					<div class="detail">
						<input id="username" type="text" autocomplete="on" name="username"
							placeholder="Name..." value="" />
					</div></li>
				<li class="item" style="height: 100px;"><span class="title">Địa
						chỉ giao hàng</span>
					<div class="detail">
						<input id="address" type="text" name="address"
							placeholder="Address..." value="" />
					</div></li>
				<li class="item" style="height: 100px;"><span class="title">Số
						điện thoại</span>
					<div class="detail">
						<input id="phone" type="text" name="phone" placeholder="Phone..."
							value="" />
					</div></li>
				<li class="item">
					<button class="button submit-button" onclick="addCart()">Đặt
						hàng</button>
				</li>
			</ul>
		</div>
	</div>

	<%@ include file="../comp/Footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			// khi click đóng hộp thoại
			$(document).on('click', "a.close, #over", function() {
				$('#over, .dialog').fadeOut(300, function() {
					$('#over').remove();
					var url = location.href;
					if (url.indexOf('ViewCart') == -1) {
						deleteAllCookie();

						var button = $('.cart-count')[0];
						$(button).find('#number').text(0);
					}
				});
				return false;
			});

			$(document).on('click', "button.submit-button", function() {
				$('#over, .dialog').fadeOut(300, function() {
					$('#over').remove();
					deleteAllCookie();
				});
				return false;
			});
		});
	</script>
</body>
</html>