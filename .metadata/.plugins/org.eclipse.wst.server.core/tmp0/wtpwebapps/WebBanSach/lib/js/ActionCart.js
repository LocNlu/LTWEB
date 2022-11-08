function removeBookFromCart(row) {
	//Thực hiện xóa sách
	var index = $(row).attr('id');
	$(row).parent().remove(); //Xóa sách hiện trên màn hình
	deleteCookie(getNameCookieAt(index));
	var soLuong = getCookie('countBook') - 1;//Giảm số lượng lần mua trong biến đếm
	setCookie('countBook', soLuong);
	
	//Cập nhật lại bảng sách
	refreshTableBook();
	
	//Cập nhật lại bảng giá
	refreshTablePrice();
	
	//Cập nhật header giỏ hàng
	refreshHeaderButtonCart(soLuong)
}

function refreshTableBook(){
	var rowTables = $('.row-table');
	if (rowTables.length > 0){
		for (var i=0; i<rowTables.length; i++){
			var deleteBook = $(rowTables[i]).find('.deleteBook');
			var input = $(rowTables[i]).find('input');
			$(deleteBook).attr('id', i);
			$(input).attr('id', i);
		}
	}
	else {
		$('.table-modify').append('<p class="error">Giỏ hàng trống</p>');
	}
}

function refreshTablePrice(){
	var totalPrice = getTotalPrice();
	$('#totalPrice').text(totalPrice + "đ");
	if (totalPrice == 0){
		$('#button-confirm').find('a').remove();
		$('#button-confirm').append('<a><i class=\"fa fa-money\"></i> <span class=\"content-inner\">Thanh toán</span></a>');
	}
}

function refreshHeaderButtonCart(count){
	var button = $('.cart-count')[0];
	$(button).find('#number').text(count);
}

function updateBookInCart(index, input) {
	setBookCount(index, input);
	refreshTablePrice();
}

function getTotalPrice(){
	var rowTables = $('.row-table');
	var totalPrice = 0;
	if (rowTables.length > 0){
		for (var i=0; i<rowTables.length; i++){
			var input = $(rowTables[i]).find('input');
			var gia = $(rowTables[i]).find('#price');
			totalPrice = totalPrice + input.val()*gia.text();
		}
	}
	return totalPrice;
}

//Lấy thông tin của cuốn sách nằm ở vị trí index
function getBookInfo(index) {
	return getCookieAt(index);
}

//Lấy mã sách của cuốn sách nằm ở vị trí index
function getBookId(index) {
	var info = getBookInfo(index);
	if (info != null) {
		return info.split("-")[0].split(":")[1];
	}
}

//Lấy số lượng của cuốn sách nằm ở vị trí index
function getBookCount(index) {
	var info = getBookInfo(index);
	if (info != null) {
		return info.split("-")[1].split(":")[1];
	}
}

//Cập nhật lại thông tin cuốn sách ở vị trí index
function setBookInfo(index, info) {
	var cname = getNameCookieAt(index);
	insertCookieAt(cname, info, index);
}

//Cập nhật lại số lượng cuốn sách ở vị trí index
function setBookCount(index, input) {
	var maSach = getBookId(index);
	var soLuong = input.value;
	var newInfo = "id:" + maSach + "-" + "count:" + soLuong;

	var count = getCookie("countBook");
	deleteCookie("countBook");
	setBookInfo(index, newInfo);
	setCookie("countBook", count);
}

$(document).ready(
		function() {
			$('a.login-window').click(function() {
				//lấy giá trị thuộc tính href - chính là phần tử "#login-box"
				var loginBox = $(this).attr('href');

				//cho hiện hộp đăng nhập trong 300ms
				$(loginBox).fadeIn(300);

				// thêm phần tử id="over" vào sau body
				$('body').append('<div id="over">');
				$('#over').fadeIn(300);

				return false;
			});

			// khi click đóng hộp thoại
			$(document).on('click',
					"a.close, #over, button.submit-button", function() {
						$('#over, .dialog').fadeOut(300, function() {
							$('#over').remove();
						});
						return false;
					});
		});