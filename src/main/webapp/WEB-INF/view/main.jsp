<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
    body {
        text-align: center;
        width: 900px;
    }
    div#wapper {
        width: 100%;
        text-align: left;
        min-height: 300px;
        margin: 0 auto;
    }
    header, footer, menu, content{
        border: 1px solid #999;
        margin: 5px;
        padding: 10px;
    }
    header {
        height: 50px;
    }
    menu {
        float: left;
        height: 200px;
    }
    }
    content {
        width: 604px;
    }
    footer {
        height: 50px;
        position: relatiev;
        clear: both;
    }
    article {
        width: 90%;
        margin: 20px;
    }
</style>
</head>
<body>
    <div id="wrapper">
        <div id="header" style="text-align:right">
            <jsp:include page="mainPage/mainHeader.jsp"></jsp:include>
        </div>
        <div id="menu">
            <jsp:include page="mainPage/mainMenu.jsp"></jsp:include>
        </div>
        <div id="content">
            <jsp:include page="mainPage/mainContent.jsp"></jsp:include>
        </div>
        <div id="footer">
            <jsp:include page="mainPage/mainFooter.jsp"></jsp:include>
        </div>
    </div>
</body>
</html>
