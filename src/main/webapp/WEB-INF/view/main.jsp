<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page session="false"%>
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
    <!-- Menu -->
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

            <!-- Brand -->
            <div class="brand-name-wrapper">
                <a class="navbar-brand" href="#">
                    Brand
                </a>
            </div>
        </div>
    </div>

    <!-- Main Menu -->
    <div class="side-menu-container" >
        <ul class="nav navbar-nav" style="overflow: auto; height: 100%;">

            <li><a href="#"><span class="glyphicon glyphicon-send"></span> Link</a></li>
            <li class="active"><a href="#"><span class="glyphicon glyphicon-plane"></span> Active Link</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-cloud"></span> Link</a></li>

            <!-- Dropdown-->
            <li class="panel panel-default" id="dropdown">
                <a data-toggle="collapse" href="#dropdown-lvl1">
                    <span class="glyphicon glyphicon-user"></span> Sub Level <span class="caret"></span>
                </a>

                <!-- Dropdown level 1 -->
                <div id="dropdown-lvl1" class="panel-collapse collapse">
                <% List<String> theaterName = (List<String>) request.getAttribute("theaterName"); %>
                <% Map<String, List<String>> theaterMap = (Map<String, List<String>>) request.getAttribute("theaterMap"); %>
                <% for(int i=0;i<theaterMap.size();i++){ %>
                    <div class="panel-body">
                        <ul class="nav navbar-nav">
                            <!-- Dropdown level 2 -->
                            <li class="panel panel-default" id="dropdown">
                                <a data-toggle="collapse" href="#dropdown-lvl<%out.print(i+2);%>">
                                    <span class="glyphicon glyphicon-off"></span> <% out.print(theaterName.get(i)); %> <span class="caret"></span>
                                </a>
                                <div id="dropdown-lvl<% out.print(i+2); %>" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <% for(int j=0;j<theaterMap.get(theaterName.get(i)).size();j++) { %>
                                            <li class="hr"><a href="/signup" target="content"><% out.print(theaterMap.get(theaterName.get(i)).get(j)); %></a></li>
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

            <li><a href="#"><span class="glyphicon glyphicon-signal"></span> Link</a></li>

        </ul>
    </div><!-- /.navbar-collapse -->
</nav>

    </div>

    <!-- Main Content -->
    <div class="container-fluid" id="main-content">
        <div class="side-body">
           <iframe name="content" src="/login" height="100%" width="100%" border="0" frameborder="0" scrolling="no"></iframe>
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
        });
    </script>
</body>

</html>