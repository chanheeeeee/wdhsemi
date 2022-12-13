<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<style>
       
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Jua", sans-serif;
      }

      a {
        text-decoration: none;
        color: black;
      }

      li {
        list-style: none;
      }

      .wrap {
        width: 100%;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background: rgba(116, 114, 114, 0.1);
      }

      .login {
        width: 30%;
        height: 600px;
        background: white;
        border-radius: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
      }

      h2 {
        color: blue;
        font-size: 2em;
      }
     
      .login_id {
        margin-top: 20px;
        width: 80%;
      }

      .login_id input {
        width: 100%;
        height: 50px;
        border-radius: 30px;
        margin-top: 10px;
        padding: 0px 20px;
        border: 1px solid lightgray;
        outline: none;
        font-family: "Jua";
      }

      .login_pw {
        margin-top: 20px;
        width: 80%;
       
      }

      .login_pw input {
        width: 100%;
        height: 50px;
        border-radius: 30px;
        margin-top: 10px;
        padding: 0px 20px;
        border: 1px solid lightgray;
        outline: none;
        font-family: "Jua";
      }

      .submit {
        margin-top: 50px;
        width: 80%;
        font-size: 30px !important;
      }
      .submit input {
        width: 100%;
        height: 50px;
        border: 0;
        outline: none;
        border-radius: 40px;
        background: linear-gradient(to left, rgb(39, 36, 227), rgb(130, 178, 233));
        color: white;
        font-size: 1.2em;
        letter-spacing: 2px;
        font-family: "Jua", sans-serif;
      }
      div.forgot > button {
        margin-right: 20px;
        padding: 5px 15px 5px 15px;
        font-size: 20px;
      }

  

</style>
   
    <!-- Start Section -->
        <center>
            <div class="wrap">
                <div class="login">
                    
                  <h2>LOG-IN</h2>
                    
                    <div class="login_id">
                        <input type="text" name="" id="userId" placeholder="ID">
                    </div>

                    <div class="login_pw">
                        <input type="password" name="" id="password" placeholder="Password">
                    </div>

					<div id="login_result" style="color: red;"></div>

                    <div class="submit">
                        <input type="button" value="확인" id="btnLogin">
                    </div>
                    
                    <br>

                    <div class="forgot" >
                    <button type="button" onclick="location.href='<%=request.getContextPath() %>/member/findPw.do';" style="font-family: Jua;border: outset;">비밀번호 찾기</button>
                    <button type="button" onclick="location.href='<%=request.getContextPath() %>/member/findId.do';" style="font-family:'Jua';border: outset;">아이디 찾기</button> 
                    <button type="button" onclick="location.href='<%=request.getContextPath() %>/member/joinMember.do';" style="font-family:'Jua';border: outset;">회 원 가 입</button> 
                    </div>
                </div>
            </div>
        </center>

	<script>
		$(function(){
			$("#btnLogin").on("click", function(){
				//아이디와 비밀번호 가져오기
				let id = $("#userId").val();
				let pwd = $("#password").val();
				
				console.log("id : "+id);
				console.log("pwd : "+pwd);
				
				//이걸 하는 이유는 로그인 시도시 결과창을 초기화하기 위함
				$("#login_result").html("");
				
				//ajax 통신
				$.ajax({
					url : "<%=request.getContextPath()%>/loginAction.do",
					data : {"loginId":id,"password":pwd},
					type : "POST",
					dataType : "json",
					success : function(data) {
						console.log(data);

						let loginYn = data.loginYn;
						if(loginYn == "N") {
							$("#login_result").html("<span>로그인에 실패하였습니다 다시 시도해주세요.</span>");
						}else{
							//페이지 이동
							location.href="<%=request.getContextPath()%>/main.do";
						}
					},
					error : function(e, r, m){
						console.log(e);
						console.log(r);
						console.log(m);
					}
				});
			});
		});
	</script>


<%@include file="/views/common/footer.jsp"%>