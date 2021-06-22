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
			fn_insert();
			fn_selectList();
		});
		
		function fn_insert(){
			$('#insert_btn').click(function(){
				var chk = /^[0-9]{6}$/;
				if( !chk.test($('#sno').val()) ){
					alert('sno는 6자리여야 합니다.');
					return;
				}
				$.ajax({
					url: 'insert.do',
					type: 'post',
					data: $('#f').serialize(),
					dataType: 'json',
					success: function(obj){
						if(obj.count > 0){
							alert('등록 성공');
							fn_selectList();
						} else{
							alert('등록 실패');
						}
					},
					error: function(xhr, textStatus, errorThrown){
						if(xhr.status == 3001 || xhr.status == 3002 || xhr.status == 3003 || xhr.status == 3004)
							alert(xhr.responseText);
					}
					
				});
			});
		}
		
		function fn_selectList(){
			$('#person_list').empty();
			$.ajax({
				url: 'selectList.do',
				type: 'get',
				dataType: 'json',
				success: function(arr){
					$.each(arr, function(i, person){
						$('<tr>')
						.append( $('<td>').text(person.sno) )
						.append( $('<td>').text(person.name) )
						.append( $('<td>').text(person.age) )
						.append( $('<td>').text(person.birthday) )
						.append( $('<td>').text(person.regdate) )
						.append( $('<input type="hidden" name="sno">').val(person.sno) )
						.append( $('<input type="button" id="delete_btn">').val('삭제') )
						.appendTo( $('#person_list'));
					});
				},
				error: function(xhr, textStatus, errorThrown){
					alert(xhr.status + ' 에러 발생');
				}
			})
		}
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
		td:nth-of-type(5) { width: 150px; }
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
						<td>등록일</td>
						<td></td>
					</tr>
				</thead>
				<tbody id="person_list">
					
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>