<%@page import="model.bean.Cart"%>
<%@page import="model.bean.Book"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Xem giỏ hàng</title>
<link rel="icon" type="image/png" href="image/LOGO.ico"/>

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css"/>
<link rel="stylesheet" type="text/css" href="lib/css/styleView.css">
<link rel="stylesheet" type="text/css" href="lib/css/styleDialog.css">
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet" type="text/css" href="lib/css/sheet.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<%@ include file="../comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<article>
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
					<ul class="table-modify">
						<%
							Object carts = request.getAttribute("cart");
							if (carts == null) {
								out.println("<p class=\"error\">Giỏ hàng trống</p>");
							} else if (carts instanceof Vector) {
								Vector<Cart> v = (Vector<Cart>)carts;
								for (int i = 0; i < v.size(); i++) {
									Cart cart = (Cart)v.elementAt(i);
									Book book = cart.getBook();
									int countBook = cart.getCount();

									out.println("<li class=\"row-table\">");
									out.println("<div class=\"row\">");
									out.println("<div class=\"col-lg-3 col-md-4 col-sm-4 col-xs-12\">");

									if (book.getImages() != null)
										out.println("<div class=\"thumbnail small\"><img src=\"lib/image/"
												+ book.getImages().getDuongDan() + "\"></div></div>");
									out.println("<div class=\"col-lg-7 col-md-6 col-sm-6 col-xs-8 col-ms-12\">");
									out.println("<div id=\"info\" style=\"margin-top: 0px\">");
									out.println("<ul>");
									out.println("<li><p><strong>Tên sách: </strong></p>");
									out.println("<span>" + book.getTenSach() + "</span></li>");
									out.println("<li><p><strong>Tác giả: </strong></p>");
									out.println("<span>" + book.getTacGia() + "</span></li>");
									out.println("<li><p><strong>Giá bán: </strong></p>");
									out.println("<span id=\"price\">" + cart.getGiaBan() + "</span></li></ul></div></div>");
									out.println("<div class=\"col-lg-2 col-md-2 col-sm-2 col-xs-4 col-ms-12\">");
									out.println("<div id=\"numberCount\">");
									out.println("<span><strong>Số lượng </strong></span>");
									out.println("<input type=\"number\" name=\"quantity\" min=\"1\" max=\"100\" value=\"" + countBook
											+ "\" id=\""+i+"\" oninput=\"updateBookInCart("+i+", this)\">");
									out.println("</div></div></div><div class=\"deleteBook\" id=\""+i+"\" onclick=\"removeBookFromCart(this)\"><i class=\"fa fa-close\"></i></div></li>");
								}
							}
						%>
					</ul>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
					<div class="board" style="text-align: center;" id="bill">
						<span id="label" style="left: 0px;">Tổng tiền phải thanh toán: </span>
						<%
							int sum = 0;
							if (carts != null && carts instanceof Vector) {
								Vector<Cart> books = (Vector<Cart>) carts;
								for (int i = 0; i < books.size(); i++) {
									Cart cart = (Cart)books.elementAt(i);
									Book book = cart.getBook();
									int countBook = cart.getCount();
									int price = cart.getGiaBan();
									sum += price * countBook;
								}
							}
							out.println("<span id=\"totalPrice\" style=\"font-weight:bold;left: 0px;\">" + String.valueOf(sum) + "đ</span>");
						%>
					</div>
					<div class="button-modify" style="text-align: center;">
						<div class="button-rect forest" id="button-confirm">
							<%
								if (sum == 0)
									out.println("<a><i class=\"fa fa-money\"></i> <span class=\"content-inner\">Thanh toán</span></a>");
								else
									out.println("<a class=\"login-window\" href=\"#confirm-form\"><i class=\"fa fa-money\"></i> <span class=\"content-inner\">Thanh toán</span></a>");
							%>
						</div>
					</div>
				</div>
			</div>
		</article>

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
							<input id="username" type="text" autocomplete="on"
								name="username" placeholder="Name..." value="" />
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
	</div>

	<%@ include file="../comp/Footer.jsp"%>
	<script type="text/javascript" src="lib/js/Cookies.js"></script>
	<script type="text/javascript" src="lib/js/ActionCart.js"></script>
</body>
</html>