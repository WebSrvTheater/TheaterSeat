<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<head>
<%
    String s_idx = (String) request.getAttribute("s_idx");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
    $(document).ready(function(){
      $("#btnSave").click(function(){
      var content = $('#content').val();
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
    });
</script>
</head>
<body>
<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><%=s_idx%></h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
            <label for="content" class="control-label">Message:</label>
            <textarea id="content" class="form-control"></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id ="btnSave" class="btn btn-primary">Save message</button>
</body>
</html>
