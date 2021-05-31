<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<% request.setCharacterEncoding("utf-8"); %>
<link rel="stylesheet" href="../assets/css/layout.css">

<jsp:include page="../layout/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>
<script>
	$(function(){
		const f = $('#f');
		const pw_btn = $('#pw_btn');
		pw_btn.on('click',function(){
			location.href = '/10_MODEL2/updatePwPage.m';			
		})
		
		const update_btn = $('#update_btn');
		const name = $('#name');
		const email = $('#email');
		update_btn.click(function(event){
			if(name.val() == '${loginDTO.name}' && email.val() == '${loginDTO.email}'){
				alert('변경할 내역이 없습니다.')
				event.preventDefault();
				return false;
			}
			f.attr('action', '/10_MODEL2/updateMember.m');
			f.submit();
		})
		
		const delete_btn = $('#delete_btn');
		delete_btn.click(function(){			
			if(confirm('탈퇴하겠습니까?')){
				location.href = '/10_MODEL2/deleteMember.m';
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
	
	input[type="button"]{
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


<div class="my_form">
	<form method="post" id="f" >
		<%-- 아이디 --%>
		<div class="box">
			<span class="title">아이디</span>
			<input type="text" name="id" id="id" placeholder="ID" value="${loginDTO.id}" disabled>
			<span class="message" id="pw_message">변경 불가</span>
		</div>
		<%-- 비밀번호 --%>
		<div class="box">
			<span class="title">비밀번호 변경</span><br>
			<input type="button" value="비밀번호 변경하기" id="pw_btn"><br>
		</div>
		<%-- 이름 --%>
		<div class="box">
			<span class="title">이름</span>
			<input type="text" name="name" id="name" value="${loginDTO.name}">
			<span class="message" id="pw2_message"></span>
		</div>

		<%-- 이메일 --%>
		<div class="box">
			<span class="title">이메일</span>
			<input type="text" name="email" id="email" value="${loginDTO.email}">
		</div>
		<%-- 인증(캡차, SMS, 이메일 등) --%>
		<%-- 약관 동의 --%>
		<input type="button" value="회원정보수정" id="update_btn"><br><br>
		<input type="button" value="회원 탈퇴" id="delete_btn">
	</form>
</div>
<%-- 정적 페이지 포함 (파라미터 전달이 불가능하다.) --%>
<%@ include file="../layout/footer.jsp" %>