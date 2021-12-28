<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script type="text/javascript">

const str =`a<br>
	b<br>
	c<br>`;
	
const str2 =`a2<br>
	b2<br>
	c2<br>`;

window.onload = function() {
	const result=document.getElementById("result");
	if(${value}<=10){
		result.innerHTML=str;
		document.getElementById("mbti").value="aaa";
		document.getElementById("profile").value="aaa.jpg";
	}
	
	else if(${value}>10){
		result.innerHTML=str2;
		document.getElementById("mbti").value="bbb";
		document.getElementById("profile").value="bbb.jpg";
	}
	
	
	}

function checkend(){
	
	checkEnd.submit();		
}

	

</script>
<body>
<h2>checkend</h2>
검사값 ${value}
	<div>
	<p id="result"> </p>
	
	</div>



    <div>
  	<form action="/personality/checkEnd" method="POST" name="checkEnd">
  		<input type="text" name="m_id" id="id" value="${sessionScope.loginID}">
  		<input type="text" name="m_mbti" id="mbti" value="11">
  		<input type="text" name="m_profile" id="profile" value="11">
  		<input type="button" value="검사완료" class="btn btn-primary" onclick="checkend()">
	</form>
	</div>
</body>
</html>