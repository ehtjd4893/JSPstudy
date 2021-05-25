<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	.container{
		margin: 100px auto;
		width: 500px;
		text-align: center;
	}
	talbe{
		width: 100%;
	}
	</style>
	<script>
		$(function(){
			const pw_btn = $('#pw_btn');
			pw_btn.on('click',function(){
				alert('비밀번호 변경 페이지로 이동합니다.');
				location.href = 'pwPage.jsp';
			})
			
			const email = $('#email');
			const f = $('#f');
			const name = $('#name');
			$('#change_btn').on('click',function(){
				if(email.val() == ''){
					alert('이메일은 필수입력입니다.');
					email.focus();
					return;
				}
				else if(email.val() == '${loginDTO.email}' && name.val() == '${loginDTO.name}'){
					alert('변경할 내용이 없습니다.');
					return;
				}
				//location.href='myChange.jsp?email=' + $('#email').val() + '&name=' + $('#name').val();
				f.attr('action', 'updateMember.jsp');
				f.submit();
			})
			
			$('#reuturn_btn').on('click',function(){
				location.href ='/09_MODEL1/index.jsp'
			})
			
			const leave_btn = $('#leave_btn');
			leave_btn.on('click',function(){
				if(confirm('정말로 탈퇴하시겠습니까?')){
					location.href = 'leave.jsp'
				}
			})
		})
	</script>
</head>
<body>
	<div class="container">
		<form id="f" method="post" action="#">
		<table border="1">
			<thead>
				<tr>
					<td colspan="2">${loginDTO.name}님 정보</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>회원번호</td>
					<td>${loginDTO.no}</td>					
				</tr>
				<tr>
					<td>아이디</td>
					<td>${loginDTO.id}</td>					
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="button" value="비밀번호 변경" id="pw_btn"></td>					
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" id="name" name="name" value="${loginDTO.name}"></td>					
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" id="email" name="email" value="${loginDTO.email}"></td>					
				</tr>
				<tr>
					<td>가입일</td>
					<td>${loginDTO.regdate}</td>					
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="개인정보 수정하기" id="change_btn">
						<input type="button" value="되돌아가기" id="reuturn_btn">
						<input type="button" value="회원탈퇴" id ="leave_btn">
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</div>
</body>
</html>