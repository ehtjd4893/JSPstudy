<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<% request.setCharacterEncoding("utf-8"); %>
<link rel="stylesheet" href="../assets/css/layout.css">

<jsp:include page="../layout/header.jsp">
	<jsp:param value="비밀번호 변경" name="title"/>
</jsp:include>
<script>
	$(function(){
		const f = $('#f');
		const pw0 = $('#pw0');
		const pw0_message = $('#pw0_message');
		const pw = $('#pw');
		const pw_message = $('#pw_message');
		const pw1 = $('#pw1');
		const pw1_message = $('#pw1_message');
		f.submit(function(event){
			pw0_message.text('');
			pw_message.text('');
			pw1_message.text('');
			if (pw0.val() != '${loginDTO.pw}') {
				pw0_message.text('현재 비밀번호가 일치하지 않습니다.');
				pw0.focus();
				event.preventDefault();
				return false;
			} else if (pw.val() == '') {  // 공백검사 대신 정규식 검사로 수정
				pw_message.text('새 비밀번호를 입력하세요.');
				pw.focus();
				event.preventDefault();
				return false;
			} else if (pw.val() != pw1.val()) {
				pw1_message.text('비밀번호 입력을 확인하세요.');
				event.preventDefault();
				return false;
			}
		})
	})
</script>
<style>
	*{
		box-sizing: border-box;
	}
	.join_form{
		widrh:300px;
		margin: 50px auto;
	}
	#f{
		margin: 0 auto;
		width: 300px;	
		
	}

	.box{
		border: 0;
		box-sizing: border-box;
		display: block;
		background-color: white;
		width: 300px;
		height:80px;
	}

	input[type="text"], input[type="password"]{
		border-radius: 5px;
		border: 1px solid black;
		background-color: white;
		height: 40px;
		width: 298px;
		padding: 0 20px 0 20px;
		font-size: 18px;
	}
	
	input:disabled{
		background-color:black;
		color: white;
	}
	
	button{
		border-radius: 5px;
		border: 1px solid black;
		height: 40px;
		width: 298px;
		padding: 0 20px 0 20px;
		font-size: 18px;
	}
	.message{
		border: 0;
		background-color: white;
		height:10px;
		font-size: 10px;
		width:298px;
		padding: 0 20px 0 20px;
		color:red;
	}
	.green{
		color:green;
	}
	input:focus{
		outline: 0;
		border: 1px solid orange;
	}

</style>


<div class="pw_form">
	<form method="post" id="f" action="/10_MODEL2/updatePw.m">
		<%-- 아이디 --%>
		<div class="box">
			<span class="title">현재 비밀번호</span>
			<input type="password" name="pw0" id="pw0">
			<span class="message" id="pw0_message"></span>
		</div>
		<%-- 비밀번호 --%>
		<div class="box">
			<span class="title">새 비밀번호</span><br>
			<input type="password" id="pw" name="pw"><br>
			<span class="message" id="pw_message"></span>
		</div>
		<%-- 비밀번호 확인 --%>
		<div class="box">
			<span class="title">새 비밀번호 확인</span><br>
			<input type="password" id="pw1" name="pw1"><br>
			<span class="message" id="pw1_message"></span>
		</div>
		<%-- 인증(캡차, SMS, 이메일 등) --%>
		<%-- 약관 동의 --%>
		<button>비밀번호 변경하기</button>
	</form>
</div>
<%-- 정적 페이지 포함 (파라미터 전달이 불가능하다.) --%>
<%@ include file="../layout/footer.jsp" %>