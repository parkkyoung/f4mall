<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="template/header.jsp"%>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<!-- page script -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>



<script>

	$(document).ready(function() {

		<!--비밀번호 체크-->
		$('#mm_pwd').keyup(function(event) {

			// 비밀번호 유효성 체크
			var mm_pwd = $(this).val();
			var mm1_pwd = $(this).val();
			var mm_pwd_pattern = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

			if (!(mm_pwd_pattern.test(mm_pwd))) {

				$('#mm_pwd_msg').html('영문, 숫자 혼합하여 6~20자리 이내.').css('color', 'red');
				$("#mm_pwd").addClass("alert alert-danger").removeClass("alert-success");
			} else {

				$('#mm_pwd_msg').html('사용가능한 비밀번호입니다').css('color', 'blue');
				$("#mm_pwd").addClass("alert alert-success").removeClass("alert-danger");
			}
			

			<!--비밀번호 이중체크-->
			$('#mm1_pwd').keyup(function(event) {

				if ($('#mm1_pwd').val() != $('#mm_pwd').val()) {

					$('#mm1_pwd_msg').html('비밀번호가 틀립니다').css('color', 'red');
					$("#mm1_pwd").addClass("alert alert-danger").removeClass("alert-success");
				} else if ($('#mm1_pwd').val() == $('#mm_pwd').val()) {
					$('#mm1_pwd_msg').html('비밀번호 일치').css('color', 'blue');
					$("#mm1_pwd").addClass("alert alert-success").removeClass("alert-danger");

				}
			});
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
				document.getElementById('addressNumber').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('address').value = fullAddr;

				// 커서를 상세주소 필드로 이동한다.
				document.getElementById('address2').focus();
			}
		  }).open();
		};


	function send_update(f) {
		var m_id      = f.mm_id.value.trim();
		var m_pwd     = f.mm_pwd.value.trim();
		var m_name    = f.mm_name.value.trim();
		var m_nick    = f.mm_nick.value.trim();
		var m_tel     = f.mm_tel.value.trim();
		var m_addr    = f.mm_addr.value.trim();
		var m_addr_d  = f.mm_addr_d.value.trim();
		/* var m_image   = f.mm_image.value;  */
		var m_zipcode = f.mm_zipcode.value.trim();

		if (m_id == '') {
			alert('이름을 입력하세요');
			f.m_id.focus();
			return;
		}

		if (m_pwd == '') {
			alert('비밀번호를 입력하세요');
			f.m_pwd.focus();
			return;
		}

		if (m_name == '') {
			alert('이름을 입력하세요');
			f.m_name.focus();
			return;
		}

		if (m_nick == '') {
			alert('닉네임을 입력하세요');
			f.m_nick.focus();
			return;
		}

		if (m_addr == '') {
			alert('주소를 입력하세요');
			f.m_addr.focus();
			return;
		}

		if (m_addr_d == '') {
			alert('상세주소를 입력하세요');
			f.m_addr_d.focus();
			return;
		}

		if (m_zipcode == '') {
				alert('우편번호를 입력하세요');
				return;
			} 


		f.action = 'member_update.do';
		f.submit();

		swal({
			text : "정보수정이 완료되었습니다.",
			icon : "success",
		}).then((value) => {
			location.href = "member_list.do";
		});
	}
	;
</script>

<!-- page title -->
<h1 class="page-header">회원상세</h1>
<!-- //page title -->

<!-- 회원상세 -->
<div class="panel panel-default">
	<div class="panel-heading">회원상세</div>
	<div class="panel-body">
		<form action="member_insert.do" role="form" class="panel-body" method="POST" enctype="multipart/form-data">
			<div class="row">
				<div class="col-lg-6">
					<div class="form-group">
						<label for="">IP</label> 
						<input type="text" class="form-control"placeholder="아이피 주소" value="${user.m_ip }" readonly />
					</div>
					<div class="form-group">
						<label for="">ID</label> 
						<input type="text" name="m_id" id="mm_id"class="form-control" placeholder="메일 주소" value="${user.m_id }"readonly />
					</div>
					<div class="form-group">
						<label for="">패스워드</label> 
						<input type="password" name="m_pwd" id="mm_pwd" class="form-control" placeholder="비밀번호"value="${user.m_pwd }" /> 
						<span class="mt5" id="mm_pwd_msg"></span>
					</div>
					<div class="form-group">
						<input type="password" id="mm1_pwd" class="form-control"placeholder="비밀번호 확인" value="" /> 
						<span class="mt5" id="mm1_pwd_msg"></span>
					</div>
					<div class="form-group">
						<label for="">이름</label> 
						<input type="text" name="m_name"id="mm_name" class="form-control" placeholder="이름"value="${user.m_name }" />
					</div>
					<div class="form-group">
						<label for="">닉네임</label> 
						<input type="text" name="m_nick"id="mm_nick" class="form-control" placeholder="닉네임"value="${user.m_nick }" />
						<span class="mt5" id="m_nick_msg"></span>
					</div>
					<div class="form-group">
						<label for="">핸드폰번호</label> 
						<input type="number" name="m_tel"id="mm_tel" class="form-control" placeholder="괄호(-)없이 숫자만 입력" value="${user.m_tel }" />
					</div>
				</div>
				<div class="col-lg-6">
					<div class="form-group">
						<label for="">가입일자</label> <input type="text" class="form-control"placeholder="YYYY-MM-DD" value="${user.m_regdate }" readonly>
					</div>
					<div class="form-group">
						<label for="">주소</label>
						<div class="row">
							<div class="col-xs-8">
								<input type="text" name="m_zipcode" id="mm_zipcode"class="form-control" placeholder="우편번호"/>
							</div>
							<div class="col-xs-4">
								<button type="button" class="btn btn-warning"onclick="findAddress()">주소찾기</button>
							</div>
						</div>
					</div>
					<div class="form-group">
						<input type="text" name="m_addr" id="mm_addr" class="form-control"placeholder="지번주소" value="${user.m_addr }" />
					</div>
					<div class="form-group">
						<input type="text" name="m_addr_d" id="mm_addr_d"class="form-control" placeholder="상세주소" value="${user.m_addr_d }" />
					</div>
					</div>
					<div class="col-lg-12">
						<div class="form-group text-right" float="rigth">
							<button type="button" class="btn btn-primary" onclick="send_update(this.form); return false;">회원수정</button>
						</div>
					</div>
			</form>
	</div>
</div>
<!-- //회원상세 -->

<%@include file="template/footer.jsp"%>