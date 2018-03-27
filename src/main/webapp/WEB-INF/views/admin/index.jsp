<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="template/header.jsp" %>

<!-- page title -->
<h1 class="page-header">Dashboard</h1>
<!-- //page title -->

<!-- 알림 -->
<div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-bell fa-fw"></i> 최근 1달 통계</div>
    <div class="panel-body">
        <div class="row">
        
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-shopping-cart fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">${map.count_demand}</div>
                                <div>New Orders!</div>
                            </div>
                        </div>
                    </div>
                    <a href="member_orders.do">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-comments fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">${map.count_eval}</div>
                                <div>New Comments!</div>
                            </div>
                        </div>
                    </div>
                    <a href="product_review.do">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-users fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">${map.count_member}</div>
                                <div>New Member!</div>
                            </div>
                        </div>
                    </div>
                    <a href="member_list.do">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-cubes fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">${map.count_product}</div>
                                <div>New Product!</div>
                            </div>
                        </div>
                    </div>
                    <a href="goods_list.do">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            
        </div>
    </div>
</div>
<!-- //알림 -->

<!-- 지역별 그래프 -->
<div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-bar-chart-o fa-fw"></i> 지역별 주문 통계</div>
    <div class="panel-body">
        <div id="graph_addr"></div>
    </div>
</div>
<!-- //지역별 그래프 -->

<!-- 카테고리별 그래프 -->
<div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-bar-chart-o fa-fw"></i> 카테고리별 판매 통계</div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-5">
                <h3>전체 판매량</h3>
                <div id="graph_category01"></div>
            </div>
            <div class="col-md-7">
                <h3>기간별 판매량</h3>
                <div id="graph_category02"></div>
            </div>
        </div>
    </div>
</div>
<!-- //카테고리별 그래프 -->

<!-- 브랜드별 그래프 -->
<div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-bar-chart-o fa-fw"></i> 브랜드별 판매 통계</div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-5">
                <h3>전체 판매량</h3>
                <div id="graph_brand01"></div>
            </div>
            <div class="col-md-7">
                <h3>기간별 판매량</h3>
                <div id="graph_brand02"></div>
            </div>
        </div>
    </div>
</div>
<!-- //브랜드별 그래프 -->

<!-- 성별 그래프 -->
<div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-bar-chart-o fa-fw"></i> 성별 판매 통계</div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-5">
                <h3>전체 판매량</h3>
                <div id="graph_sex01"></div>
            </div>
            <div class="col-md-7">
                <h3>기간별 판매량</h3>
                <div id="graph_sex02"></div>
            </div>
        </div>
    </div>
</div>
<!-- //성별 그래프 -->

<!-- 그래프 value값 파라미터 -->
<script>

    // 지역별
    var today = new Date();
    var addr_date01 = today.getFullYear()+"-"+(today.getMonth()+1);
    today = new Date();
    today.setMonth(today.getMonth()-1);
    var addr_date02 = today.getFullYear()+"-"+(today.getMonth()+1);
    today = new Date();
    today.setMonth(today.getMonth()-2);
    var addr_date03 = today.getFullYear()+"-"+(today.getMonth()+1);
    
    var addr01_seoul = ${map.addr01.count_seoul};
    var addr01_gyeonggi = ${map.addr01.count_gyeonggi};
    var addr01_gangwon = ${map.addr01.count_gangwon};
    var addr01_chungcheong = ${map.addr01.count_chungcheong};
    var addr01_gyeongsang = ${map.addr01.count_gyeongsang};
    var addr01_jeolla = ${map.addr01.count_jeolla};
    var addr01_jeju = ${map.addr01.count_jeju};
    var addr02_seoul = ${map.addr02.count_seoul};
    var addr02_gyeonggi = ${map.addr02.count_gyeonggi};
    var addr02_gangwon = ${map.addr02.count_gangwon};
    var addr02_chungcheong = ${map.addr02.count_chungcheong};
    var addr02_gyeongsang = ${map.addr02.count_gyeongsang};
    var addr02_jeolla = ${map.addr02.count_jeolla};
    var addr02_jeju = ${map.addr02.count_jeju};
    var addr03_seoul = ${map.addr03.count_seoul};
    var addr03_gyeonggi = ${map.addr03.count_gyeonggi};
    var addr03_gangwon = ${map.addr03.count_gangwon};
    var addr03_chungcheong = ${map.addr03.count_chungcheong};
    var addr03_gyeongsang = ${map.addr03.count_gyeongsang};
    var addr03_jeolla = ${map.addr03.count_jeolla};
    var addr03_jeju = ${map.addr03.count_jeju};
    
    // 카테고리별
    var cat01_01 = ${map.category01.count01};
    var cat01_02 = ${map.category01.count02};
    var cat01_03 = ${map.category01.count03};
    var cat01_04 = ${map.category01.count04};
    var cat01_05 = ${map.category01.count05};
    var cat01_06 = ${map.category01.count06};
    var cat02_01 = ${map.category02.count01};
    var cat02_02 = ${map.category02.count02};
    var cat02_03 = ${map.category02.count03};
    var cat02_04 = ${map.category02.count04};
    var cat02_05 = ${map.category02.count05};
    var cat02_06 = ${map.category02.count06};
    var cat03_01 = ${map.category03.count01};
    var cat03_02 = ${map.category03.count02};
    var cat03_03 = ${map.category03.count03};
    var cat03_04 = ${map.category03.count04};
    var cat03_05 = ${map.category03.count05};
    var cat03_06 = ${map.category03.count06};
    
    // 성별
    var sex01_01 = ${map.sex01.count01};
    var sex01_02 = ${map.sex01.count02};
    var sex01_03 = ${map.sex01.count03};
    var sex02_01 = ${map.sex02.count01};
    var sex02_02 = ${map.sex02.count02};
    var sex02_03 = ${map.sex02.count03};
    var sex03_01 = ${map.sex03.count01};
    var sex03_02 = ${map.sex03.count02};
    var sex03_03 = ${map.sex03.count03};
    
    // 브랜드별
    var bra01_01 = ${map.brand01.count01};
    var bra01_02 = ${map.brand01.count02};
    var bra01_03 = ${map.brand01.count03};
    var bra01_04 = ${map.brand01.count04};
    var bra01_05 = ${map.brand01.count05};
    var bra01_06 = ${map.brand01.count06};
    var bra01_07 = ${map.brand01.count07};
    var bra01_08 = ${map.brand01.count08};
    var bra01_09 = ${map.brand01.count09};
    var bra02_01 = ${map.brand02.count01};
    var bra02_02 = ${map.brand02.count02};
    var bra02_03 = ${map.brand02.count03};
    var bra02_04 = ${map.brand02.count04};
    var bra02_05 = ${map.brand02.count05};
    var bra02_06 = ${map.brand02.count06};
    var bra02_07 = ${map.brand02.count07};
    var bra02_08 = ${map.brand02.count08};
    var bra02_09 = ${map.brand02.count09};
    var bra03_01 = ${map.brand03.count01};
    var bra03_02 = ${map.brand03.count02};
    var bra03_03 = ${map.brand03.count03};
    var bra03_04 = ${map.brand03.count04};
    var bra03_05 = ${map.brand03.count05};
    var bra03_06 = ${map.brand03.count06};
    var bra03_07 = ${map.brand03.count07};
    var bra03_08 = ${map.brand03.count08};
    var bra03_09 = ${map.brand03.count09};
</script>

<!-- Morris Charts JavaScript -->
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/admin/js/morris-data.js"></script>

<%@include file="template/footer.jsp" %>