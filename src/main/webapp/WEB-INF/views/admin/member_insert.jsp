<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="template/header.jsp" %>

<!-- page script -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 다음 우편 -->


<!--아이디 체크-->
  
  <script>

	$(document).ready(function() {

		$('#admin_id').keyup(function(event) {

			//console.log("----");
			var m_id = $(this).val();
			var m_id_pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			//console.log('id값 ='+insert_id);
			if (!(admin_id_pattern.test(admin_id))) {
				$('#admin_id_msg').html('이메일형식을 입력해주세요.').css('color', 'red');
				return;
			}

			//서버로 id전송(Ajax통신)
			$.ajax({
				url : 'check_id.do',
				data : {'m_id' : m_id},
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
			var admin_pwd = $(this).val();
			var admin1_pwd = $(this).val();
			var admin_pwd_pattern = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

			if (!(admin_pwd_pattern.test(admin_pwd))) {
				
				$('#admin_pwd_msg').html('영문, 숫자 혼합하여 6~20자리 이내.').css('color', 'red');
				$("#admin_pwd").addClass("alert alert-danger").removeClass("alert-success");
			} else {
					
					$('#admin_pwd_msg').html('사용가능한 비밀번호입니다').css('color', 'blue');
					$("#admin_pwd").addClass("alert alert-success").removeClass("alert-danger");
				}
			
			
<!--비밀번호 이중체크-->
			$('#admin1_pwd').keyup(function(event) {
				
				if($('#admin1_pwd').val() != $('#admin_pwd').val()){
					
					$('#admin1_pwd_msg').html('비밀번호가 틀립니다').css('color', 'red');
					$("#admin_pwd").addClass("alert alert-danger").removeClass("alert-success");
				  }
					else if($('#admin1_pwd').val() == $('#admin_pwd').val()){
						$('#admin1_pwd_msg').html('비밀번호 일치').css('color', 'blue');
						$("#admin_pwd").addClass("alert alert-success").removeClass("alert-danger");
						
					}
				});
			});
		 });

function findAddress() {
	new daum.Postcode({
		oncomplete: function(data) {
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
			if(data.userSelectedType === 'R'){
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('addressNumber').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('address').value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('address2').focus();
		}
	}).open();
	
	
	function send(f){
		
		var admin_id = f.admin_id.value.trim();
		var admin_pwd = f.admin_pwd.value.trim();
		var am_name = f.am_name.value.trim();
		var am_tel = f.am_tel.value.trim();
		var am_addr = f.am_addr.value.trim();
		var am_addr_d = f.am_addr_d.value.trim();
		
		if(admin_id=''){
			alert('아이디를 입력하세요')
			f.insert_id.focus();
			return;
		}
		if(admin_pwd=''){
			alert('비밀번호를 입력하세요')
			f.insert_pwd.focus();
			return;
		}
		if(am_name=''){
			alert('이름를 입력하세요')
			f.m_name.focus();
			return;
		}
		if(am_tel=''){
			alert('전화번호를 입력하세요')
			f.m_tel.focus();
			return;
		}
		if(am_addr=''){
			alert('주소를 입력하세요')
			f.m_addr.focus();
			return;
		}
		if(am_addr_d=''){
			alert('상세주소를 입력하세요')
			f.m_addr_d.focus();
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
	};

</script>

<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">

		<!-- page title -->
<h1 class="page-header">회원등록</h1>
<!-- //page title -->

<!-- 회원등록 -->
<div class="panel panel-default">
	<div class="panel-heading">회원등록</div>
	<div class="panel-body">
		<form action="" role="form" class="panel-body">
		<input type="hidden" value="1">
			<div class="row">
				<div class="col-lg-6">
					<div class="form-group">
						<label for="">ID</label>
						<input type="text" id="admin_id"class="form-control" placeholder="메일 주소" />
						<span class="mt5" id="admin_id_msg"></span>
					</div>
					<div class="form-group">
						<label for="">패스워드</label>
						<input type="password" id="admin_pwd"class="form-control" placeholder="비밀번호" />
						<span class="mt5" id="admin_pwd_msg"></span>
					</div>
					<div class="form-group">
						<input type="password" id="admin1_pwd"class="form-control" placeholder="비밀번호 확인" />
						<span class="mt5" id="admin1_pwd_msg"></span>
					</div>
					<div class="form-group">
						<label for="">이름</label>
						<input type="text" id="am_name"class="form-control" placeholder="이름" />
					</div>
					<div class="form-group">
						<label for="">핸드폰번호</label>
						<input type="number" id="am_tel"class="form-control" placeholder="괄호(-)없이 숫자만 입력" />
					</div>
				</div>
				<div class="col-lg-6">
					<div class="form-group">
						<label for="">주소</label>
						<div class="row">
							<div class="col-xs-8">
								<input type="text" id="am_addr" class="form-control" placeholder="우편번호" readonly />
							</div>
							<div class="col-xs-4">
								<button type="button" class="btn btn-warning" onclick="findAddress()">주소찾기</button>
							</div>
						</div>
					</div>
					<div class="form-group">
						<input type="text" id="am_zipcode" class="form-control" placeholder="지번주소" />
					</div>
					<div class="form-group">
						<input type="text" id="am_addr_d" class="form-control" placeholder="상세주소" />
					</div>
					<div class="form-group">
						<label for="">이미지</label>
						<input type="file" class="form-control" />
					</div>
				</div>
				<div class="col-lg-12">
					<div class="form-group text-right">
						<button type="button" class="btn btn-primary" onclick="send(this.form);">회원등록</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- //회원등록 -->

<%@include file="template/footer.jsp" %>