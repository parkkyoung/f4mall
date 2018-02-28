$(function(){
	// 윈도우 스크롤 시에
	$(window).scroll(function(){
		// 피씨화면 gnb
		if($(window).width()>767){
			if($(window).scrollTop()>$(".head").outerHeight()) $(".gnb").addClass("on");
			else $(".gnb").removeClass("on");
		};
		// 모바일 화면 header
		if($(window).width()<=767){
			if($(window).scrollTop()>$("#header").outerHeight()) $("#header").addClass("on");
			else $("#header").removeClass("on");
		};
	});

	// 모바일 left menu
	var pushLeft = new Menu({
		wrapper: '#wrap',
		type: 'push-left',
		menuOpenerClass: '.btnGnb',
		maskId: '#c-mask'
	  });

	  var pushLeftBtn = document.querySelector('.btnGnb');
	  
	  pushLeftBtn.addEventListener('click', function(e) {
		e.preventDefault;
		pushLeft.open();
	  });

	// 체크박스 전체선택(컨트롤러)
	$(".checkController").change(function(){
		var controller = $(this).attr("data-controller"); // 체크 컨트롤러
		var bl = $(this).is(":checked"); // 체크 컨트롤러의 체크박스 상태

		// 체크 멤버중 컨트롤러와 같은 멤버 체크 및 해제
		$(".checkMember").each(function(){
			var target = $(this).attr("data-target"); // 멤버의 타겟
			if(target == controller && bl == true) $(this).prop("checked", true);
			else if (target == controller && bl == false) $(this).prop("checked", false);
		});
	});

	// 체크박스 멤버선택
	$(".checkMember").change(function(){
		var target = $(this).attr("data-target"); // 멤버의 타겟
		var checkLength = 0; // 타겟팅 설정된 멤버 수
		var checkTrue = 0; // 타겟팅 설정된 멤버 중 true 된 수

		// 체크 멤버 중 타겟팅 멤버 수와 그 중 true 멤버 수
		$(".checkMember").each(function(){
			if($(this).attr("data-target") == target) {
				checkLength++;
				if($(this).is(":checked") == true) checkTrue++;
			};
		});

		// 컨트롤러 체크 및 해제
		if(checkLength == checkTrue) {
			$(".checkController").each(function(){
				if($(this).attr("data-controller") == target) $(this).prop("checked", true);
			});
		} else {
			$(".checkController").each(function(){
				if($(this).attr("data-controller") == target) $(this).prop("checked", false);
			});
		};
	});
});