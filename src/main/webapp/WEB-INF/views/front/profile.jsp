<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>

<!-- visual -->
<section class="subVisual">
    <h2>PROFILE</h2>
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_pc_default.jpg" alt="sub visual" class="imgPc" />
    <img src="${ pageContext.request.contextPath }/resources/front/img/visual/bg_visual_mobile_default.jpg" alt="sub visual" class="imgMobile" />
</section>
<!-- //visual -->

<!-- sub contents -->
<section class="sub container">
	<h2 class="hide">프로필</h2>

	<div class="profile">

		<!-- 경민 -->
		<div class="box">
			<div class="imgBox"><img src="${ pageContext.request.contextPath }/resources/front/img/img_profile01.jpg" alt="chopin" class="wFull" /></div>
			<div class="txtBox">
				<dl>
					<dt>Chopin</dt>
					<dd>
						<strong>NAME</strong>
						<span>박경민</span>
					</dd>
					<dd>
						<strong>CLASS</strong>
						<span>PL</span>
					</dd>
					<dd>
						<strong>WORK</strong>
						<span>Design, Publish, Controller</span>
					</dd>
					<dd>
						<strong>HOMEPAGE</strong>
						<span><a href="http://chopin77.dothome.co.kr/" target="_blank">http://chopin77.dothome.co.kr/</a></span>
					</dd>
					<dd>
						<strong>BLOG</strong>
						<span><a href="https://blog.naver.com/rudals0731/" target="_blank">https://blog.naver.com/rudals0731/</a></span>
					</dd>
					<dd>
						<strong>INTRODUCE</strong>
						<span>
							나의 총끝은 빛나고<br />방아쇠는 심판을 내린다<br />기꺼이 적에게 복수하고<br />증오엔 증오로 되갚으니<br />오 신이시여<br />나를 당신곁에 두시고<br />성인들 중에 세우소서<br /><br />남의 피를 쏟게 하는 자<br />자기 피도 쏟게 하리라<br /><br />그것이 신의 뜻이라.
						</span>
					</dd>
				</dl>
			</div>
		</div>
		<!-- //경민 -->

		<!-- 덕원 -->
		<div class="box">
			<div class="imgBox"><img src="${ pageContext.request.contextPath }/resources/front/img/img_profile02.jpg" alt="duck" class="wFull" /></div>
			<div class="txtBox">
				<dl>
					<dt>DUCK</dt>
					<dd>
						<strong>NAME</strong>
						<span>서덕원</span>
					</dd>
					<dd>
						<strong>CLASS</strong>
						<span>PM</span>
					</dd>
					<dd>
						<strong>WORK</strong>
						<span>Planning, Database, Controller</span>
					</dd>
					<dd>
						<strong>INTRODUCE</strong>
						<span>
							적군의 숨통을 노리는 매의 눈빛<br /><br /> 매일 수련에 수련을 거듭하고 있는 브라이언 킴 대위라고 한다.<br /> 던전고수 기분좋나요와는 절친한 친구다.<br /> 어서 전쟁이 일어나야 내 실력을 뽐낼건데..(후훗)<br /><br />하지만 나는 나라를 위해 싸우지않는다.<br />내가 사랑하는 여자를 위해 목숨을 걸뿐.. 후훗..
						</span>
					</dd>
				</dl>
			</div>
		</div>
		<!-- //덕원 -->

		<!-- 훈철 -->
		<div class="box">
			<div class="imgBox"><img src="${ pageContext.request.contextPath }/resources/front/img/img_profile03.jpg" alt="hoon" class="wFull" /></div>
			<div class="txtBox">
				<dl>
					<dt>HOON</dt>
					<dd>
						<strong>NAME</strong>
						<span>신훈철</span>
					</dd>
					<dd>
						<strong>CLASS</strong>
						<span>UTILITY</span>
					</dd>
					<dd>
						<strong>WORK</strong>
						<span>Planning, Database, Controller</span>
					</dd>
					<dd>
						<strong>INTRODUCE</strong>
						<span>
							나 던전 초고수다<br />원코인 클리어도 못하는 새끼들아<br />내 현란한 모닝스타 솜씨를 봐라 
						</span>
					</dd>
				</dl>
			</div>
		</div>
		<!-- //훈철 -->

		<!-- 봉성 -->
		<div class="box">
			<div class="imgBox"><img src="${ pageContext.request.contextPath }/resources/front/img/img_profile04.jpg" alt="bbong" class="wFull" /></div>
			<div class="txtBox">
				<dl>
					<dt>BBONG</dt>
					<dd>
						<strong>NAME</strong>
						<span>김봉성</span>
					</dd>
					<dd>
						<strong>CLASS</strong>
						<span>ACE</span>
					</dd>
					<dd>
						<strong>WORK</strong>
						<span>Database, Controller, Resources</span>
					</dd>
					<dd>
						<strong>INTRODUCE</strong>
						<span>
							목전(目前)의 상대에게 치명적인 공격을 !!<br /><br />난 제국군의 기사 발리언트(27)라고 한다.<br />던전고수 기분좋나요와 브라이언 킴 대위와는 깊은 우정을 나눈 관계다<br />목전의 상대에겐 치명적인 공격을!! 그리고 강인한 나의 플레이터 아머(Plate Armor)와<br />라운드 쉴드(Round shield)에겐 신의 축복을 !!<br />목전의 상대에게 자비를 베풀지 않는 기사 발리언트다<br />설령 상대가 7살난 어린아이라 할지라도..
						</span>
					</dd>
				</dl>
			</div>
		</div>
		<!-- //봉성 -->
	</div>
</section>
<!-- //sub contents -->

<%@include file="template/footer.jsp" %>