<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.wdh.del.model.vo.Declaration,com.wdh.del.model.vo.DclComment" %>
<%
	Declaration dcl=(Declaration)request.getAttribute("dcl");
	List<DclComment> comments=(List<DclComment>)request.getAttribute("comment");
%>
<%@ page import="com.wdh.member.vo.Member" %>
<%
	Member loginMember=(Member)session.getAttribute("loginMember");
%>
<style>
    div#comment-container button#btn-insert{position:relative;}

	table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#dcl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#dcl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#dcl-comment tr td:last-of-type {text-align:right; width: 100px;}
/*     table#dcl-comment button.btn-reply{display:none;} */
    table#dcl-comment button.btn-delete{display:none;}
/*     table#dcl-comment tr:hover {background:lightgray;} */
     table#dcl-comment tr:hover button.btn-reply{display:inline;}
     table#dcl-comment tr:hover button.btn-delete{display:inline;}
/*     table#dcl-comment tr.level2 {color:gray; font-size: 14px;} */
    table#dcl-comment sub.comment-writer {color:navy; font-size:14px}
    table#dcl-comment sub.comment-date {color:tomato; font-size:10px}
/*     table#dcl-comment tr.level2 td:first-of-type{padding-left:100px;}*/
/*     table#dcl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}*/
/*     table#dcl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}*/

</style>

<!DOCTYhPE tml>
<html>
<head>
    <title>고객센터 - 신고하기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="<%=request.getContextPath()%>/images/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico">
  
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/templatemo.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome.min.css">
    
    <!-- Load fonts style after rendering the layout styles -->

	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>

<body>
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="<%=request.getContextPath() %>/index.jsp">
                <img class="logo" src="<%=request.getContextPath() %>/images/logo3.png" alt="" style="width: 150px;" >
            </a>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/index.jsp">메인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/cs/spon.do">광고문의</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/cs/dclWrite.do">신고하기</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/cs/writeQs.do">1대1 문의</a>
                        </li>
                    </ul>
                </div>
               
            </div>

        </div>
    </nav>
    <!-- Close Header -->
    <br>
<section id="dcl-container">
<div font-family:Jua;>
    <div id="tbl-board">
    	<h2><strong>신고하기 상세페이지</strong></h2>
    		<table id="tbl-dcl">
    			<tr>
    				<th>제 목</th>
    				<td><%=dcl.getDclTitle() %></td>
    			</tr>
    			<tr>
    				<th>분 류</th>
    				<td><%=dcl.getDclHeadTitle() %></td>
    			</tr>
    			<tr>
    				<th>작 성 자</th>
    				<!-- 작성자 번호 말고 아이디로 받아와야함 -->
    				<td><%=dcl.getMember().getMember_id() %></td>
    			</tr>
    			<tr>
    				<th>첨부 파일</th>
    				<td><%if(dcl.getFilePath()!=null){ %>
    					<img src="<%=request.getContextPath() %>/images/file.png" width="20" onclick="fn_fileDown('<%=dcl.getFilePath() %>');">
    					<%=dcl.getFilePath() %>
    				<%}else{ %>
    						첨부파일없음
    				<%
    				}%>
    					</td>
    			</tr>
    			<tr>
    				<th>내 용</th>
    				<td><%=dcl.getDclContent() %></td>
    			</tr>
    		</table>
    			<br>
    			<!-- 관리자만 삭제할 수 있고 답변 할 수 있게 분기처리 -->
<%--     			<%if(loginMember!=null&&loginMember.getMember_id().equals("admin")){ %> --%>
<!--     			<tr> -->
<!--     				<th colspan="1"> -->
    					
<%--     					<input type="button" value="삭제" onclick="fn_deleteDcl(<%=dcl.getDclNo() %>,'<%=dcl.getFilePath() %>');">  --%>
<!--     				</th> -->
<!--     			</tr> -->
<%--     			<%} %> --%>
    		<div id="comment-container">
    			<div class="comment-editor">
    				<form action="<%=request.getContextPath()%>/cs/commentWrite.do" method="post">
    					<textarea name="content" rows="10" cols="70" placeholder="신고하기 답변"></textarea>
    					<input type="hidden" name="dclref" value="<%=dcl.getDclNo() %>">
    					<input type="hidden" name="level" value="1"/>
    					<input type="hidden" name="commentref" value="1"/>
    					<input type="hidden" name="commentWriter" value="관리자"/>
    					<button type="submit" id="btn-insert">등록</button>
     				</form>
    			</div>
    		<table id="dcl-comment">
    			<%if(!comments.isEmpty()) {
    				for(DclComment dc : comments){
    					if(dc.getDclCommentLevel()==1){%>
    				<tr class="level1">
    					<td>
    						<sub class="comment-writer"><%=dc.getDclCommentWriter() %></sub>
    						<sub class="comment-date"><%=dc.getDclCommentDate() %></sub>
    						<br>
    							<%=dc.getDclCommentContent() %>
    					</td>
    				</tr>
    				<tr>
    					<td>
    						<button class="btn-delete">삭제</button>
    					</td>  
    				</tr>
    			<%}//if
    			}//for
    		}//if%>
    		</table>
    		<br>
    	</div>
    </div>
   </div>
    </section>
    <script>
    	const fn_fileDown=(fileName)=>{
    		//다운로드 스크립트
    		location.assign("<%=request.getContextPath()%>/cs/fileDown.do?filename="+fileName);
    	}
    	const fn_deleteDcl=(dclNo,fileName)=>{
    		//삭제하기 스크립트
    		location.replace("<%=request.getContextPath()%>/cs/deleteDcl.do?no="+dclNo+"&fileName="+fileName);
    	}
    </script>
<%@ include file="/views/common/footer.jsp" %>