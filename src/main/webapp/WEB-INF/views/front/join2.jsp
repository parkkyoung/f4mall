<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="template/header.jsp"%>

<!-- page script -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<!--아이디 체크-->
<script>

	$(document).ready(function() {

		$('#m_id1').keyup(function(event) {

			// console.log("----");
			var m_id = $(this).val();
			var m_id_pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			//console.log('id값 ='+m_id);
			if (!(m_id_pattern.test(m_id))) {
				$('#m_id_msg').html('이메일형식을 입력해주세요.').css('color', 'red');
				return;
			}

			//서버로 id전송(Ajax통신)
			$.ajax({
				url : 'check_id.do',
				data : { 'm_id' : m_id },
				success : function(data) {
					// data="[{'result':'yes'}]";
					var json = eval(data);
					// var json=[{'result':'yes'}];    => 배열이다
					if (json[0].result == 'yes') {
						$('#m_id_msg').html('사용 가능한 아이디입니다').css('color', 'blue');
					} else {
						$('#m_id_msg').html('이미 사용중인 아이디입니다').css('color', 'red');
					}
				}
			});
		});


		<!-- 닉네임중복체크 -->
		$('#m_nick').keyup(function(event) {

			
			var m_nick = $(this).val();
			var m_nick_pattern = /^[가-힣a-zA-Z]+$/;
			if (!(m_nick_pattern.test(m_nick))) {
				$('#m_nick_msg').html('한글 or 영문으로!').css('color', 'red');
				return;
			}

			//서버로 m_nick전송(Ajax통신)
			$.ajax({
				url : 'check_nick.do',
				data : { 'm_nick' : m_nick },
				success : function(data) {
					// data="[{'result':'yes'}]";
					var json = eval(data);
					// var json=[{'result':'yes'}];    => 배열이다
					if (json[0].result == 'yes') {
						$('#m_nick_msg').html('사용 가능한 닉네임입니다').css('color', 'blue');
					} else {
						$('#m_nick_msg').html('이미 사용중인 닉네임입니다').css('color', 'red');
					}

					if (!(m_nick_pattern.test(m_nick))) {

						$('#m_nick_msg').html('한글이나 영문으로!!.').css('color', 'red');
						$("#m_nick").addClass("alert alert-danger").removeClass("alert-success");
					} else {

						$('#m_nick_msg').html('멋진닉네임이에요!!').css('color', 'blue');
						$("#m_nick").addClass("alert alert-success").removeClass("alert-danger");
					}
				}
			});
		});


		<!--비밀번호 체크-->
		$('#m_pwd1').keyup(function(event) {

			// 비밀번호 유효성 체크
			var m_pwd = $(this).val();
			var m_pwd = $(this).val();
			var m_pwd_pattern = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

			if (!(m_pwd_pattern.test(m_pwd))) {

				$('#m1_pwd_msg').html('영문, 숫자 혼합하여 6~20자리 이내.').css('color', 'red');
				$("#m_pwd1").addClass("alert alert-danger").removeClass("alert-success");
			} else {

				$('#m1_pwd_msg').html('사용가능한 비밀번호입니다').css('color', 'blue');
				$("#m_pwd1").addClass("alert alert-success").removeClass("alert-danger");
			}


			<!--비밀번호 이중체크-->
			$('#m1_pwd').keyup(function(event) {

				if ($('#m1_pwd').val() != $('#m_pwd1').val()) {

					$('#m1_pwd_msg').html('비밀번호가 틀립니다').css('color', 'red');
					$("#m1_pwd").addClass("alert alert-danger").removeClass("alert-success");
				} else if ($('#m1_pwd').val() == $('#m_pwd1').val()) {
					$('#m1_pwd_msg').html('비밀번호 일치').css('color', 'blue');
					$("#m1_pwd").addClass("alert alert-success").removeClass("alert-danger");

				}
			});
		});
		
		
		<!--업로드이미지 미리보기-->
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image_section').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#m_image").change(function() {
			readURL(this);
		});
	});
	

	<!-- 다음 우편 -->
	function findAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullAddr = ''; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수

				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					fullAddr = data.roadAddress;

				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					fullAddr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				if (data.userSelectedType === 'R') {
					//법정동명이 있을 경우 추가한다.
					if (data.bname !== '') {
						extraAddr += data.bname;
					}
					// 건물명이 있을 경우 추가한다.
					if (data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('m_zipcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('m_addr').value = fullAddr;

				// 커서를 상세주소 필드로 이동한다.
				document.getElementById('m_addr_d').focus();
			}
		}).open();
	}


	<!--회원가입-->
	function join(f) {
		
		var m_id 		= f.m_id1.value.trim();
		var m_pwd 		= f.m_pwd1.value.trim();
		var m_name 	    = f.m_name.value.trim();
		var m_nick 	    = f.m_nick.value.trim();
		var m_zipcode = f.m_zipcode.value.trim();
		var m_addr 		= f.m_addr.value.trim();
		var m_addr_d 	= f.m_addr_d.value.trim();
		var m_tel 		= f.m_tel.value.trim();
		var m_image     = f.m_image.value;


		// 값 체크
		if (m_id == '') {
			alert('아이디를 입력해주세요');
			f.m_id.focus();
			return;
		}

		if (m_pwd == '') {
			alert('비밀번호를 확인해주세요');
			f.m_pwd.focus();
			return;
		}


		if (m_name == '') {
			alert('이름을 확인해주세요');
			f.m_name.focus();
			return;
		}

		if (m_nick == '') {
			alert('닉네임을 확인해주세요');
			f.m_nick.focus();
			return;
		}


		if (m_zipcode == '') {
			alert('우편번호를 입력 해주세요');
			f.m_zipcode.focus();
			return;
		}

		if (m_addr == '') {
			alert('주소를 확인해주세요');
			f.m_addr.focus();
			return;
		}

		if (m_addr_d == '') {
			alert('상세주소를 확인해주세요');
			f.m_addr_d.focus();
			return;
		}

		if (m_tel == '') {
			alert('전화번호를 확인해주세요');
			f.m_tel.focus();
			return;
		}

		f.action = 'member_insert.do';
		f.submit();

		swal({
			text : "회원가입이 완료되었습니다.",
			icon : "success",
		}).then((value) => {
			location.href = "index.do";
		});
	};
	
