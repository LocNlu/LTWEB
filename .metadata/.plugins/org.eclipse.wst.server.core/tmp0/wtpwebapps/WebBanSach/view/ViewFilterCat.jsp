<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="model.bean.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Tìm kiếm</title>
<link rel="icon" type="image/png" href="image/LOGO.ico" />

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css"
	data-minify="1" />
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet" type="text/css" href="lib/css/sheet.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- Phần header cho trang Web -->
	<%@ include file="../comp/Header.jsp"%>

	<div class="container" id="content">
		<div class="bookshelf">
			<div class="row descrip">
				<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
					<div class="title">
						<%
							Object filterCat = request.getAttribute("FilterCate");
							if (filterCat != null) {
								if (filterCat instanceof Book[])
								//kiem tra xem phai mang book khong
								{
									Book[] filterBook = (Book[]) filterCat;
									Book book = filterBook[0];
									out.println(book.getTheLoai());
								}
							}
						%>
					</div>
				</div>
				<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6"></div>
			</div>
			<div class="row content">

				<%
					if (filterCat != null) {
						if (filterCat instanceof Book[])
						//kiem tra xem phai mang book khong
						{
							Book[] filterBook = (Book[]) filterCat;
							for (int i = 0; i < filterBook.length; i++) {
								Book book = filterBook[i];
								out.println("<div class=\"col-lg-3 col-md-4 col-sm-6 col-xs-12\">");
								out.println("<div class=\"book\" id=\"" + book.getMaSach()
										+ "\"><div class=\"icon-bar vertical\">");
								out.println("<ul><li><div class=\"button-modify\">");
								out.println("<div class=\"button-arc forest right\" onclick=\"gotoPage('ViewBook?id="
										+ book.getMaSach() + "')\">");
								out.println("<i class=\"fa fa-info-circle\" onclick=\"gotoPage('ViewBook?id=" + book.getMaSach()
										+ "')\"></i>");
								out.println(
										"<div class=\"content content-right\"><span>Thông tin chi tiết</span></div></div></div></li>");
								out.println(
										"<li><div class=\"button-modify\"><div class=\"button-arc cool right\" style=\"transform: translateY(150%)\">");
								out.println("<i class=\"fa fa-cart-plus\" onclick=\"addBookToCart('" + book.getMaSach()
										+ "', 1)\"></i>");
								out.println(
										"<div class=\"content content-right\"><span>Cho vào giỏ hàng</span></div></div></div></li>");
								out.println(
										"<li><div class=\"button-modify\"><div class=\"button-arc danger right\" style=\"transform: translateY(300%)\">");
								out.println("<i class=\"fa fa-money\" onclick=\"buyNow('" + book.getMaSach() + "', 1)\"></i>");
								out.println(
										"<div class=\"content content-right\"><span>Mua ngay</span></div></div></div></li></ul></div>");
								out.println("<div class=\"thumbnail\">");
								out.println("<img onclick=\"gotoPage('ViewBook?id=" + book.getMaSach()
										+ "')\" style=\"cursor:pointer\" alt=\"s00001\" src=\"lib/image/"
										+ book.getImages().getDuongDan() + "\"></div>");
								out.println("<div class=\"info-book\"><div class=\"title\">" + book.getTenSach() + "</div>");
								out.println("<div class=\"price\">" + book.getGiaBan() + "</div></div></div></div>");
							}
						}
					}
				%>
			</div>
		</div>
	</div>

	<!-- Phần footer cho trang Web -->
	<%@ include file="../comp/Footer.jsp"%>
</body>
</html>