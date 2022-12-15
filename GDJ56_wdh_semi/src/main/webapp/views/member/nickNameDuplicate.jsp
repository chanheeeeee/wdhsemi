<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.wdh.member.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("member");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복확인하기</title>

<style>
	div#checknick-container{
		text-align : center;
		padding-top : 50px;
	}
	span#duplicated{
		color : red;
		font-weight : bolder;
	}
</style>

</head>
<body>
	<div id="checknick-container">
		<%if(m==null){ %>
			[<span><%=request.getParameter("member_id") %></span>]는 사용가능합니다.	
			<br><br>
		<%} else{%>
			[<span id="duplicated"><%=request.getParameter("member_id") %></span>]는 사용중입니다.
			<br><br>
			
		<%} %>
		<button type="button">닫기</button>
	</div>
	
	<script>
		const btn = document.querySelector("button[type=button]");
		/* console.log(btn); */
		btn.addEventListener("click",e=>{
			opener.document.querySelector("input#nickname").focus();
			close();
		});
	</script>
</body>
</html>