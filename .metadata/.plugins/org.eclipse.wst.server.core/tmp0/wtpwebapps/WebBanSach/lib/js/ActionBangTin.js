/*
 * Thêm bảng tin mới
 */
function addBangTin(){
	alert("Tạo bảng tin");
}



/*
 * Cập nhật bảng tin đã chọn
 */
function updateBangTin(){
	alert("Cập nhật bảng tin");
}



/*
 * Xoá bảng tin đã chọn
 */
function deleteBangTin(id){
	alert("Xóa bảng tin");
}



/*
 * Hiện hộp thoại thêm bảng tin
 */
function showAddDialog(){
	//Cập nhật trạng thái thanh icon
	$('i.table-icon').attr('id', '');
	
	//Đổi tiêu đề thanh header
	$(".dialog .header .title").text("Tạo bảng tin mới");
	
	//Cập nhật sự kiện cho dialog button
	$(document).off("click", ".submit-button");
	$(document).on("click", ".submit-button", addBT);
	$(document).on("click", ".submit-button", addBangTin);
	
	//cho hiện hộp đăng nhập trong 300ms
	$('#input-form').fadeIn(300);

	// thêm phần tử id="over" vào sau body
	$('body').append('<div id="over">');
	$('#over').fadeIn(300);
}



/*
 * Hiện hộp thoại cập nhật bảng tin
 */
function showUpdateDialog(id){
	//Khôi phục bảng về chế độ chỉ xem
	$('.data').removeClass("select-style");
	
	//Đổi tiêu đề thanh header
	$(".dialog .header .title").text("Cập nhật bảng tin");
	
	//Cập nhật dữ liệu cho dialog
	var data = $('tr#' + id);
	var titleBT=$(data).children().eq(1).text();
	var contentBT=$(data).children().eq(2).text();
	var showImage=$(data).children().eq(3).find("img").attr("src");
	$(".dialog .content .detail #titleBT").val(titleBT);
	$(".dialog .content .detail textarea").val(contentBT);
	$(".dialog .content .mini-image").attr("src", showImage);
	$(".dialog .content .submit-button").attr("id", id);
	
	//Cập nhật sự kiện cho dialog button
	$(document).off("click", ".submit-button");
	$(document).on("click", ".submit-button", upBT);
	$(document).on("click", ".submit-button", updateBangTin);
	
	//cho hiện hộp đăng nhập trong 300ms
	$('#input-form').fadeIn(300);

	// thêm phần tử id="over" vào sau body
	$('body').append('<div id="over">');
	$('#over').fadeIn(300);
}



/*
 * Hiện hộp thoại xóa bảng tin
 */
function showDeleteDialog(id){
	//Khôi phục bảng về chế độ chỉ xem
	$('.data').removeClass("select-style");
	$(".dialog .content .submit").attr("id", id);
	
	//Cập nhật sự kiện cho dialog button
	$(document).off("click", ".submit");
	$(document).on("click", ".submit", delBT);
	$(document).on("click", ".submit", deleteBangTin);
	
	//cho hiện hộp đăng nhập trong 300ms
	$('#confirm-form').fadeIn(300);

	// thêm phần tử id="over" vào sau body
	$('body').append('<div id="over">');
	$('#over').fadeIn(300);
}



/*
 * Event
 */
$(document).ready(function() {
	/*
	 * Khi click đóng hộp thoại
	 */
	$(document).on("click", "a.close, #over, button.cancel", function() {
		$('#over, .dialog').fadeOut(300, function() {
			$('#over').remove();
		});
		return false;
	});
	
	
	
	/*
	 * Click vào icon trạng thái
	 */
	$(document).on("click", ".table-icon", function(){
		//Kiểm tra icon đã được chọn từ trước hay chưa?
		var stateIcon=$(this).attr("id");
		if(stateIcon != "selected"){
			//Reset id hiện tại của tất cả icon
			$(".table-icon").attr("id", "");
			
			//Trạng thái thao tác với bảng đã chọn
			var state=$(this).parent().attr("id");
			if(state!=null){
				if (state == "add") showAddDialog();
				else $(this).attr("id", "selected");
			}
		} else {
			//Xóa id hiện tại của icon đã chọn
			$(this).attr("id", "");
		}
	});
	
	
	
	/*
	 * Khi click vào dòng dữ liệu
	 */
	$(document).on("click", "tr.data", function(){
		//Lấy mã bảng tin đã chọn
		var id=$(this).attr('id');

		//Lấy thao tác đã chọn
		var state=$('i.table-icon#selected').parent().attr('id');
		if (state != null){
			var id=$(this).attr("id");
			if(state == "update") showUpdateDialog(id);
			else if(state == "delete") showDeleteDialog(id);
		}
	});
	
	
	
	/*
	 * Click icon update
	 */
	$(document).on("click", "#update>i, #delete>i", function(){
		$(document).on("mouseover", "tr.data", function(){
			var state=$('i.table-icon#selected').parent().attr('id');
			if (state != null && (state == "update" || state == "delete")){
				$('.data').removeClass("select-style");
				$('.data').addClass("default-style");
				$(this).addClass("select-style");
			}
		});
	});
	
	
	
	/*
	 * Khi di chuyển chuột ra khỏi bảng
	 */
	$(document).on("mouseleave", "table", function(){
		$('.data').removeClass("select-style");
	});
});