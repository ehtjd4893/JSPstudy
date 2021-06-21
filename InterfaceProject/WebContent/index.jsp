<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		$(function(){
			fn_insert();
		});
		//함수
		function fn_insert(){
			$('#insert_btn').click(function(){
				var regSNO = /^[0-9]{6}$/;
				if( !regSNO.test($('#sno').val())){
					alert('주민등록번호는 6자리 숫자입니다.');
					return;
				}
				$.ajax({
					url: 'insertPerson.do',
					type: 'post',
					data: $('#f').serialize(),
					dataType: 'json',
					success: function(obj){
						if(obj.count > 0){
							alert('등록되었습니다.');
						} else{
							alert('등록되지 않았습니다.');
						}
					},
					error: function(xhr, textStatus, errorThrown){
						//console.log(textStatus);
						//console.log(errorThrown);
						//xhr.status : 상태를 정의하는 정수 값, 임의로 결정
						//console.log(xhr.status);
						//xhr.responseText: 응답된 텍스트, 예외 메시지가 전달됨
						//console.log(xhr.responseText);
						if(xhr.status == 3001 || xhr.status == 3002 || xhr.status == 3003){
							alert(xhr.responseText);
						}
					}
				}); 	// ajax
			});	// click
		}	// fn_insert
	</script>
	<style>
		.container {
			display: flex;
		}
		.insert_form {
			margin-right: 20px;
		}
		table {
			width: 500px;
			border-collapse: collapse;
		}
		td {
			border-top: 1px solid black;
			border-bottom: 1px solid black;
		}
		td:nth-of-type(1) { width: 150px; }
		td:nth-of-type(2) { width: 100px; }
		td:nth-of-type(3) { width: 100px; }
		td:nth-of-type(4) { width: 150px; }
	</style>
</head>
<body>
	<div class="container">
		<div class="insert_form">
			<form id="f">
				<input type="text" name="sno" ID="sno" placeholder="주민등록번호(6자리)"><br>
				<input type="text" name="name" id="name" placeholder="이름"><br>
				<input type="text" name="age" id="age" placeholder="나이"><br>
				<input type="text" name="birthday" id="birthday" placeholder="생일"><br>
				<input type="button" value="등록하기" id="insert_btn">
			</form>
		</div>
		<div class="list_form">
			<table>
				<thead>
					<tr>
						<td>주민등록번호</td>
						<td>이름</td>
						<td>나이</td>
						<td>생일</td>
					</tr>
				</thead>
				<tbody id="person_list">

				</tbody>
			</table>
		</div>
	</div>

</body>
</html>