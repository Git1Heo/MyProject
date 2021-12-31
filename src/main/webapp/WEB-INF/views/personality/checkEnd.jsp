<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="${path}/resources/css/header.css" rel="stylesheet"/> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">



/* const TypeA =`a<br>
	b<br>
	c<br>`;
	
const str2 =`a2<br>
	b2<br>
	c2<br>`; */
	
const TypeA="A 타입"
const TypeB="B 타입"
const TypeC="C 타입"
const TypeD="D 타입"
const A='스스로를 온전히 사랑할 줄 아는 당신은 자존감이 높은 사람입니다. 언제나 자신감체 차 있고 일이 잘못되더라도 좌절하지 않고 문제를 현망하게 극복해가는 방법을 잘 알고 있으며, 이는 학습을 통해 습득했다기보다는 선천적을오 긍적적인 성격을 타고났기 때문인데, 때로는 너무 낙천적이여서 남이 보기에 위기의식이 없어 보일 수도 있습니다. 그러나 걱정하지 않아도 된다. 당신은 그러한 성격을 못마땅하게 여기던 사람들도 빛나는 긍정의 힘을 직접 보고 나면 태도가 달라질 것입니다.'	
const B='당신은 최근에 일어난 문제 상황이나 실수 때문에 스스로의 능력을 의심하고 있습니다. 그러나 실수 한번 없이 사는 사람은 없습니다. 필라멘트 전구를 발명하면서 2천 번의 시행착오를 거듭한 에디슨은 ""나는 2천번의 실패를 한 것이 아니라 2천번의 과정을 거쳐 발명을 했다"" 고 말했다. 당장의 실패로 목표가 사라지거나 퇴색되는 것은 아닙니다. 단지 좀 더 견고한 성공을 위해 잠시 돌아가는 것이므로 자신이 가진 무한의 가능성에 대해 의문을 갖거너 ""내가 이 일을 더 잘 해낼 수 있을까?"" 하는 의심을 버리세요'
const C='혹 자신이 하고 있는 일이나 생활들이 주변 사람들에 비해 형편없다고 생각하나요? 남들보다 좀 더 높은 연봉과 사회적 대우를 원한다면 제자리에서 불만만 토로하지 말고 현재의 모습에서 탈피하기 위해 스스로가 어떤 일을 할 수 있는지 살펴보세요. 노력도 하지 않고 남을 탓하거나 ""나는 이러니까 안돼""라는 식의 자기 비하만 늘어간다면 그나마 남아 있던 자존감마저 무너질 수 있습니다. 당ㅇ신에게 지금 가장 필요한 것은 남들과 비교가 아니라 자신감을 높이기 위해 자신을 돌아보는 일임을 잊지마세요.'
const D='기분이 좋았다가도 금세 우울해지고 화를 잘 내는 등 감정의 기복이 심한 당신은 주변 사람들로부터 알다가도 모를 사람이라는 말을 자주 듣습니다. 또한 대인관계에 있어서도 극히 소심하여 아주 가까운 한두 명의 친구 말고는 마음을 털어놓을 상대도 별로 없습니다. 이런 상황이다 보니 자신감이 결여되고, 그러한 자신의 모습에 애정을 느끼지 못한다.'		
window.onload = function() {
	const result=document.getElementById("result");
	if(${value}>=70){
		resultType.innerHTML=TypeA;
		result.innerHTML=A;
		document.getElementById("mbti").value="A";
		document.getElementById("profile").value="A.png";
	}
	
	else if(${value}>=50){
		resultType.innerHTML=TypeB;
		result.innerHTML=B;
		document.getElementById("mbti").value="B";
		document.getElementById("profile").value="B.png";
	}
	
	else if(${value}>=30){
		resultType.innerHTML=TypeC;
		result.innerHTML=C;
		document.getElementById("mbti").value="C";
		document.getElementById("profile").value="C.png";
	}
	
	else if(${value}>=1){
		resultType.innerHTML=TypeD;
		result.innerHTML=D;
		document.getElementById("mbti").value="D";
		document.getElementById("profile").value="D.png";
	}
	
	}

function checkend(){
	
	checkEnd.submit();		
}

	

</script>
<body class="container" style="background-color: whitesmoke;">

  <header >
    <div  class="shadow p-3 mb-5 bg-body rounded opacity-75" id="headline">
      <div>
        <h4 class="text-center mt-2"><strong>MBTI 게시판</strong></h4>
      </div>
      <div>
      
      <a href="/">
      	<img alt="" src="/resources/upload/home.png" >
      </a>
  
      <c:if test="${!empty sessionScope.loginID }">
     	 <span class="ml-3">${sessionScope.loginID}님 환영합니다.</span>
     </c:if> 
     	 
      <c:if test="${empty sessionScope.loginID }">
        <button class="btn btn-outline-primary btn float-right" data-bs-toggle="modal" data-bs-target="#exampleModal" style="float: right;">Login</button>
      </c:if>
      
      <c:if test="${!empty sessionScope.loginID }">
        <a href="/logout"><button class="btn btn-outline-primary" style="float: right;">Logout </button></a> 
      </c:if>
      
      <c:if test="${empty sessionScope.loginID }">
        <a href="/signup" style="float: right;" class="m-2 " id="singin">회원가입</a>
      </c:if>
      
       <c:if test="${!empty sessionScope.loginID }">
        <a href="/mypage?m_id=${sessionScope.loginID}" style="float: right;" class="m-2 " >mypage</a> 
       </c:if> 
      </div>

    </div>
  </header>
  

<section style="background-color: rgb(250, 250, 250);">

<div class ="col-6 mx-auto align-self-center"style="background-color: gray;  border-radius: 20px;">
	<p class="text-light mx-3">검사값 ${value}</p>
	<div>
		<p id="resultType" class="text-light mx-3"> </p>
	</div>
	
	<div>
		<p id="result" class="text-light mx-3"> </p>	
	</div>
</div>


    <div class="col-6 mx-auto">
  	<form action="/personality/checkEnd" method="POST" name="checkEnd">
  		<input type="hidden" name="m_id" id="id" value="${sessionScope.loginID}">
  		<input type="hidden" name="m_mbti" id="mbti" value="11">
  		<input type="hidden" name="m_profile" id="profile" value="11">
  		<input type="button" value="검사완료" class="btn btn-primary" onclick="checkend()">
	</form>
	</div>
</section>

     <div class="container" >
        <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
          
          <div class="col-md-4 d-flex align-items-center">
            <span class="text-muted">&copy; 2021 HSW, Project</span>
          </div>      
          <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
            <span>My git address</span>
            <li class="ms-3"><a class="text-muted" href="https://github.com/Git1Heo/MyProject"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
              <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
            </svg></a></li>
          </ul>
        </footer>
      </div>
      
              <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">로그인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>

              <div class="modal-body">
                  <body class="text-center">
          
                      <main class="form-signin">
                        <form action="login" method="post">                         
                          <h1 class="h3 mb-3 fw-normal">로그인</h1>
                      
                          <div class="form-floating">
                            <input type="text" class="form-control" name="m_id" id="floatingInput" placeholder="name@example.com">
                            <label for="floatingInput">Email address</label>
                          </div>
                          <div class="form-floating">
                            <input type="password" class="form-control" name="m_password" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword">Password</label>
                          </div>                      
                        
                      </main>
              </div>

              <div class="modal-footer">
                  <button class="w-100 btn btn-lg btn-primary" type="submit">Log in</button>
                  </form>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              </div>
					
            </div>
          </div>
        </div>

</body>
</html>