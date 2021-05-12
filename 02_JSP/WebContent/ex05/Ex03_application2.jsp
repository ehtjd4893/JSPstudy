<%@page import="java.net.InetAddress"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 작성일자, 작성자, 제목, 내용, 작성ip --%>

<% 
	request.setCharacterEncoding("utf-8");
	String date = request.getParameter("date");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	InetAddress Address = InetAddress.getLocalHost();
	String ip = Address.toString().split("/")[1];
/* 	String ip = request.getHeader("X-Forwarded-For");
	if(ip == null){
		ip = request.getRemoteAddr();
	} */
	
	// 파일명 결정
	// "ip_writer.txt" ip를 구성하는 마침표(.)는 밑줄(_)로 바꿔서 처리
	String filename = ip.replaceAll("\\.", "_") + "_" + writer + ".txt";
	
	// 파일이 저장될 경로 (realPath 활용)
	String realPath = application.getRealPath("ex05/" + filename );	
	System.out.println(ip);
	System.out.println(filename);
	// 파일 생성
	File file = new File(realPath);
	BufferedWriter bw = new BufferedWriter(new FileWriter(file));
	bw.write("작성일자: " + date + "\n");
	bw.write("작성ip: " + ip + "\n");
	bw.write("작성자: " + writer + "\n");
	bw.write("제목: " + title + "\n");
	bw.write(contents);
	if(bw != null)
		bw.close();
	
	boolean isExist = file.exists();
%>
<script>
	if(<%=isExist %>){
		alert('<%=filename%>이 생성됨');
	}else{
		alert('파일이 생성되지 않음');
	}
	// 뒤로 갈 때 파라미터 전달이 안 된다.
	// history.back();
	
	location.href = "/02_JSP/ex05/Ex03_application.jsp?state=visited";
	
</script>