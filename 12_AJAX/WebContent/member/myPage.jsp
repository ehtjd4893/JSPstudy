<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		$(function(){
			$('#update_pw_btn').click(function(){
				updatePw();
			})
			
			$('#update_info_btn').click(function(){
				update_info();
			})
			
			$('#delete_member_btn').click(function(){
				delete_member();
			})
			
			function updatePw(){
				if('${loginUser.pw}' != $('#pw0').val()){
					alert('현재 비밀번호를 확인하세요.');
					return;
				} else if('${loginUser.pw}' == $('#pw').val()){
					alert('현재 비밀번호와 동일한 비밀번호입니다.');
					return;
				} else if($('#pw').val() == ''){ 	// 비밀번호 정규식으로 변경
					alert('새 비밀번호를 확인하세요.');
					return;
				} else if($('#pw').val() != $('#pw1').val()){
					alert('비밀번호를 확인하세요.');
					return;
				}
				$.ajax({
					url: '/12_AJAX/updatePw.do',
					type: 'post',
					data: $('#my_form').serialize(),
					dataType: 'json',
					success: function(obj){
						if(obj.result == 1){
							alert('비밀번호가 변경 성공!');
							$('#pw0').val('');
							$('#pw').val('');
							$('#pw1').val('');
						}
						else{
							alert('비밀번호가 변경 실패');
						}
					},
					error: function(){
						alert('오류 발생!');
					}
				})
			}
			
			function update_info(){
				const name = $('#name');
				const email = $('#email');
				const phone = $('#phone');
				

				if(name.val() == '${loginUser.name}' && email.val() == '${loginUser.email}' && phone.val() == '${loginUser.phone}'){
					alert('수정할 정보가 없습니다.');
					return;
				}
				else{
					$.ajax({
						url: '/12_AJAX/updateInfo.do',
						type: 'post',
						data: $('#my_form').serialize(),
						dataType: 'json',
						success: function(obj){
							if(obj.result == 1){
								alert('회원정보 수정 성공');
								name.text('${loginUser.name}');
								email.text('${loginUser.email}');
								phone.text('${loginUser.phone}');
							}
							else{
								alert('회원정보 수정 실패');
							}
						},
						error: function(){
							alert('에러 발생');
						}
					})
					
				}
			}
			
			function delete_member(){
				if(confirm('정말 탈퇴하시겠습니까?')){
					$.ajax({
						url: '/12_AJAX/deleteMember.do',
						type: 'post',
						data: $('#my_form').serialize(),
						dataType: 'json',
						success: function(obj){
							alert('탈퇴 성공! 또 뵙겠습니다.');
							location.href = '/12_AJAX/member/loginPage.do';
						},
						error: function(){
							alert('에러 발생');
						}
					})
				}else{
					return;
				}
			}
		})
	</script>
</head>
<body>
	<form id="my_form">
	${loginUser.name}님 반갑습니다.
	<a href="/12_AJAX/logout.do">로그아웃</a>
	<br><br>
	아이디<br>
	${loginUser.id}<br><br>
	
	현재 비밀번호<br>
	<input type="password" name="pw0" id="pw0" ><br><br>
	새 비밀번호<br>
	<input type="password" name="pw" id="pw"><br><br>
	비밀번호 확인<br>
	<input type="password" name="pw1" id="pw1">
	<input type="button" value="비밀번호 변경하기" id="update_pw_btn">
	
	이름<br>
	<input type="text" name="name" id="name" value="${loginUser.name}"><br><br> 
	
	이메일<br>
	<input type="text" name="email" id="email" value="${loginUser.email}"><br><br> 
	
	연락처<br>
	<input type="text" name="phone" id="phone" value="${loginUser.phone}"><br><br> 
	
	가입일시<br>
	${loginUser.regdate}<br><br>
	<input type="button" id="update_info_btn" value="회원정보 수정">
	<input type="button" id="delete_member_btn" value="회원 탈퇴">
	<input type="hidden" name="no" value="${loginUser.no}">
	</form>
</body>
</html>