$(document).ready(function(){
	
	$(document).on("click", ".button-sticker .icon, .button-sticker .icon i", function(){
		var width=$(".button-sticker .detail input").css("width");
		var size=$(".button-sticker .detail").attr("id");
		if (size == "min-width" && width == "54px"){
			$(".button-sticker .detail input").animate({"width":"500px"}, 350, function(){
				$(".button-sticker .detail").attr("id", "max-width");
				$(".button-sticker .detail input").focus();
			});
		} else if (size == "max-width" && width == "500px"){
			$(".button-sticker .detail input").animate({"width":"54px"}, 350, function(){
				$(".button-sticker .detail").attr("id", "min-width");
				$(".button-sticker .detail input").val("");
			});
		}
		
	});
	
});