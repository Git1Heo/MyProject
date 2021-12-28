<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="${path}/resources/js/signup.js"></script> 
    <style>
        body{
            background-color: white;
        }
        input{
            height: 50px;
            font-size: xx-large;
        }
        #endButton{
            height: 60px;
        }
        #select{
            color: gray;
            font-size: large;
        }
        #ddd{
            background-color: blanchedalmond;
        }
    </style>
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
	    	
	function idDuplicate(){
		
	    const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d-_]{5,20}$/; 
		const id=document.getElementById("id").value;
		console.log(id);
		const checkResult=document.getElementById("idoutput");
		
		$.ajax({
			type:'post', 
			url: 'idDuplicate', 
			data : {'id':id}, 
			dataType : 'text', 
			success : function(result){ 
/* 				console.log('ajax성공')
				console.log(result) */
				
				if(result=="ok"){

				    if(id.length==0){
				    	checkResult.innerHTML="필수 입력값입니다.";
				    	checkResult.style.color="red";
				    }
				    else if(id.match(exp)){
				       /*  console.log("유효한 형식입니다.") */
				        checkResult.innerHTML="GOOD";
				        checkResult.style.color="green"
				    }
				    else{
				        /* console.log("유효하지 않은 형식입니다.") */
				        checkResult.innerHTML="유효하지 않은 형식입니다.";
				        checkResult.style.color="red"
				    }
				    
				}
				else{
					checkResult.style.color = 'red';
					checkResult.innerHTML='이미 사용중인 아이디입니다.';
				}
			
			},
			error : function(){
				console.log('ajax실패');
			}
		});
		
	}
	
	</script>

</head>
<body>
    <div class="container" id="ddd">
        <div class ="py-5 text-center" >
            <h2 >Checkout form</h2>
            <p class="lead" >회원가입 페이지</p>
        </div>
        
        <div class="row" style="width: 100%">
    		<form action="signup" method="POST" name="signup" enctype="multipart/form-data">
             <div style="width: 60%; float:none; margin:0 auto" >
                <div class="input-group mb-3">
                    <h4 class="mb-2">아이디</h4>
                    <input type="text" name="m_id" class="form-control md-0.8" id="id" onblur=" idDuplicate();" placeholder="영문소문자와 숫자를 사용해 아이디를 입력하세요(5~20)" style="width: 100% ;">
                    <p id="idoutput"></p>
                </div>

                <div class="input-group mb-3">
                    <h4 class="mb-2">비밀번호</h4>
                    <input type="password" name="m_password" class="form-control mb-0.8" id="pw1" onblur="pw1check()" placeholder="8~16 자리의 비밀번호를 영문대소문자와 숫자를 이용해 입력하세요" style="width: 100% ;">
                    <p id="pw1output"></p>
                </div>

                <div class="input-group mb-3">
                    <h4 class="mb-2">비밀번호 확인</h4>
                    <input type="password" class="form-control mb-0.8" id="pw2" onkeyup="pw2check()" placeholder="비밀번호를 다시 입력하세요" style="width: 100% ;">
                    <p id="pw2output"></p>
                </div>

                <div class="input-group mb-3">
                    <h4 class="mb-2">이름</h4>
                    <input type="text" name="m_name"  class="form-control mb-0.8" id="name" onblur="namecheck()" placeholder="이름을 입력하세요" style="width: 100% ;">
                    <p id="nameoutput"></p>
                </div>

                <div class="mb-2">
                    <h4 style="display: inline;">본인 확인 이메일</h4>
                    <span id="select">(선택)</span>
                </div>
                <div class="input-group mb-3">
                    <input type="text" name="m_mail" class="form-control" placeholder="본인 확인 이메일" style="width: 100px;" >
                    <span class="input-group-text">@</span>
                    <select name="m_com" id="@" class="form-select" >
                        <option value="선택하세요">선택하세요</option>
                        <option value="@gmail.com">gmail.com</option>
                        <option value="@naver.com">naver.com</option>
                        <option value="@daum.net">daum.net</option>
                    </select>                    
                </div>

                <div class="input-group mb-3">
                    <h4 class="mb-2">전화번호</h4>        
                    <input type="text" name="m_phone" class="form-control" id="pn" onblur="pncheck()" placeholder="OOO-OOOO-OOO 형식으로 전화번호를 입력하세요" style="width: 100% ;">
                    <p id="phone-check-result"></p>
                </div>	
	
                  <button class="btn btn btn-primary btn-round mb-4" style="width: 100%" id="endButton">회원가입</button> 
             </div>
    		</form>
         </div>


    </div>
    
    값 알맞을때만 회원가입 되도록 자바스크립트
</body>
</html>