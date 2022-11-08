/**Read and Write Cookie*/

//Đọc và trả về giá trị của cookie
function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

//Lấy cookie tại vị trí index trong danh sách cookie
function getCookieAt(index){
	var arr = getListCookie();
	if (arr.length <= index) return null;
	return getCookie(getNameCookie(arr[index]));
}

//Trả về tên của cookie
function getNameCookie(cookie){
	return cookie.split("=")[0].trim();
}

//Trả về tên của cookie
function getNameCookieAt(index){
	var cookies = getListCookie();
	if (cookies.length <= index) return null;
	return getNameCookie(cookies[index]);
}

//Trả về danh sách cookie có trong page hiện tại
function getListCookie(){
	var cookies = document.cookie.split(';');
	var result = [];
	for (var i = 0 ; i < cookies.length; i++) {
		result[i] = cookies[i];
	}
	return result;
}

//Trả về danh sách TÊN cookie có trong page hiện tại
function getListCookieName(){
	var cookies = getListCookie();
	var result = [];
	for (var i = 0 ; i < cookies.length; i++){
		var name = getNameCookie(cookies[i]);
		result[i] = name;
	}
	return result;
}

//Trả về danh sách GIÁ TRỊ cookie có trong page hiện tại
function getListCookieValue(){
	var cookies = getListCookie();
	var result = [];
	for (var i = 0 ; i < cookies.length; i++){
		var value = getCookieAt(i);
		result[i] = value;
	}
	return result;
}

//Lưu một cookie mới
function setCookie(cname, cvalue) {
    document.cookie = cname + "=" + cvalue + ";" + ";path=/";
}

//Chèn cookie vào vị trí index
function insertCookieAt(cname, cvalue, index){
	var names = getListCookieName();
	var values = getListCookieValue();
	
	//Xoá cookie cũ
	for (var i=index; i<names.length; i++){
		var name = names[i];
		deleteCookie(name);
	}
	
	//Cập nhật cookie mới
	setCookie(cname, cvalue);
	for (var i=index+1; i<names.length; i++){
		var name = names[i];
		var value = values[i];
		setCookie(name, value);
	}
}

//Xóa cookie
function deleteCookie(cname) {
	if(getCookie(cname) != "") {
		document.cookie = cname + "=;;path=/;expires=Thu, 01 Jan 1970 00:00:01 GMT";
	}
}

//Xoá tất cả cookies
function deleteAllCookie(){
	var cookies = getListCookie();
	for(var i=0; i<cookies.length; i++){
		var name = getNameCookie(cookies[i]);
		deleteCookie(name);
	}
}