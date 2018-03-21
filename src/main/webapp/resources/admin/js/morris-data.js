$(function() {

	// 지역별 판매량
	Morris.Line({
		element: 'graph_addr',
		data: [{
			y : addr_date03,
			seoul : addr03_seoul,
			gyeonggi : addr03_gyeonggi,
			gangwon : addr03_gangwon,
			chungcheong : addr03_chungcheong,
			gyeongsang : addr03_gyeongsang,
			jeolla : addr03_jeolla,
			jeju : addr03_jeju
		},{
			y : addr_date02,
			seoul : addr02_seoul,
			gyeonggi : addr02_gyeonggi,
			gangwon : addr02_gangwon,
			chungcheong : addr02_chungcheong,
			gyeongsang : addr02_gyeongsang,
			jeolla : addr02_jeolla,
			jeju : addr02_jeju
		}, {
			y : addr_date01,
			seoul : addr01_seoul,
			gyeonggi : addr01_gyeonggi,
			gangwon : addr01_gangwon,
			chungcheong : addr01_chungcheong,
			gyeongsang : addr01_gyeongsang,
			jeolla : addr01_jeolla,
			jeju : addr01_jeju
		}],
		xkey : 'y',
		ykeys: ['seoul', 'gyeonggi', 'gangwon', 'chungcheong', 'jeolla', 'gyeongsang', 'jeju'],
		labels: ['서울', '경기', '강원', '충청', '전라', '경상', '제주'],
		hideHover: 'auto',
		resize: true
	});
	
	
	// 카테고리별 전체 판매량
	Morris.Donut({
		element: 'graph_category01',
		data: [{
			label: "RUNNINGS",
			value: cat01_01
		}, {
			label: "SNEAKERS",
			value: cat01_02
		}, {
			label: "OXFORDS",
			value: cat01_03
		}, {
			label: "WALKERS",
			value: cat01_04
		}, {
			label: "HEELS",
			value: cat01_05
		}, {
			label: "SLIPPERS",
			value: cat01_06
		}],
		resize: true
	});

	// 카테고리별 기간별 판매량
	Morris.Bar({
		element: 'graph_category02',
		data: [{
			y : '주간',
			runnings : cat02_01,
			sneakers : cat02_02,
			oxfords : cat02_03,
			walkers : cat02_04,
			heels : cat02_05,
			slippers : cat02_06
		},{
			y : '월간',
			runnings : cat03_01,
			sneakers : cat03_02,
			oxfords : cat03_03,
			walkers : cat03_04,
			heels : cat03_05,
			slippers : cat03_06
		}],
		xkey : 'y',
		ykeys: ['runnings', 'sneakers', 'oxfords', 'walkers', 'heels', 'slippers'],
		labels: ['RUNNINGS', 'SNEAKERS', 'OXFORDS', 'WALKERS', 'HEELS', 'SLIPPERS'],
		hideHover: 'auto',
		resize: true
	});

	// 브랜드별 전체 판매량
	Morris.Donut({
		element: 'graph_brand01',
		data: [{
			label: "NIKE",
			value: bra01_01
		}, {
			label: "ADIDAS",
			value: bra01_02
		}, {
			label: "NEWBALANCE",
			value: bra01_03
		}, {
			label: "SODA",
			value: bra01_04
		}, {
			label: "FERRAGAMO",
			value: bra01_05
		}, {
			label: "KUMKANG",
			value: bra01_06
		}, {
			label: "CHRISTIAN LOUBOUTIN",
			value: bra01_07
		}, {
			label: "ELCANTO",
			value: bra01_08
		}, {
			label: "RACHELCOX",
			value: bra01_09
		}],
		resize: true,
	});

	// 브랜드별 기간별 판매량
	Morris.Bar({
		element: 'graph_brand02',
		data: [{
			y : '주간',
			nike : bra02_01,
			adidas : bra02_02,
			newbalance : bra02_03,
			soda : bra02_04,
			ferragamo : bra02_05,
			kumkang : bra02_06,
			christian : bra02_07,
			elcanto : bra02_08,
			rachelcox : bra02_09,
		},{
			y : '월간',
			nike : bra03_01,
			adidas : bra03_02,
			newbalance : bra03_03,
			soda : bra03_04,
			ferragamo : bra03_05,
			kumkang : bra03_06,
			christian : bra03_07,
			elcanto : bra03_08,
			rachelcox : bra03_09,
		}],
		xkey : 'y',
		ykeys: ['nike', 'adidas', 'newbalance', 'soda', 'ferragamo', 'kumkang', 'christian', 'elcanto', 'rachelcox'],
		labels: ['NIKE', 'ADIDAS', 'NEWBALANCE', 'SODA', 'FERRAGAMO', 'KUMKANG', 'CHRISTIAN', 'ELCANTO', 'RACHELCOX'],
		hideHover: 'auto',
		resize: true
	});

	// 성별 전체 판매량
	Morris.Donut({
		element: 'graph_sex01',
		data: [{
			label: "남자",
			value: sex01_01
		},{
			label: "여자",
			value: sex01_02
		},{
			label: "공용",
			value: sex01_03
		}],
		resize: true
	});

	// 성별 기간별 판매량
	Morris.Bar({
		element: 'graph_sex02',
		data: [{
			y : '주간',
			men : sex02_01,
			women : sex02_02,
			unisex : sex02_03
		},{
			y : '월간',
			men : sex03_01,
			women : sex03_02,
			unisex : sex03_03
		}],
		xkey : 'y',
		ykeys: ['men', 'women', 'unisex'],
		labels: ['남자', '여자', '공용'],
		hideHover: 'auto',
		resize: true
	});
	
});
