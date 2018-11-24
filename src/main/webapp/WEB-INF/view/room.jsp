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
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
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
<%-- Attribute 변수 선언부 --%>
<%
    SeatMapper seatMapper = (SeatMapper) request.getAttribute("seatMapper");    //seat테이블 접근을 위한 mapper
    List<SeatDto> seatDto = (List<SeatDto>) request.getAttribute("seatDto");    //seatDto 리스트
    char maxRow = (char) request.getAttribute("maxRow");                        //최대 행
    int maxNum = (int) request.getAttribute("maxNum");                          //최대 열
    String r_idx = (String) request.getAttribute("r_idx");                      //현 영화관 아이디
    String theaterName = (String) request.getAttribute("theaterName");          //현 영화관 이름
    String roomName = (String) request.getAttribute("roomName");                //현 상영관 이름
    int index=0;                                                                //각각의 seatDto 객체를 가져오기 위한 전역변수
%>
<!-- 모달창 -->
<%-- 모달창은 for문을 돌려 이 상영관의 좌석 수 만큼 만든다. 클릭하지 않으면 보이지 않음. --%>
<%-- modal fade 클래스의 id로 각각의 좌석 구분 --%>
<% for(int i=0;i<seatDto.size();i++){ %>
<div class="modal fade" id="myModal<%=i%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        <%-- seat.jsp 에서 표시될 부분 --%>
    </div>
  </div>
</div>

<% } %>
<div class="row" align="center" style="padding-top:40px">
    <h1 style="font-family: 'Black Han Sans', sans-serif;"><%=theaterName%> <%=roomName%></h1>
    <hr>
</div>
<div class="row" align="center" style="padding-top:40px">
<table>
   <caption class="caption"><center><b> S C R E E N </b></center></caption>
   <tr height="100px"><td>                                              <%-- 스크린과 좌석 사이의 빈 칸 --%>
   <% for(char i='A';i<=maxRow;i++){ %>                                 <%-- A열부터 시작 --%>
        <tr><td width="25px" height="25px" align="center"><b><%= i %></b>   <%-- 양쪽 끝의 열 알파벳 표시 --%>
        <% for(int j=1;j<=maxNum;j++){ %>                               <%-- 해당 열의 1번 좌석부터 시작 --%>
            <td width="30px" height="30px" style="padding:1px;">      <%-- 칸 하나 생성 --%>
            <% if(seatMapper.isSeatExist(i,j,r_idx)){         %>      <%-- 좌석이 존재할 때만 버튼을 만든다 --%>
            <% int colorNum = seatDto.get(index).getP_idx();  %>      <%-- 좌석 등급에 따른 색깔 설정 --%>
            <%  String color="";
                switch(colorNum){
                    case 1 : color = "#ed8c00"; break;
                    case 2 : color = "#01c73c"; break;
                    case 3 : color = "#f71708"; break;
                    case 4 : color = "#5d822e"; break;
                 }
             %>
                <a href="/seat/<%=seatDto.get(index).getS_idx()%>"            <%-- IndexController에 seat 매핑된 부분으로 s_idx 전달 --%>
                    type="button"
                    style="display:block; line-height:22px; width:100%; vertical-align:middle; text-align:center; border-radius: 0px; background-color:<%if(colorNum==4){%>#5d822e;<%}else{%>#888888;<%}%> border:3px solid <%= color %>;"
                    class="btn btn-xs" data-toggle="modal"
                    data-target="#myModal<%=index%>">                         <%-- index에 해당하는 모달창과 연결 --%>
                <span style="font-size:12px; color: white;">                  <%-- span 태그는 표시될 좌석번호의 텍스트 속성을 지정하기 위해 사용 --%>
                    <%= seatDto.get(index++).getSeatNum() %>                  <%-- 해당 좌석의 좌석번호를 출력하고 전역변수인 index 더하기 --%>
                </span>
                </a>
            <% } %>
            <% if(seatMapper.isHallWay(r_idx,j)){ %>                          <%-- 오른쪽이 복도측인 경우 테이블에 빈 칸을 출력 --%>
                <td width="15px" height="25px">
            <% } %>
        <% } %>
        <td width="25px" height="25px" align="center"><b><%= i %></b>        <%-- 양쪽 끝의 열 알파벳 표시 --%>
        </tr>
    <% } %>
</table>
<hr>
</div>
<div class="row" align="center" style="padding-top:20px">
<table>
    <tr>
    <td style="width:20px; height:20px; display:block; line-height:22px; border-radius: 0px; background-color:#888888; border:3px solid #ed8c00;">
    <td style="padding-left:5px; padding-right:5px;">Economy Zone
    <td style="width:20px; height:20px; display:block; line-height:22px; border-radius: 0px; background-color:#888888; border:3px solid #01c73c;">
    <td style="padding-left:5px; padding-right:5px;">Standart Zone
    <td style="width:20px; height:20px; display:block; line-height:22px; border-radius: 0px; background-color:#888888; border:3px solid #f71708;">
    <td style="padding-left:5px; padding-right:5px;">Prime Zone
    <td style="width:20px; height:20px; display:block; line-height:22px; border-radius: 0px; background-color:#5d822e; border:3px solid #5d822e;">
    <td style="padding-left:5px; padding-right:5px;">장애인석
</table>
</div>
</body>
</html>