</script>

<!-- visual -->
<section class="subVisual">
	<h2>회원가입</h2>
	<img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_pc_member.jpg" 
	     alt="sub visual" class="imgPc" /> 
	<img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_mobile_member.jpg" 
	     alt="sub visual" class="imgMobile" />
</section>
<!-- //visual -->

<!-- sub contents -->
<form method="POST" enctype="multipart/form-data">
	<input type="hidden" value="0">
	<section class="sub container">
		<div class="form-horizontal">
			<div class="form-group">
				<label for="id" class="col-sm-4 control-label">ID</label>
				<div class="col-sm-6">
					<input type="text" name="m_id" id="m_id1" class="form-control alert alert-success" placeholder="메일 주소" /> 
					<span class="mt5" id="m_id_msg">메일 주소로 작성해주세요</span>
				</div>
			</div>

			<!-- 패스워드 유효성검사 체크 후에 완료되면 .alert-success 실패하면 alert-danger 추가 -->
			<div class="form-group">
				<label for="pw" class="col-sm-4 control-label">Password</label>
				<div class="col-sm-4">
					<input type="password" name="m_pwd" id="m_pwd1" class="form-control" placeholder="비밀번호" /> 
						<span class="mt5" id="m_pwd1_msg"></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<input type="password" name="m1_pwd" id="m1_pwd" class="form-control" placeholder="비밀번호 확인" /> 
						<span class="mt5" id="m1_pwd_msg"></span>
				</div>
			</div>
				<div class="form-group">
				<label for="name" class="col-sm-4 control-label">이름</label>
				<div class="col-sm-4">
					<input type="text" id="m_name" name="m_name" class="form-control" placeholder="이름" />
				</div>
			</div>

			<div class="form-group">
				<label for="nick" class="col-sm-4 control-label">닉네임</label>
				<div class="col-sm-4">
					<input type="text" id="m_nick" name="m_nick" class="form-control" placeholder="닉네임" /> 
					<span class="mt5" id="m_nick_msg"></span>
				</div>
			</div>

			<div class="form-group">
				<label for="btnNumber" class="col-sm-4 col-xs-12 control-label">주소</label>
				<div class="col-sm-4 col-xs-8">
					<input type="text" id="m_zipcode" name="m_zipcode" class="form-control" placeholder="우편번호" readonly />
				</div>
				<div class="col-sm-4 col-xs-4">
					<button type="button" id="btnNumber" class="btn btn-warning" onclick="findAddress()">주소찾기</button>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-6">
					<input type="text" id="m_addr" name="m_addr" class="form-control" placeholder="도로명주소" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-6">
					<input type="text" id="m_addr_d" name="m_addr_d" class="form-control" placeholder="상세주소" />
				</div>
			</div>
			<div class="form-group">
				<label for="phoneNumber" class="col-sm-4 control-label">핸드폰번호</label>
				<div class="col-sm-4">
					<input type="tel" id="m_tel" name="m_tel" class="form-control" placeholder="괄호(-) 없이 숫자만 입력해주세요" />
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-sm-4 control-label">이미지(30x30)</label> 
				<div class="col-sm-4"><input type="file" id="m_image" name="m_image_m" class="form-control"/></div>
				<img id="image_section" width="100" src="${ pageContext.request.contextPath }/resources/upload/${ user.m_image }"/>
			</div>
			<div class="form-group btnBox">
				<button type="button" class="btn btn-primary btn-lg" onclick="join(this.form);">회원가입</button>
			</div>
		</div>
	</section>
</form>
<!-- //sub contents -->
<%@include file="template/footer.jsp"%>