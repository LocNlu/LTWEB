<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<body>
	<footer class="footer">
		<div class="content">
			<div class="site-footer">
				<div class="copyright clearfix">
					<div class="container">
						<div class="inner clearfix">
							<div class="row">
								<div class="col-md-12 text-center text-lg-left">
									<div class="col-md-12 text-center text-lg-left">
										<div class="col-sm-12 col-md-12 col-xs-12 footer-static-title">
											<div class="col-sm-4 col-md-4" style="padding-right: 10px;">
												<div class="col-sm-12 col-md-12 col-xs-12 icon-footer"
													style="margin-bottom: 10px;">
													<% 
														if (request.getRequestURI().indexOf("Manager") == -1)
															out.println("<img alt=\"logo\" src=\"image/logo.jpg\" style=\"width: 75px; margin-left: 8px;\">");
														else
															out.println("<img alt=\"logo\" src=\"../image/logo.jpg\" style=\"width: 75px; margin-left: 8px;\">");
													%>
													
												</div>
												<div class="col-sm-12 col-md-12 col-xs-12 address-footer"
													style="font-size: 13px; float: left;">Số 1, đường Võ
													Văn Ngân, phường Linh Chiểu, quận Thủ Đức, Tp.Hcm</div>
												<div class="col-sm-12 col-md-12 col-xs-12 address-footer"
													style="font-size: 13px; padding-top: 2px;">YeuSach.com
													nhận đặt hàng trực tuyến và giao hàng tận nơi. KHÔNG hỗ trợ
													đặt mua và nhận hàng trực tiếp tại văn phòng cũng như tất
													cả Hệ Thống Yêu sách Bookstore trên toàn quốc.</div>
											</div>
											<div class="col-sm-4 col-md-4 col-xs-12"
												style="padding: 0px;">
												<div class="col-sm-12 col-md-12 col-xs-12" align="center"
													style="font-size: 14.5px; margin-bottom: 20px; margin-top: 10px; padding: 0px;">
													<a target="_blank"
														href="javascript:void(0)"
														title="Facebook"> <img alt="Facebook"
														src="https://www.fahasa.com/skin/frontend/ma_vanese/fahasa/images/footer/Facebook-on.png">
													</a> <a target="_blank"
														href="javascript:void(0)"
														title="Instagram"> <img alt="Instagram"
														src="https://www.fahasa.com/skin/frontend/ma_vanese/fahasa/images//footer/Insta-on.png">
													</a> <a target="_blank" href="" title="Youtube"> <img
														alt="Youtube"
														src="https://www.fahasa.com/skin/frontend/ma_vanese/fahasa/images//footer/Youtube-on.png">
													</a> <a target="_blank" href="javascript:void(0)"
														title="Twitter"> <img alt="Twitter"
														src="https://www.fahasa.com/skin/frontend/ma_vanese/fahasa/images//footer/twitter-on.png">
													</a>

												</div>
												<div class="col-sm-12 col-md-12 col-xs-12"
													style="font-size: 14.5px">
													<div class="col-sm-6 col-md-6 col-xs-6"
														style="text-align: right;">
														<a
															href="javascript:void(0)">
															<img alt="Bookstore.COM"
															src="https://www.fahasa.com/media/wysiwyg/Logo-NCC/android.png"
															style="max-width: 110px;">
														</a>
													</div>
													<div class="col-sm-6 col-md-6 col-xs-6">
														<a href="javascript:void(0)"> <img
															alt="Bookstore.COM"
															src="https://www.fahasa.com/media/wysiwyg/Logo-NCC/appstore.png"
															style="max-width: 110px;">
														</a>
													</div>
												</div>
											</div>
											<div class="col-sm-4 col-md-4 " style="padding: 5px;">
												<div class="footer-static-title">
													<h3>Liên hệ</h3>
												</div>
												<div class="footer-static-content">
													<ul>
														<li class="first"><em class="fa fa-map-marker">&nbsp;</em><span>
															Địa Chỉ:</span> 01 Võ Văn Ngân, Linh Trung, Thủ Đức, TP. HCM</li>
														<li><em class="fa fa-envelope">&nbsp;</em><span>
														Email:</span> Yeusach@YeusachBookstore.com</li>
														<li class="last"><em class="fa fa-phone">&nbsp;</em><span>
															Phone:</span> 190055555</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</footer>

	<script>
		$(document).ready(function() {
			$('a.signup-window').click(function() {
				//lấy giá trị thuộc tính href - chính là phần tử "#signup-box"
				var signupBox = $(this).attr('href');
				//cho hiện hộp đăng nhập trong 300ms
				$(signupBox).fadeIn(400);
				// thêm phần tử id="over" vào sau body
				$('body').append('<div id="over">');
				$('#over').fadeIn(400);
				return false;
			});
			// khi click đóng hộp thoại
			$(document).on('click', "span.img-close, #over", function() {
				$('#over, .signup-container').fadeOut(200, function() {
					$('#over').remove();
				});
				return false;
			});
		});

		function addCart() {
			var url = 'ViewCart?action=add'
			var name = $('#username').val();
			var address = $('#address').val();
			var phone = $('#phone').val();

			$.post(url, {
				name : name,
				address : address,
				phone : phone
			}, function() {
				alert('Đặt hàng thành công!');

				var url = location.href;
				deleteAllCookie();
				location.href = url.substring(0, url.lastIndexOf('/'));
			});
		}

		function buyNow(id, soluong) {
			addBookToCart(id, soluong);
			showPayDialog();
		}

		function showPayDialog() {
			//cho hiện hộp đăng nhập trong 300ms
			$('.dialog').fadeIn(300);

			// thêm phần tử id="over" vào sau body
			$('body').append('<div id="over">');
			$('#over').fadeIn(300);
		}

		function addBookToCart(id, soluong) {
			var count = getCookie("countBook");
			if (count.length == 0)
				count = 1;
			else
				count++;

			setCookie("book" + count, "id:" + id + "-count:" + soluong); //Thêm sách đã mua vào cookie
			setCookie("countBook", count);
			$(".cart-count").load(document.URL + " #number");
			$("#countInput").load(document.URL + " #count");
		}

		//Goto url
		function gotoPage(url) {
			document.location.href = url;
		}

		//Use in ViewBook.jsp
		function getNumberBuy() {
			var inputNumber = document.getElementById("count");
			return inputNumber.value;
		}

		//Use in ViewBook.jsp
		function zoomImage(mini_image, zoom_image, name) {
			var url = "url" + "(lib/image/" + name + ")";
			var image = document.getElementById(zoom_image);
			image.style.content = url; //Thay đổi đường dẫn của zoom-image 

			/*Thay đổi active image*/
			var oldActiveImage = document
					.getElementsByClassName("mini-image active")[0];
			oldActiveImage.className = "mini-image"; //Xóa trạng thái active hình hiện tại
			mouseOutImage(oldActiveImage);//Chỉnh sửa thuộc tính cho hình
			mini_image.className = "mini-image active"; //Kích hoạt trạng thía active mới
		}

		//Use in ViewBook.jsp
		function mouseHoverImage(img) {
			if (img.className == "mini-image") {
				img.style.opacity = 1.0;
				img.children[0].border = "1px solid gray";
			}
		}

		//Use in ViewBook.jsp
		function mouseOutImage(img) {
			if (img.className == "mini-image") {
				img.style.opacity = 0.75;
				img.children[0].border = "none";
			}
		}
		//
		function sendSearch() {
			var temp = document.getElementById("Search").value;
			window.location.href = "Search?strSearch=" + temp;
		}
	</script>
</body>
</html>