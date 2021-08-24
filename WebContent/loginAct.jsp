<%@page import="home.member.MemberDTO"%>
<%@page import="home.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
%>

	<jsp:useBean id="user" class="home.member.MemberDTO" />
	<jsp:setProperty property="*" name="user" />

	<%
	MemberDAO dao = new MemberDAO();

	MemberDTO result = dao.selectJsp_memberOne(user);
	String auto = request.getParameter("auto");
	
	if(result != null){
		//로그인 성공
		
		session.setAttribute("login", result);
		
		Cookie cid = new Cookie("id", result.getId());
		Cookie cpw = new Cookie("pw", result.getPasswd());
		
		cid.setMaxAge(60 * 60);
		cpw.setMaxAge(60 * 60);
		
		if(auto == null){
			cid.setMaxAge(0);
			cpw.setMaxAge(0);
		}
		
		response.addCookie(cid);
		response.addCookie(cpw);

		response.sendRedirect("index.jsp");	
	}
	
	%>

	<script>
		alert('일치하는 계정이 존재하지 않습니다');
		locaiton.href = 'login.jsp';
	</script>


</body>
</html>