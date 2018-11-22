<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*"%>
<%@ page import ="com.websrv.theaterseat.dto.SeatDto"%>
<%@ page import ="com.websrv.theaterseat.mapper.SeatMapper"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<!-- Bootstrap -->
<style>
caption {
    background-image: url("/resources/images/stripe.png");
    background-position:center;
    background-repeat:repeat;
}
</style>
<link rel="stylesheet"
	href="/resources/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/css/bootstrap-theme.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body style="width:100%; height:100%; margin-right:300px">
<%
    SeatMapper seatMapper = (SeatMapper) request.getAttribute("seatMapper");
    List<SeatDto> seatDto = (List<SeatDto>) request.getAttribute("seatDto");
    char maxRow = (char) request.getAttribute("maxRow");
    int maxNum = (int) request.getAttribute("maxNum");
    String r_idx = (String) request.getAttribute("r_idx");
    String theaterName = (String) request.getAttribute("theaterName");
    String roomName = (String) request.getAttribute("roomName");
    int index=0;
    String url="/resources/img/stripe.png";
%>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    </div>
  </div>
</div>
<div class="row" align="center" style="padding-top:50px">
    <h2 style="font-family:'맑은고딕';"><%=theaterName%> <%=roomName%></h2>
</div>
<div class="row" align="center" style="padding-top:40px">
<table>
   <caption class="caption"><center><b> S C R E E N </b></center></caption>
   <tr height="100px">
   <td>
   <% for(char i='A';i<=maxRow;i++){ %>
        <tr>
        <td width="25px" height="25px" align="center"><b><%= i %></b>
        <% for(int j=1;j<=maxNum;j++){ %>
            <td width="30px" height="30px" style="padding:1px;">
            <% if(seatMapper.isSeatExist(i,j,r_idx)){ %>
            <% int colorNum = seatDto.get(index).getP_idx();
                String color="";
                switch(colorNum){
                    case 1 : color = "#ed8c00"; break;
                    case 2 : color = "#01c73c"; break;
                    case 3 : color = "#f71708"; break;
                    case 4 : color = "black"; break;
                 }
             %>
                <a href="/seat" type="button" style="display:block; line-height:22px; width:100%; vertical-align:middle; text-align:center; border-radius: 0px; border:3px solid <% out.print(color); %>; background-color:#888888" class="btn btn-xs" data-toggle="modal" data-target="#myModal">
                <span style="font-size:12px; color: white;"><%= seatDto.get(index++).getSeatNum() %></span>
                </a>
            <% } %>
            <% if(seatMapper.isHallWay(r_idx,j)){ %>
                <td width="15px" height="25px">
            <% } %>
        <% } %>
        <td width="25px" height="25px" align="center"><b><%= i %></b>
        </tr>
    <% } %>
</table>
</div>
</body>
</html>
