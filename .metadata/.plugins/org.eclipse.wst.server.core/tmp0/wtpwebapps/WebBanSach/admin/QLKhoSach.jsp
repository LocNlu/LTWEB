<%@page import="model.bean.Image"%>
<%@page import="model.bean.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Admin Quản Lý</title>
<link rel="icon" type="image/png" href="../image/LOGO.ico" />

<link rel="stylesheet" type="text/css" href="../lib/css/stylesheet.css"
	data-minify="1" />
<link rel="stylesheet" type="text/css" href="../lib/css/style.css">
<link rel="stylesheet" type="text/css" href="../lib/css/sheet.css">
<link rel="stylesheet" type="text/css" href="../lib/css/styleView.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script type="text/javascript" src="../lib/js/jquery-3.3.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../lib/css/animate.css">

<script type="text/javascript">
	
</script>
</head>
<body class="common-home">

	<!-- Phần header cho trang Web -->
	<%@ include file="../comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<div class="row" style="background-color: #eeeeee;">
			<div class="col-sm-12">
				<h2 class="animated bounce" style="text-align: center;">
					<small>Quản lý kho sách</small>
				</h2>

				<div class="bookshelf">
					<div class="row content">
						<%
							String action = request.getParameter("action");
							boolean b = (action == null);
							if (b == true) {
								out.println("<div class=\"col-lg-3 col-md-3 col-sm-4 col-xs-6\">");
								out.println("<div class=\"book\" id=\"them\">");
								out.println("<a href=\"../Manager/Sach?action=add\">");
								out.print("<img alt=\"them\" src=\"../lib/image/plus.jpg\"");
								out.println(
										"style=\"width:100%; margin: 0px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);\"></img></a>");
								out.println("</div></div>");
							}

							Object result = request.getAttribute("danhSachSach");
							if (result != null && result instanceof Book[]) {
								Book[] books = (Book[]) result;
								for (int i = 0; i < books.length; i++) {
									String maSach = books[i].getMaSach();
									String tenSach = books[i].getTenSach();
									int giaBan = books[i].getGiaBan();
									Image pathImage = books[i].getImages();

									out.println("<div class=\"col-lg-3 col-md-3 col-sm-4 col-xs-6\">");
									out.println("<div class=\"book\" id=\"" + maSach + "\">");

									if (pathImage != null)
										out.println("<img style=\"cursor:pointer;\" onclick=\"gotoPage('../Manager/Sach?id=" + maSach
												+ "&action=modify')\" class=\"clear-margin f-center full-width\" alt=\"" + maSach
												+ "\" style=\"max-width: \" src=\"../lib/image/" + pathImage.getDuongDan() + "\">");
									out.println("</div></div>");
								}
							}
						%>

					</div>
				</div>
			</div>
		</div>
	</div>

	<form action="KhoSach?action=searchBook" method="POST"
		class="button-sticker">
		<div class="icon submit">
			<i class="fa fa-search"></i>
		</div>
		<div class="detail" id="min-width">
			<input type="text" placeholder="Search..." id="strSearch"
				name="strSearch" />
		</div>
	</form>

	<!-- Phần footer cho trang Web -->
	<%@ include file="../comp/Footer.jsp"%>

	<script type="text/javascript" src="../lib/js/ActionButtonSticker.js"></script>
</body>
</html>