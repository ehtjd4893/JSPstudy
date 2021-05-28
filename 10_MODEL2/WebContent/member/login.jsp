<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<% request.setCharacterEncoding("utf-8"); %>
<link rel="stylesheet" href="../assets/css/layout.css">

<jsp:include page="../layout/header.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>

<script>
	$(function(){
		const f = $('#f');
		const id = $('#id');
		const pw = $('#pw');
		const id_message = $('#id_message');
		const pw_message = $('#pw_message');
		
		f.submit(function(event){
			if(id.val() == ''){
				id_message.text('아이디를 입력하세요.');
				id.focus();
				pw_message.text('');
				event.preventDefault();
				return false;
			}else{
				id_message.text('');
			}
			
			if(pw.val() == ''){
				pw_message.text('비밀번호를 입력하세요.');
				event.preventDefault();
				return false;
			}else{
				id_message.text('');
			}	
		})		
	})
</script>
<style>
	*{
		box-sizing: border-box;
	}
	.login_form{
		widrh:300px;
		margin: 50px auto;
	}
	#f{
		margin: 100px auto;
		width: 300px;
	}
	.box{
		border: 0;
		box-sizing: border-box;
		display: block;
		background-color: white;
		width: 300px;
		height:60px;
	}
	#id, #pw{
		
		border-radius: 5px;
		border: 1px solid black;
		background-color: white;
		height: 40px;
		width: 298px;
		padding: 0 20px 0 20px;
		font-size: 18px;
	}
	#id_message, #pw_message{
		border: 0;
		background-color: white;
		height:10px;
		font-size: 10px;
		width:298px;
		padding: 0 20px 0 20px;
		color:red;
	}
	#id:focus, #pw:focus{
		outline: 0;
		border: 1px solid orange;
	}
	#f > button{
		border-radius: 5px;
		border: 1px solid black;
		width: 100px;
		height: 30px;
		line-height: 30px;
		color: black;
		background-color: yellow;
		float: right;
	}
</style>
<div class="login_form">
	<form method="post" action="/10_MODEL2/login.m" id="f">
		<div class="box">
			<input type="text" name="id" id="id" placeholder="ID"><br>
			<span id="id_message"></span><br>
		</div>
		<div class="box">
			<input type="password" name="pw" id="pw" placeholder="Password"><br>
			<span id="pw_message"></span><br>
		</div>
		<button>로그인</button>
	</form>
</div>
<%-- 정적 페이지 포함 (파라미터 전달이 불가능하다.) --%>
<%@ include file="../layout/footer.jsp" %>