<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*"%>
<%@ page import ="com.websrv.theaterseat.dto.SeatDto"%>
<%@ page import ="com.websrv.theaterseat.mapper.SeatMapper"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="/resources/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/css/bootstrap-theme.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
    SeatMapper seatMapper = (SeatMapper) request.getAttribute("seatMapper");
    List<SeatDto> seatDto = (List<SeatDto>) request.getAttribute("seatDto");
    char maxRow = (char) request.getAttribute("maxRow");
    int maxNum = (int) request.getAttribute("maxNum");
    String r_idx = (String) request.getAttribute("r_idx");
    String theaterName = (String) request.getAttribute("theaterName");
    String roomName = (String) request.getAttribute("roomName");
    int index=0;
%>
<div class="row" align="center">
    <h1><%=theaterName%> <%=roomName%></h1>
</div>
<div class="row" align="center">
<table>
   <% for(char i='A';i<=maxRow;i++){ %>
        <tr>
        <% for(int j=0;j<=maxNum;j++){ %>
            <td width="25px" height="25px">
            <% if(seatMapper.isSeatExist(i,j,r_idx)){ %>
                <button type="button" style="width:100%; border:1px solid #25F263; background-color:white;" class="btn btn-xs">
                <%= seatDto.get(index++).getSeatNum() %>
                </button>
            <% } %>
            <% if(seatMapper.isHallWay(r_idx,j)){ %>
                <td width="25px" height="25px">
            <% } %>
        <% } %>
        </tr>
    <% } %>
</table>
</div>
</body>
</html>
