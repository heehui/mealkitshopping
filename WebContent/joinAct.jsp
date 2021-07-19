<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="mbdto" class="home.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto" />
<jsp:useBean id="mbdao" class="home.member.MemberDAO" />
<% 
   if(mbdto.getName()==null || mbdto.getName().trim().equals("")){
    	response.sendRedirect("join.jsp");
    	return;
    }
    
   int res = mbdao.insertMember(mbdto);
   
   if(res>0){ %>
<script type="text/javascript">
	alert("회원가입 성공하셨습니다.")
	location.href = "index.jsp"
</script>
<% }else{ %>
<script type="text/javascript">
	alert("회원가입 실패하셨습니다. 회원가입 페이지로 이동합니다.")
	location.href = "join.jsp"
</script>
<%}%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>