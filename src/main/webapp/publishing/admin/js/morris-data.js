$(function() {

	// 지역별 판매량
	Morris.Line({
		element: 'graph_addr',
		data: [{
			y : '2018-01',
			seoul : 6,
			gyeonggi : 15,
			gangwon : 28,
			chungcheong : 8,
			jeolla : 27,
			gyeongsang : 20
		},{
			y : '2018-02',
			seoul : 26,
			gyeonggi : 52,
			gangwon : 11,
			chungcheong : 43,
			jeolla : 26,
			gyeongsang : 33
		}, {
			y : '2018-03',
			seoul : 50,
			gyeonggi : 3,
			gangwon : 24,
			chungcheong : 25,
			jeolla : 30,
			gyeongsang : 16
		}],
		xkey : 'y',
		ykeys: ['seoul', 'gyeonggi', 'gangwon', 'chungcheong', 'jeolla', 'gyeongsang'],
		labels: ['서울', '경기', '강원', '충청', '전라', '경상'],
		hideHover: 'auto',
		resize: true
	});

	// 브랜드별 전체 판매량
	Morris.Donut({
		element: 'graph_brand01',
		data: [{
			label: "NIKE",
			value: 12
		}, {
			label: "ADIDAS",
			value: 4
		}, {
			label: "NEWBALANCE",
			value: 25
		}, {
			label: "SODA",
			value: 7
		}, {
			label: "FERRAGAMO",
			value: 16
		}, {
			label: "KUMKANG",
			value: 24
		}, {
			label: "CHRISTIAN LOUBOUTIN",
			value: 17
		}, {
			label: "ELCANTO",
			value: 21
		}, {
			label: "RACHELCOX",
			value: 42
		}],
		resize: true,
	});

	// 브랜드별 기간별 판매량
	Morris.Bar({
		element: 'graph_brand02',
		data: [{
			y : '주간',
			nike : 12,
			adidas : 3,
			newbalance : 13,
			soda : 8,
			ferragamo : 24,
			kumkang : 42,
			christian : 13,
			elcanto : 17,
			rachelcox : 18,
		},{
			y : '월간',
			nike : 38,
			adidas : 76,
			newbalance : 82,
			soda : 14,
			ferragamo : 75,
			kumkang : 42,
			christian : 27,
			elcanto : 45,
			rachelcox : 66,
		}],
		xkey : 'y',
		ykeys: ['nike', 'adidas', 'newbalance', 'soda', 'ferragamo', 'kumkang', 'christian', 'elcanto', 'rachelcox'],
		labels: ['NIKE', 'ADIDAS', 'NEWBALANCE', 'SODA', 'FERRAGAMO', 'KUMKANG', 'CHRISTIAN', 'ELCANTO', 'RACHELCOX'],
		hideHover: 'auto',
		resize: true
	});

	// 카테고리별 전체 판매량
	Morris.Donut({
		element: 'graph_category01',
		data: [{
			label: "RUNNINGS",
			value: 1
		}, {
			label: "SNEAKERS",
			value: 5
		}, {
			label: "OXFORDS",
			value: 10
		}, {
			label: "WALKERS",
			value: 30
		}, {
			label: "HEELS",
			value: 20
		}, {
			label: "SLIPPERS",
			value: 12
		}],
		resize: true
	});

	// 카테고리별 기간별 판매량
	Morris.Bar({
		element: 'graph_category02',
		data: [{
			y : '주간',
			runnings : 1,
			sneakers : 5,
			oxfords : 10,
			walkers : 30,
			heels : 20,
			slippers : 12
		},{
			y : '월간',
			runnings : 10,
			sneakers : 50,
			oxfords : 100,
			walkers : 300,
			heels : 200,
			slippers : 120
		}],
		xkey : 'y',
		ykeys: ['runnings', 'sneakers', 'oxfords', 'walkers', 'heels', 'slippers'],
		labels: ['RUNNINGS', 'SNEAKERS', 'OXFORDS', 'WALKERS', 'HEELS', 'SLIPPERS'],
		hideHover: 'auto',
		resize: true
	});

	// 성별 전체 판매량
	Morris.Donut({
		element: 'graph_sex01',
		data: [{
			label: "남자",
			value: 204
		},{
			label: "여자",
			value: 592
		},{
			label: "공용",
			value: 812
		}],
		resize: true
	});

	// 성별 기간별 판매량
	Morris.Bar({
		element: 'graph_sex02',
		data: [{
			y : '주간',
			men : 46,
			women : 72,
			unisex : 104
		},{
			y : '월간',
			men : 104,
			women : 162,
			unisex : 201
		}],
		xkey : 'y',
		ykeys: ['men', 'women', 'unisex'],
		labels: ['남자', '여자', '공용'],
		hideHover: 'auto',
		resize: true
	});
	
});
