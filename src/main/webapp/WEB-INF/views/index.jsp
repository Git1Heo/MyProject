<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="${path}/resources/css/header.css" rel="stylesheet"/> 

<style>

/* 메인 */
#maintab{
  height: 700px; 

}

</style>

</head>
<body class="container" style="background-color: whitesmoke;">

  <!-- 헤더 -->
  <header >
    <div  class="shadow p-3 mb-5 bg-body rounded opacity-75" id="headline" >
      <div>
        <h4 class="text-center mt-2"><strong>성격유형검사 게시판</strong></h4>
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


    <!-- 메인 구성 -->
    <main id="maintab" style="background-color: rgb(250, 250, 250);">

      <div> 

        
        <div id="maintitle" style="height: 200px; line-height: 200px;">
          <p class="text-center align-self-center" ><strong style="font-size: 25px;">성격유형검사와 게시판 기능을 제공하고 있습니다.</strong></p>
        </div>
        

        
        <div class="row" style="height: 400px;">
          <div class="col-md-2 mb-3 w-50 ">    
            <div style="text-align: center">
                <a href="/personality/check"><img src="https://dasima.xyz/wp-content/uploads/2018/09/img-src-ufo-1.png" style="height: 300px;" width="230px" class="center-block" ></a>
            </div>           
              <p class="text-center">MBTI 검사</p>
          </div>

          <div class="col-md-2 mb-3 w-50 " id="board">    
            <div style="text-align: center">
              <a href = "/board/paging"><img src="https://dasima.xyz/wp-content/uploads/2018/09/img-src-ufo-1.png" style="height: 300px;" width="230px" class="center-block" ></a>
            </div>           
              <p class="text-center">게시판</p>
          </div>         
        </div>
        
		<c:if test="${sessionScope.loginID eq 'admin'}">
        	<a href="memberManagement" class="text-center mt-10" >운영자용 페이지</a>
		</c:if>
      </div>

    </main>


    <!-- 푸터 -->
      <div class="container">
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