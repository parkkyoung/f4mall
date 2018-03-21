<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="template/header.jsp"%>

<!-- page script -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 다음 우편 -->


<!--아이디 체크-->

<script>

	$(document).ready(function() {

		$('#admin_id').keyup(function(event) {

			var m_id = $(this).val();
			var m_id_pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if (!(m_id_pattern.test(m_id))) {
				$('#admin_id_msg').html('이메일형식을 입력해주세요.').css('color', 'red');
				return;
			}

			//서버로 id전송(Ajax통신)
			$.ajax({
				url  : 'check_id.do',
				data : { 'm_id' : m_id },
				success : function(data) {
					// data="[{'result':'yes'}]";
					var json = eval(data);
					// var json=[{'result':'yes'}];    => 배열이다
					if (json[0].result == 'yes') {
						$('#admin_id_msg').html('사용 가능한 아이디입니다').css('color', 'blue');
					} else {
						$('#admin_id_msg').html('이미 사용중인 아이디입니다').css('color', 'red');
					}
				}
			});
		});


		<!--비밀번호 체크-->
		$('#admin_pwd').keyup(function(event) {

			// 비밀번호 유효성 체크
			var m_pwd = $(this).val();
			var m_pwd = $(this).val();
			var m_pwd_pattern = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

			if (!(m_pwd_pattern.test(m_pwd))) {

				$('#admin_pwd_msg').html('영문, 숫자 혼합하여 6~20자리 이내.').css('color', 'red');
				$("#admin_pwd").addClass("alert alert-danger").removeClass("alert-success");
			} else {

				$('#admin_pwd_msg').html('사용가능한 비밀번호입니다').css('color', 'blue');
				$("#admin_pwd").addClass("alert alert-success").removeClass("alert-danger");
			}


			<!--비밀번호 이중체크-->
			$('#admin1_pwd').keyup(function(event) {

				if ($('#admin1_pwd').val() != $('#admin_pwd').val()) {

					$('#admin1_pwd_msg').html('비밀번호가 틀립니다').css('color', 'red');
					$("#admin1_pwd").addClass("alert alert-danger").removeClass("alert-success");
				} else if ($('#admin1_pwd').val() == $('#admin_pwd').val()) {
					$('#admin1_pwd_msg').html('비밀번호 일치').css('color', 'blue');
					$("#admin1_pwd").addClass("alert alert-success").removeClass("alert-danger");

				}
			});
		});
	});


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
	};

	
	function member_Insert(f) {
		
		var m_id     = f.m_id.value.trim();
		var m_pwd    = f.m_pwd.value.trim();
		var m_name   = f.m_name.value.trim();
		var m_nick   = f.m_nick.value.trim();
		var m_tel 	 = f.m_tel.value.trim();
		/* var m_addr   = f.m_addr.value.trim();*/
		/*var m_addr_d = f.m_addr_d.value.trim(); */
		var m_grade  = f.m_grade.value.trim();
		var m_image  = f.m_image.value;

		if (m_id == '') {
			alert('아이디를 입력하세요')
			f.m_id.focus();
			return;
		}
		if (m_pwd == '') {
			alert('비밀번호를 입력하세요')
			f.m_pwd.focus();
			return;
		}
		if (m_name == '') {
			alert('이름를 입력하세요')
			f.m_name.focus();
			return;
		}

		if (m_nick == '') {
			alert('닉네임을 입력하세요')
			f.m_nick.focus();
			return;
		}
		if (m_tel == '') {
			alert('전화번호를 입력하세요')
			f.m_tel.focus();
			return;
		}
		if (m_addr == '') {
			alert('주소를 입력하세요')
			f.m_addr.focus();
			return;
		}
		if (m_addr_d == '') {
			alert('상세주소를 입력하세요')
			f.m_addr_d.focus();
			return;
		}

		if (m_grade == '') {
			alert('관리자여부를 선택하세요')
			return;
		}

		f.action = 'member_insert.do';
		f.submit();

		swal({
			text : "회원가입이 완료되었습니다.",
			icon : "success",
		}).then((value) => {
			location.href = "product_list.do";
		});
	};
	
</script>

<!-- page title -->
<h1 class="page-header">회원등록</h1>
<!-- //page title -->

<!-- 회원등록 -->
<div class="panel panel-default">
	<div class="panel-heading">회원등록</div>
	<div class="panel-body">
		<form action="member_insert.do" role="form" class="panel-body" method="POST" enctype="multipart/form-data">
			<div class="row">
				<div class="col-lg-6">
					<div class="form-group">
						<label for="">ID</label> 
						<input type="text" name="m_id" id="admin_id" class="form-control" placeholder="메일 주소" /> 
						<span class="mt5" id="admin_id_msg"></span>
					</div>
					<div class="form-group">
						<label for="">패스워드</label> 
						<input type="password" name="m_pwd" id="admin_pwd" class="form-control" placeholder="비밀번호" /> 
						<span class="mt5" id="admin_pwd_msg"></span>
					</div>
					<div class="form-group">
						<input type="password" id="admin1_pwd" class="form-control" placeholder="비밀번호 확인" /> 
						<span class="mt5" id="admin1_pwd_msg"></span>
					</div>
					<div class="form-group">
						<label for="">이름</label> 
						<input type="text" name="m_name" id="m_name" class="form-control" placeholder="이름" />
					</div>
					<div class="form-group">
						<label for="">닉네임</label> 
						<input type="text" name="m_nick" class="form-control" id="m_nick" placeholder="닉네임" />
					</div>
					<div class="form-group">
						<label for="">핸드폰번호</label> 
						<input type="number" name="m_tel" id="m_tel" class="form-control" placeholder="괄호(-)없이 숫자만 입력" />
					</div>
				</div>
				<div class="col-lg-6">
					<div class="form-group">
						<label for="">주소</label>
						<div class="row">
							<div class="col-xs-8">
								<input type="text" name="m_addr" id="m_addr" class="form-control" placeholder="우편번호" readonly />
							</div>
							<div class="col-xs-4">
								<button type="button" class="btn btn-warning" onclick="findAddress()">주소찾기</button>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<input type="text" name="m_zipcode" id="m_zipcode" class="form-control" placeholder="지번주소" />
					</div>
					
					<div class="form-group">
						<input type="text" name="m_addr_d" id="m_addr_d" class="form-control" placeholder="상세주소" />
					</div>
					
					<div class="form-group">
						<label for="">이미지(30x30)</label> 
						<input type="file" id="m_image" name="m_image_m" class="form-control"/>
					</div>

					<div class="form-group">
						<label for="">관리자등록여부</label> 
						<select name="m_grade" id="m_grade" class="form-control">
							<option value="" selected>::관리자등록여부선택::</option>
							<option value="0">일반회원</option>
							<option value="1">관리자회원</option>
						</select>
					</div>
				</div>

				<div class="col-lg-12">
					<div class="form-group text-right">
						<button type="button" class="btn btn-primary"
							 onclick="member_Insert(this.form); return false;">회원등록</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- //회원등록 -->

<%@include file="template/footer.jsp"%>