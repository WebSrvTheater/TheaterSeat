<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*"%>
<%@ page import ="com.websrv.theaterseat.dto.BoardDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<head>
<%
    String s_idx = (String) request.getAttribute("s_idx");
    List<BoardDto> boardDtoList = (List<BoardDto>) request.getAttribute("boardDtoList");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
    $(document).ready(function(){
      $("#content").keyup(function(){
        var content_length = $("#content").val().length;
        if(content_length > 300)
            $("#content_length").text("300/300");
        else
            $("#content_length").text(content_length + "/300");
      });
      $("#btnSave").click(function(){
      var content = $('#content').val();
      if(content.length == 0){
        alert("내용을 입력해주세요.");
        return false;
      } else if(content.length > 300) {
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
                data: JSON.stringify({"content":content,"m_idx": m_idx, "s_idx":s_idx}),
                success: function(response) {
                    if(response.code == '200'){
                        alert(response.message);
                        $('.modal-body').html($('.modal-body').html());
                    }
                    else {
                        alert(response.message);
                    }
                },
                error: function() {
                    alert(data);
                }
        });
      });
      $("button[id^='btnDelete']").click(function(){
        var b_idx = $(this).val();
      });
    });
</script>
</head>
<body>
<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><%=s_idx%></h4>
      </div>
      <div class="modal-body">
      <% if(session.getAttribute("m_idx")!=null){ %>
        <div class="form-group">
            <label for="content" class="control-label">Message:</label>
            <textarea id="content" class="form-control" maxlength="300"></textarea>
                <span id="content_length" align="left">0/300</span>
                <span style="text-align:right"><button type="button" id ="btnSave" class="btn btn-primary">Save message</button></span>
            <hr>
      <%  }  %>
            <% for(int i=0;i<boardDtoList.size();i++){ %>
            <p><%= boardDtoList.get(i).getContent() %>
                <% if(Integer.parseInt((String) session.getAttribute("m_idx"))==boardDtoList.get(i).getM_idx()) { %>
                    <span id="btnDelete" style="align:right"><button type="button" id="btnDelete<%= boardDtoList.get(i).getB_idx() %>" class="btn btn-primary" value="<%= boardDtoList.get(i).getB_idx() %>">Delete</button></span>
                <%   } %>
            <%   } %>
        </div>
      </div>
</body>
</html>
