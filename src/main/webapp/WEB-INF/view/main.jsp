<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import ="java.util.*"%>
<!-- @author : heedong111 -->
<html>
<head>

<title>TheaterSeat</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="/resources/css/style.css" rel="stylesheet">

</head>

<body>

<div class="row">
    <!-- uncomment code for absolute positioning tweek see top comment in css -->
    <!-- <div class="absolute-wrapper"> -->
    <!-- 사이드바 -->
    <div class="side-menu">

    <nav class="navbar navbar-default" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <div class="brand-wrapper">
            <!-- Hamburger -->
            <button type="button" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <!-- 사이드바 제목 -->
            <div class="brand-name-wrapper" align="center">
                <a class="navbar-brand" href="/">
                    이 자리, 어떤가요?
                </a>
            </div>
        </div>
    </div>

    <!-- 사이드바 메뉴 틀 -->
    <div class="side-menu-container">
        <ul class="nav navbar-nav" style="height: 90%; width: 100%; overflow:auto;">

            <% if(session.getAttribute("id")==null){ %>
            <li><a href="/login" target="content"><span class="glyphicon glyphicon-user"></span> 로그인
            <% } else { %>
            <li><a href="/logout" target="content" id="logout"><span class="glyphicon glyphicon-user"></span> 로그아웃 <% } %></a></li>

            <!-- 드롭다운 시작 -->
            <li class="panel panel-default" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl1">
                    <span class="glyphicon glyphicon-search"></span> 영화관 찾기 <span class="caret"></span>
                </a>

                <!-- 영화관 드롭다운 -->
                <% List<String> theaterNameList = (List<String>) request.getAttribute("theaterNameList");
                   Map<String, List<String>> theaterMap = (Map<String, List<String>>) request.getAttribute("theaterMap");
                   Map<String, String> roomMap = (Map<String,String>) request.getAttribute("roomMap"); %>
                <div id="dropdown-lvl1" class="panel-collapse collapse">
                <%-- 영화관 수 만큼 드롭다운 생성 --%>
                <% for(int i=0;i<theaterMap.size();i++){
                   String theaterName = theaterNameList.get(i); %>
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <!-- 상영관 드롭다운 -->
                            <li class="panel panel-default" id="dropdown">
                                <a data-toggle="collapse" href="#dropdown-lvl<%= i+2 %>">
                                    <span class="glyphicon glyphicon-th-list"></span> <%= theaterName %> <span class="caret"></span>
                                </a>
                                <!-- 상영관에 따른 드롭다운 레벨 구분 -->
                                <div id="dropdown-lvl<%= i+2 %>" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <%-- 상영관 수 만큼 드롭다운 생성 --%>
                                            <% for(int j=0;j<theaterMap.get(theaterName).size();j++) { %>
                                            <% String r_idx = theaterMap.get(theaterName).get(j); %>
                                            <li class="roomlist">
                                                <%-- 클릭시 r_idx에 해당하는 상영관 정보를 메인페이지에 전시 --%>
                                                <a href="/room/<%=r_idx%>" class="seat" target="content"><%= roomMap.get(r_idx) %></a>
                                            </li>
                                            <% } %>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                <% } %>
                </div>
            </li>

        </ul>
    </div><!-- 사이드바 끝 -->
</nav>

    </div>

    <!-- 메인페이지 -->
    <div class="container-fluid" id="main-content">
        <div class="side-body">
            <div id="main-page">
                <%-- 초기페이지는 login --%>
                <iframe name="content" src="/login" height="100%" width="100%" border="0" frameborder="0" scrolling="auto"></iframe>
            </div>
        </div>
    </div>
     </div>
</div>


    <script type="text/javascript">
        $(function () {
            $('.navbar-toggle').click(function () {
                $('.navbar-nav').toggleClass('slide-in');
                $('.side-body').toggleClass('body-slide-in');
                $('#search').removeClass('in').addClass('collapse').slideUp(200);

                /// uncomment code for absolute positioning tweek see top comment in css
                //$('.absolute-wrapper').toggleClass('slide-in');

            });

           // Remove menu for searching
           $('#search-trigger').click(function () {
                $('.navbar-nav').removeClass('slide-in');
                $('.side-body').removeClass('body-slide-in');

                /// uncomment code for absolute positioning tweek see top comment in css
                //$('.absolute-wrapper').removeClass('slide-in');

            });
            $('#logout').click(function() {
                alert("로그아웃 되었습니다.");
                parent.window.location.reload();
            });
        });
    </script>
</body>

</html>