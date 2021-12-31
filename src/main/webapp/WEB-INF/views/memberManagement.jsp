<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	 header{
    background-color : blanchedalmond;
    height: 105px;   
  }

  #headline{
    height: 105px;  
  }
</style>

</head>
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
     	 <span>     ${sessionScope.loginID}님 환영합니다.</span>
     </c:if> 
     	 
      <c:if test="${empty sessionScope.loginID }">
        <button class="btn btn-outline-primary btn float-right" data-bs-toggle="modal" data-bs-target="#exampleModal" style="float: right;">Login</button>
      </c:if>
      
      <c:if test="${!empty sessionScope.loginID }">
        <a href="logout"><button class="btn btn-outline-primary" style="float: right;">Logout </button></a> 
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

 
  	<main style="background-color: rgb(250, 250, 250);">
	<h2 class="pt-5"> 운영자 전용 멤버관리 페이지 입니다. </h2>
	  <table class="table table-striped table-hover" style="width: 90%; margin-left: auto; margin-right: auto;">
        <thead>
            <tr>
                <th>회원 번호</th>
                <th>프로필 사진</th>
                <th>ID</th>
                <th>이름</th>
                <th>MBTI</th>
                <th>삭제</th>
            </tr>
        </thead>
   		 <c:forEach items="${member}" var="member">
			<tr>
				<td>${member.m_number}</td>
	   			<td><img alt="" src="/resources/upload/member/${member.m_profile}" class="img-responsive rounded-circle" style="height: 40px; width: 40px;"> </td> 				
				<td>${member.m_id} </td>
				<td>${member.m_name} </td>			
				<td>${member.m_mbti} </td>
				<td><a href="/memberManagement/delete?m_number=${member.m_number}">삭제</a> </td>
			 </tr> 
			<br>
		</c:forEach>
    </table>  
    </main>
        <!-- 푸터 -->
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
    

</body>
</html>