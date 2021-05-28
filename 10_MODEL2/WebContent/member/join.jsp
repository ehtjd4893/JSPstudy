<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<% request.setCharacterEncoding("utf-8"); %>
<link rel="stylesheet" href="../assets/css/layout.css">

<jsp:include page="../layout/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
<script>
	$(function(){
		const f = $('#f');
		const id = $('#id');
		const id_message = $('#id_message');
		
		function idCheck(){
			let result = false;
			if(id.val() == ''){
				id_message.text('아이디를 입력하세요.');
				id_message.attr('class','message');	
			}
			else{
				id_message.text('가능한 아이디입니다.');
				id_message.attr('class','message green');
				result = true;
			}
			
			return result;
		}
		
		id.blur(function(){
			idCheck();
		});
		const pw = $('#pw');
		const pw2 = $('#pw2');
		const pw_message = $('#pw_message');
		const pw2_message = $('#pw2_message');

		function pwCheck(){
			let result = false;
			if(pw.val() == ''){
				pw_message.text('비밀번호를 입력하세요.');
				pw_message.attr('class','message');	
			}
			else{
				pw_message.text('가능한 비밀번호입니다.');
				pw_message.attr('class','message green');
				result = true;
			}
			return result;
		}
		
		pw.blur(function(){
			pwCheck();
		});
		
		function pw2Check(){
			let result = false;
			pw2_message.attr('class','message');
			if(pw2.val() == '')
				pw2_message.text('비밀번호를 한 번 더 입력하세요.');
			else if(pw.val() != pw2.val())
				pw2_message.text('비밀번호가 일치하지 않습니다.');
			else if(pw.val() == pw2.val()){
				pw2_message.text('비밀번호 확인이 완료되었습니다.')
				pw2_message.attr('class','message green');
				result = true;
			}
			return result;
		}
		pw2.blur(function(){
			pw2Check();
		});
		const name = $('#name');
		const name_message = $('#name_message');
		
		const email = $('#email');		
		const email_message = $('#email_message');
		
		function emailCheck(){
			let result = false;
			if(email.val() == ''){
				email_message.text('이메일을 입력하세요.');
				email_message.attr('class','message');
			}
			else{
				email_message.text('가능한 이메일입니다.');
				email_message.attr('class','message green');
				result = true;
			}
			return result;
		}
		email.blur(function(){
			emailCheck();
		})
		f.submit(function(event){
			if( !idCheck() || !pwCheck() || !pw2Check() || !emailCheck()){
				alert('회원가입 정보를 확인하세요.');
				event.preventDefault();
				return false;
			}
			f.submit();
			return true;
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


<div class="join_form">
	<form method="post" id="f" action="join.m">
		<%-- 아이디 --%>
		<div class="box">
			<span class="title">아이디</span>
			<input type="text" name="id" id="id" placeholder="ID">
			<span class="message" id="id_message"></span>
		</div>
		<%-- 비밀번호 --%>
		<div class="box">
			<span class="title">비밀번호</span>
			<input type="password" name="pw" id="pw" placeholder="Password">
			<span class="message" id="pw_message"></span>
		</div>
		<%-- 비밀번호 확인 --%>
		<div class="box">
			<span class="title">비밀번호 확인</span>
			<input type="password" name="pw2" id="pw2" placeholder="Password">
			<span class="message" id="pw2_message"></span>
		</div>
		<%-- 이름 --%>
		<div class="box">
			<span class="title">이름</span>
			<input type="text" name="name" id="name" placeholder="Name">
		</div>
		<%-- 이메일 --%>
		<div class="box">
			<span class="title">이메일</span>
			<input type="text" name="email" id="email" placeholder="E-mail">
			<span class="message" id="email_message"></span>
		</div>
		<%-- 인증(캡차, SMS, 이메일 등) --%>
		<%-- 약관 동의 --%>
		<button>회원가입</button>
	</form>
</div>
<%-- 정적 페이지 포함 (파라미터 전달이 불가능하다.) --%>
<%@ include file="../layout/footer.jsp" %>