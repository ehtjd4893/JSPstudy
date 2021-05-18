<%@page import="ex02_el.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		List<Person> list = new ArrayList<>();
		for(int i = 0; i < 3; i++){
			list.add(new Person());
		}
		list.get(0).setName("도성");
		list.get(0).setAge(5);
		list.get(1).setName("해창");
		list.get(1).setAge(15);
		list.get(2).setName("세돌");
		list.get(2).setAge(25);
		
		// EL 사용을 위해서
		pageContext.setAttribute("list", list);
	%>
	<%-- EL에서 ArrayList 사용: 배열처럼 쓴다. --%>
	<h3>이름1: ${list[0].name}<br>나이1: ${list[0].age}</h3>
	<h3>이름2: ${list[2].name}<br>나이2: ${list[1].age}</h3>
	<h3>이름3: ${list[3].name}<br>나이3: ${list[2].age}</h3>


</body>
</html>