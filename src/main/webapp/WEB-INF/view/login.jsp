<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page session="false"%>
<!-- @author : heedong111 -->

<html>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
      $('#btnSignup').click(function() {
        $.ajax({
                  type: "post",
                  url: "/member/login",
                  contentType : "application/json;charset=utf8",
                  datatype : "json",
                  data: JSON.stringify({"userId": $('#userId').val(), "userPw": $('#userPw').val()}),
                  success: function(response) {
                	  if(response.code == '200') {
      					alert(response.message);
      					window.location.href="/";
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
<body>
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
					<button id="btnSignup" class="btn btn-default">login</button>
				</p>
		</div>
		<div id="msg" class="col-md-4 col-md-offset-4"></div>
	</div>
</body>
</html>