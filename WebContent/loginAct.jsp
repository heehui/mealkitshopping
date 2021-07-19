<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>

<jsp:useBean id="check" class="home.login.LoginCheck" />
<jsp:setProperty property="*" name="check" />


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<%
	if (check.getId() == null || check.getId().trim().equals("")) {
		response.sendRedirect("login.jsp");
		return;
	}
	String msg = null;
	String url = "login.jsp";

	int res = check.loginCheck();

	if (res == check.OK) {
		
		session.setAttribute("id",check.getId());
		
		msg = check.getId() + "님 로그인 되었습니다.";
		url = request.getContextPath() + "/index.jsp";
	} else if (res == check.NOT_ID) {
		msg = "없는 아이디입니다. 확인 후 로그인 해주세요.";
	} else if (res == check.NOT_PW) {
		msg = "비밀번호가 틀렸습니다. 확인 후 로그인 해주세요.";
	} else if (res == check.ERROR) {
		msg = "서버오류 발생입니다. 관리자에게 문의하세요.";
	}
%>
<script type="text/javascript">
    alert("<%=msg%>")
    location.href= "<%=url%>"
    
    
</script>

<title>Insert title here</title>
</head>
<body>

</body>
</html>