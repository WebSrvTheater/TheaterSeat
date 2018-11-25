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
    <%-- 회원가입 버튼을 클릭할 시 실행되는 내용 --%>
    <%-- /member/signup으로 post 메소드를 통해 아이디, 패스워드 전송. MemberController에서 처리. --%>
    $(document).ready(function() {
      $('#btnSignup').click(function() {
    	var passck1 = $('#userPw').val();
    	var passck2 = $('#passwdck').val();
    	if(passck1 != passck2){
    		alert("입력하신 두 비밀번호가 일치하지 않습니다.");
    		return false;
    	}

    	else {
        $.ajax({
                  type: "post",
                  url: "/member/signup",
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
        }
      });

    });
  </script>
<style>
body {
	padding-top: 100px;
}
</style>

<head>
<title>SignUp</title>
</head>
<body>
	<div class="row">
		<div class="col-md-2 col-md-offset-5">
			<h2 class="text-center">Sign Up</h2>
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
				<div class="form-group">
					<label for="passwdck">패스워드 확인</label> <input type="password"
						class="form-control" id="passwdck" name="passwdck"
						placeholder="패스워드 확인" required>
				</div>
				<p align="center">
					<button id="btnSignup" class="btn btn-default">Sign Up</button>
				</p>
		</div>
		<div id="msg" class="col-md-4 col-md-offset-4"></div>
	</div>
</body>
</html>