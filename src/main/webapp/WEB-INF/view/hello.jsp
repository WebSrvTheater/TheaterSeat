<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>

<body style="font-family: 'hanna', serif; text-align:center; color:white">
    <div style="padding-top:300px; font-size: 85px;">환영합니다! <%= session.getAttribute("id") %>님.</div>
    <div style="padding-top:30px; font-size:30px">왼쪽 메뉴의 &quot;영화관 찾기&quot;를 클릭하세요.</div>
</body>

</html>