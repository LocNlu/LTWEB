<%@page import="model.bean.Banner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet" type="text/css" href="lib/css/styleView.css">
<link rel="stylesheet" type="text/css" href="lib/css/styleBannerIn.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/js/vu.js"></script>

</head>
<body>

	<!-- Phần header cho trang Web -->
	<%@ include file="../comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<div class="row" style="background-color: #eeeeee;">
			<div class="col-md-12s col-sm-12"">
				<h3
					style="text-align: center; border-bottom: 1px groove; padding-bottom: 0.25em">Thông
					tin chi tiết bản tin</h3>
				<ul class="table-modify">
					<li class="row-table">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							
								<%
								Object obj = request.getAttribute("banner");
								Banner banner = (Banner)obj;
								if (obj instanceof Banner) {
									String Anh= banner.getAnh();
									String TieuDe=banner.getTieuDe();
									String NoiDung=banner.getNoiDung();
									out.println("<div class=\"AnhBan\"><img src=\"image/"+Anh+"\"style=\"width: 100%; background-repeat: no-repeat;\"></div>");
									out.println("<div class=\"titBT1\"><div id=\"titBT\"><span>"+TieuDe+"</span></div></div>");
									out.println("<div class=\"contBT\"><textarea>"+NoiDung+"</textarea></div>");
								}
								%>
									<!-- <img src="../image/banner-02.jpg"style="width: 100%; background-repeat: no-repeat;">
									<div class="titBT"><input type="text"></div>
									<div class="contBT"><textarea rows="" cols=""></textarea></div> -->
							
							</div>
					
						</div>
					</li>

				</ul>
			</div>
		</div>
	</div>


	<!-- Phần footer cho trang Web -->
	<%@ include file="../comp/Footer.jsp"%>
</body>
</html>