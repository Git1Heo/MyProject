<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<link href="${path}/resources/css/header.css" rel="stylesheet"/> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${path}/resources/css/check.css" rel="stylesheet"/> 

<script>

var arr = []; 
function update(clicked_id,event){
	
 	var value=parseInt(event.target.value); 
	console.log("id "+ clicked_id +" vlaue " +value)
	arr[clicked_id] = value;
	
	for(let i=0;i<arr.length;i++){
		console.log("[ " + i+ " ]  :  " + arr[i]);
	}
	
	var add=0;
	for(let i=0;i<arr.length;i++){
		add=add+arr[i];
	}	
	document.getElementById("end").value=add;	
/* 	var listVar = $('input[name=join1]:checked').val();
	console.log(listVar) */
}




function iiend(){
 	console.log("외않되?")
	if(arr.length>=20)
		checkEnd.submit();
	else
		alert("모든 항목을 체크하세요.");
 		
}
</script>
</head>
<body class="container" style="background-color: whitesmoke;">
	  <!-- 헤더 -->
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
  

  	<div>
  	
  <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">1. 외로울 때 속마음을 나눌 수 있는 친구가 있다.</p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="0" name="1" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="0" name="1" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="0" name="1" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="0" name="1" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="0" name="1" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>

  <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">2. 다른 사람들이 해내는 일이라면 나는 그보다 더 잘할 수 있다고 믿는다. </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="1" name="2" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="1" name="2" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="1" name="2" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="1" name="2" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="1" name="2" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>

  <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">3. 나의 성별에 대해 불만이 없다.</p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="2" name="3" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="2" name="3" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="2" name="3" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="2" name="3" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="2" name="3" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
   <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">4. 나를 알고 있는 사람들은 나에 호감을 가지고 있거나 긍정적인평가를 내리고 있다고 생각한다.</p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="3" name="4" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="3" name="4" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="3" name="4" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="3" name="4" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="3" name="4" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
   <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">5. 다른 사람의 칭찬을 크게 필요로 하지 않는다.</p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="4" name="5" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="4" name="5" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="4" name="5" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="4" name="5" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="4" name="5" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
   <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">6. 나는 내 외모에 자신감이 있으며 남보다 잘 생겼다고(예쁘다고) 생각한다. </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="5" name="6" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="5" name="6" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="5" name="6" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="5" name="6" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="5" name="6" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
   <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">7. 다른 사람의 비판에 상처받지 않고 잘 받아들이는 편이다. </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="6" name="7" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="6" name="7" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="6" name="7" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="6" name="7" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="6" name="7" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
   <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">8. 나는 공개적으로 내 실수를 인정하는 편이다.  </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="7" name="8" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="7" name="8" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="7" name="8" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="7" name="8" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="7" name="8" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
   <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">9. 잘 나가는 사람들을 보면 부러움과 질투보다는 '나도 그렇게 될 수 있다'는 생각을 먼저한다.  </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="8" name="9" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="8" name="9" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="8" name="9" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="8" name="9" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="8" name="9" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
   <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">10. 처음 보는 사람 앞에서 쉽게 주눅들지 않는다. </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="9" name="10" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="9" name="10" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="9" name="10" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="9" name="10" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="9" name="10" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
   <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">11. 나는 현재 다른 사람들보다 행복한 삶을 살고 있다고 생각한다. </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="10" name="11" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="10" name="11" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="10" name="11" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="10" name="11" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="10" name="11" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
   <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">12. 나는 웬만해서는 투덜대거나 화를 내지 않는다. </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="11" name="12" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="11" name="12" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="11" name="12" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="11" name="12" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="11" name="12" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
   <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">13. 일을 할 때 대체로 주도권을 잡고 진행하는 편이다. </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="12" name="13" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="12" name="13" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="12" name="13" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="12" name="13" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="12" name="13" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
     <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">14. 내가 의견을 내거나 말을 하면 다름 사람들이 주의 깊게 듣는 편이다.</p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="13" name="14" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="13" name="14" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="13" name="14" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="13" name="14" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="13" name="14" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
   <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">15. 나의 감정이나 생각하는 바를 언제나 분명히 표현할 수 있따. </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="14" name="15" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="14" name="15" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="14" name="15" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="14" name="15" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="14" name="15" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  	
  <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">16. 주변사람들로부터 긍정적이고 활기찬 성격이라는 말을 자주 듣는다. </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="15" name="16" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="15" name="16" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="15" name="16" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="15" name="16" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="15" name="16" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
   <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">17. 여가 시간에는 다른 사람과 활동을 하거나 새로운 것을 찾아다니는 편이다. </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="16" name="17" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="16" name="17" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="16" name="17" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="16" name="17" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="16" name="17" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
   <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">18. 낯선 사람에게 길을 물어볼 때 주저하지 않고 바로 다가가 물어본다. </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="17" name="18" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="17" name="18" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="17" name="18" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="17" name="18" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="17" name="18" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
  <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">19. 누군가 내 의견에 대해 반대를 하더라도 꿋꿋이 실행하는 편이다. </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="18" name="19" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="18" name="19" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="18" name="19" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="18" name="19" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="18" name="19" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
  <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">20. 지금껏 세워왔던 목표나 목적을 대체로 달성하면서 살아왔다고 생각한다. </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="19" name="20" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="19" name="20" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="19" name="20" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="19" name="20" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="19" name="20" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
  	</div>
 
 
    <div class="mx-auto col-1 mb-3 pb-5" >
  	<form action="/personality/checkEnd" method="get" name="checkEnd">
  		<input type="hidden" name="checkValue" id="end" value="11">
  		<input type="button" value="검사완료" class="btn btn-primary" onclick="iiend()">
	</form>
	</div>
	
	<!-- <a href="/personality/checkEnd"><button class="btn btn-primary">검사 완료</button></a> -->	
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