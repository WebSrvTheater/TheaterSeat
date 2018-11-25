<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!-- @author : heedong111 -->

<html>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script src="resources/js/sha256.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
    <%-- 로그인 버튼을 클릭할 시 실행되는 내용 --%>
    <%-- /member/login으로 post 메소드를 통해 아이디, 패스워드 전송. MemberController에서 처리. --%>
    $(document).ready(function() {
      $('#btnSignin').click(function() {
      var userId = $('#userId').val();
      var userPw = $('#userPw').val();
        $.ajax({
                  type: "post",
                  url: "/member/login",
                  contentType : "application/json;charset=utf8",
                  datatype : "json",
                  data: JSON.stringify({"userId": userId, "userPw": SHA256(userPw)}),
                  success: function(response) {
                	  if(response.code == '200') {
      					alert(response.message);
      					parent.window.location.reload();
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

<head>
<title>SignUp</title>
</head>
<body style="background-color:#333333; color:white">
	<div class="row" id="main" style="padding-top: 100px;">
		<div class="col-md-2 col-md-offset-5">
			<h2 class="text-center">Login</h2>
				<div class="form-group">
					<label for="userId">아이디</label> <input type="text"
						class="form-control" id="userId" name="userId"
						placeholder="아이디를 입력하세요" required>
				</div>
				<div class="form-group">
					<label for="userPw">패스워드</label> <input type="password"
						class="form-control" id="userPw" name="userPw" placeholder="패스워드"
						required>
				</div>
				<p align="center">
					<button id="btnSignin" class="btn btn-primary">로그인</button>
					<a href="/signup" class="btn btn-default">회원가입</a>
				</p>
		</div>
		<div id="msg" class="col-md-4 col-md-offset-4"></div>
	</div>
</body>
</html>