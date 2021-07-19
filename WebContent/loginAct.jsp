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
		
		msg = check.getId() + "�� �α��� �Ǿ����ϴ�.";
		url = request.getContextPath() + "/index.jsp";
	} else if (res == check.NOT_ID) {
		msg = "���� ���̵��Դϴ�. Ȯ�� �� �α��� ���ּ���.";
	} else if (res == check.NOT_PW) {
		msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. Ȯ�� �� �α��� ���ּ���.";
	} else if (res == check.ERROR) {
		msg = "�������� �߻��Դϴ�. �����ڿ��� �����ϼ���.";
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