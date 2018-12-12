<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*"%>
<%@ page import ="com.websrv.theaterseat.dto.BoardDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
    .starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -35px 0;
    background-size: auto 100%;
    width: 10px;
    height: 20px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 10px;
    height: 20px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-10px 0;}
</style>

<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/bootstrap-theme.css">
<head>
    <%
    String s_idx = (String) request.getAttribute("s_idx");
    List<BoardDto> boardDtoList = (List<BoardDto>) request.getAttribute("boardDtoList");
    String roomName = (String) request.getAttribute("roomName");
    char seatRow = (char) request.getAttribute("seatRow");
    int seatNum = (int) request.getAttribute("seatNum");
    String ratingAvg = (String) request.getAttribute("ratingAvg");
%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script>
        $(document).ready(function () {
            var rate = 5;
            $("#content").keyup(function () {
                var content_length = $("#content").val().length;
                if (content_length > 300)
                    $("#content_length").text("300/300");
                else
                    $("#content_length").text(content_length + "/300");
            });
            $("#btnSave").click(function () {
                var content = $('#content').val();
                if (content.length == 0) {
                    alert("내용을 입력해주세요.");
                    return false;
                } else if (content.length > 300) {
                    alert("300자 이하로 작성해주세요.");
                    return false;
                }
                var s_idx = <%= s_idx %>;
                var m_idx = <%= session.getAttribute("m_idx") %>;
                $.ajax({
                    type: "post",
                    url: "/board/writing",
                    contentType: "application/json;charset=utf-8",
                    datatype: "json",
                    data: JSON.stringify({ "content": content, "m_idx": m_idx, "s_idx": s_idx }),
                    success: function (response) {
                        if (response.code == '200') {
                            alert(response.message);
                            window.location.reload();
                        }
                        else {
                            alert(response.message);
                        }
                    },
                    error: function () {
                        alert(data);
                    }
                });
            });
            $("button[id^='btnDelete']").click(function () {
                var b_idx = $(this).val();
                var content = $('#content'+b_idx+' .inner').text();
                if(click==0){
                    var result = confirm("정말로 삭제하시겠습니까?");
                    if(result){
                        $.ajax({
                            type: "delete",
                            url: "/board/delete",
                            contentType: "application/json;charset=utf-8",
                            datatype: "json",
                            data: JSON.stringify({ "b_idx": b_idx }),
                            success: function (data) {
                                alert("삭제되었습니다.");
                                window.location.reload();
                            },
                            error: function (data) {
                                alert(data);
                            }
                        });
                    }
                }
                else {
                    $('#content'+b_idx+' .inner').replaceWith('<span class="inner" style="width:900px">'+content+'</span>');
                    $(this).text('\u2169');
                    $('#btnUpdate'+b_idx).text('\u270E');
                    $('#contentHR'+b_idx).css("padding-top","");
                    click--;
                }
            });
            $('.starRev span').click(function () {
                $(this).parent().children('span').removeClass('on');
                $(this).addClass('on').prevAll('span').addClass('on');
                rate = $(this).text();
                return false;
            });
            var click=0;
            $("button[id^='btnUpdate']").click(function(){
                var b_idx = $(this).val();
                if(click==0){
                    var content = $('#content'+b_idx+' .inner').text();
                    $('#content'+b_idx+' .inner').replaceWith("<span class='inner'><textarea width='900px' style='margin-bottom:10px' class='form-control' maxlength='300'>"+content+"</textarea></span>");
                    $(this).append('수정');
                    $('#btnDelete'+b_idx).append('취소');
                    $('#contentHR'+b_idx).css("padding-top","15px");
                    click++;
                }
                else{
                    alert(b_idx);
                }
            });
        });
    </script>
</head>

<body style="margin:20px">
    <div id="seat-header">
        <center>
        <h2 style="font-family: 'hanna', serif;">
            <%= roomName %>
            <%=seatRow%>열
            <%=seatNum%>번
        </h2>
        <h3 style="font-family: 'hanna', serif;">
            별점 평점 : <%= ratingAvg %>
        </h3>
        </center>
    </div>
    <div id="seat-body">
        <div class="form-group">
        <hr style="border:none; border:1px solid #AAAAAA">
        <h3 style="font-family: 'hanna', serif; padding-left:5px; margin-top:5px">리뷰작성</h3>
        <% if(session.getAttribute("m_idx")!=null){ %>
            <span style="float:left; padding-left:5px"><label for="content" class="control-label">별점 : </label></span>
            <span class="starRev">
                <span class="starR1 on">0.5</span>
                <span class="starR2 on">1</span>
                <span class="starR1 on">1.5</span>
                <span class="starR2 on">2</span>
                <span class="starR1 on">2.5</span>
                <span class="starR2 on">3</span>
                <span class="starR1 on">3.5</span>
                <span class="starR2 on">4</span>
                <span class="starR1 on">4.5</span>
                <span class="starR2 on">5</span>
            </span>
            <textarea id="content" class="form-control" maxlength="300" style="padding-top:5px; padding-bottom:5px;"></textarea>
            <div style="padding-top:5px;">
                <span id="content_length" style="float: left">0/300</span>
                <span style="float:right"><button type="button" id="btnSave" class="btn btn-default btn-sm">저장</button></span>
            </div>
        <%  } else {  %>
        <center style="margin-top:20px; margin-bottom:20px">로그인 후 리뷰를 작성해주세요!</center>
        <% } %>
        </div>
        <div id="hr" style="padding-top:1px;">
            <hr style="border:none; border:1px solid #AAAAAA; margin-top:20px; margin-bottom:10px">
            <h4 style="font-family: 'hanna', serif; padding-left:5px">리뷰</h4>
            <hr style="border:none; border:1px solid #AAAAAA; margin-top:10px; margin-bottom:20px">
        </div>
        <% if(boardDtoList.size() == 0) { %>
        <center>아직 리뷰가 없습니다.<br>이 자리의 첫 번째 리뷰어가 되어주세요!</center>
        <hr style="border:none; border:1px dotted #EEEEEE">
        <% } %>
        <% for(int i=0;i<boardDtoList.size();i++){ %>
            <% int b_idx = boardDtoList.get(i).getB_idx(); %>
            <% String content = boardDtoList.get(i).getContent(); %>
            <% Double rating = boardDtoList.get(i).getRating(); %>
            <div id="review<%= b_idx %>">
                <span id="content<%= b_idx %>">
                    <span class="inner" style="width:900px"><%= content %></span>
                    <span><%= rating %></span>
                </span>
                <span id="button<%= b_idx %>">
                <% if(session.getAttribute("m_idx") != null) { %>
                    <% if(Integer.parseInt((String) session.getAttribute("m_idx"))==boardDtoList.get(i).getM_idx()) { %>
                        <span class="btnDelete" style="float:right; padding:1px;">
                            <button type="button" id="btnDelete<%= b_idx %>"
                            class="btn btn-xs" value="<%= b_idx %>" style="border:1px solid #AAAAAA; background-color:white;">
                            &#8569;
                            </button>
                        </span>
                        <span class="btnUpdate" style="float:right; padding:1px;">
                            <button type="button" id="btnUpdate<%= b_idx %>"
                            class="btn btn-xs" value="<%= b_idx %>" style="border:1px solid #AAAAAA; background-color:white;">
                      	    &#9998;
                      	    </button>
                      	</span>
                    <% } %>
                <% } %>
                </span>
                <div id="contentHR<%=b_idx%>">
                    <hr style="border:none; border:1px dotted #EEEEEE">
                </div>
            </div>
         <% } %>
    </div>
</body>
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
</html>