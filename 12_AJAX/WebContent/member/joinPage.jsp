<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	<style>
		*{
			padding: 0;
			margin: 0;
			box-sizing: border-box;
		}
		label{
			display: block;
			font-weight: 900;
		}
		input{
			padding: 5px 10px;
			width: 250px;
			height: 50px;
			border: 1px solid gray;
			outline: none;
		}
		#phone_box{
			padding: 10px 0 10px 0;
			margin: 0;
			width: 250px;
			height: 30px;
			outline: none;
			display:flex;
			justify-content: space-between;
		}
		/* #phone{
			width: 70px;
			height: 50px;
		} */
		.message_red{
			color: crimson;
			font-size: 12px;
			font-weight: 700;
		}
		.message_green{
			color: lime;
			font-size: 12px;
			font-weight: 700;
		}
	</style>
	<script>
		$(function(){
			
			var id_result;			
			const regID = /^[a-z][a-z0-9_-]{3,31}$/;
			const id = $('#id');
			const id_msg = $('#id_msg');

			id.blur(function(){
				id_result = false;
				id_msg.attr('class','message_red');
					if( regID.test( id.val() ) ){
						$.ajax({
							url: '12_AJAX/idCheck.do',
							type: 'post',
							data: 'id=' + id.val(),	// 파라미터 id를 서버로 보낸다.
							dataType: 'json',	// 서버가 보내준 응답데이터의 타입
							success: function(obj){	// 서버의 응답 데이터는 function()의 매개변수
								// obj : {"result" : true} or {"result" : false}
								// obj.result == obj["result"] == true or false
								if(obj.result){
									id_msg.text('멋진 아이디네요!')
									id_msg.attr('class','message_green');
									id_result = true;
								}
								else{
									id_msg.text('이미 사용 중인 아이디입니다.')
								}
							},
							error: function(){
								alert('오류가 발생했습니다.');
							}
						})
					} else{
						id_msg.text(' 4 ~ 32자, 소문자, 숫자, 특수문자( _ 또는 -), 소문자 시작');
					}
				})
			
			const join_btn = $('#join_btn');
			join_btn.click(function(event){
				if( !id_result ){
					event.preventDefault();
					return false;
				}
				join();
			})
		})
		
		function join(){
			$.ajax({
				url: '/12_AJAX/join.do',
				type: 'post',
				data: $('#join_form').serialize(),	// join_form의 모든 파라미터를 보낼 때
				dataType: 'json',
				success: function(obj){
					if(obj.result == 1){
						alert('회원가입 성공!');
						location.href = '/12_AJAX/loginPage.do';
					} else{
						alert('회원가입 실패!');
					}
				},
				error: function(){
					alert('오류가 발생했습니다.');
				}
			})	
		}
	</script>
	
</head>
<body>
	<form id="join_form" method="post">
		<h1>회원가입</h1>
		
		<label for="id">아이디</label>
		<input type="text" id="id" name="id">
		<div id="id_msg" class="message_red"></div>
		
		<label for="pw">비밀번호</label>
		<input type="password" id="pw" name="pw">
		<div id="pw_msg" class="message_red"></div>
		
		<label for="name">이름</label>
		<input type="text" id="name" name="name">
		<div id="name_msg" class="message_red"></div>
		
		<label for="email">이메일</label>
		<input type="text" id="email" name="email">
		<div id="email_msg" class="message_red"></div>
		
		<label for="phone">연락처</label>
		<input type="text" id="phone" name="phone">
<!-- 		<div id="phone_box">
			<input type="text" id="phone" name="phone">-
			<input type="text" id="phone" name="phone">-
			<input type="text" id="phone" name="phone">
			<div id="phone_msg" class="message_red"></div>
		</div> -->
		<br><br>
		<input type="button" value="가입하기" id="join_btn">
	</form>
</body>
</html>