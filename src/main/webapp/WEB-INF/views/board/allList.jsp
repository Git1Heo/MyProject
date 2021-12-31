<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<link href="${path}/resources/css/header.css" rel="stylesheet"/> 
	<style>
a:link {
  text-decoration: none;
}
 
a:visited {
  text-decoration: none;
}
 
a:hover {
  text-decoration: underline;
}
 
a:active {
  text-decoration: underline;
}
	
	</style>
</head>
<body  class="container" style="background-color: whitesmoke;">

  <!-- 헤더 -->
  <header >
    <div  class="shadow p-3 mb-5 bg-body rounded opacity-75" id="headline">
      <div>
        <h4 class="text-center mt-2"><strong>게시판</strong></h4>
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

	<div  class="container" style="background-color: rgb(250, 250, 250);" >
	  <c:if test="${!empty sessionScope.loginID }">
     	 <a class="text-end" href="/board/boardWrite?m_id=${sessionScope.loginID }"> 글 작성</a>
      </c:if>


	<table class="table table-striped table-hover">
		<tr>
        	<th style="width: 8%;">글 번호</th>
       		<th style="width: 5%;">프로필사진</th>
       		<th style="width: 5%;">성격유형</th>
       		<th style="width: 10%;">작성자</th>
       		<th style="width: 50%;">제목</th>
       		<th>작성시간</th>
       		<th style="width: 5%;">조회수</th>
        </tr>
	<c:forEach items="${board}" var="b">
		<tr>
			<td class="mx-2">${b.b_number}</td>
			<td><img alt="" src="/resources/upload/member/${b.b_profile}" class="img-responsive rounded-circle" style="height: 40px; width: 40px;"></td>			
			<td>${b.b_mbti} </td>
			<td>${b.b_writer}</td>
			<td><a href="/board/view?b_number=${b.b_number}&m_id=${sessionScope.loginID}">${b.b_title}</a> </td>
			<td>${b.b_date}</td>
			<td class="px-3">${b.b_hits} </td>

	
		 </tr> 
		<br>
	</c:forEach>
	</table>
	
	<c:if test="${empty searchtype }">
 	<div class="col-2 mx-auto">
		<c:choose>				
			<c:when test="${paging.page<=1}"> 
				<p class="fw-bolder" style="display: inline-block;"> [이전]&nbsp; </p>
			</c:when>
			<c:otherwise>                     
		
				<p class="fw-bolder" style="display: inline-block;"><a href="paging?page=${paging.page-1}">[이전]</a>&nbsp;</p>
			</c:otherwise>
		</c:choose>
		
		
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
			<c:choose>
				<c:when test="${i eq paging.page}">
					<p class="fw-bolder" style="display: inline-block;">${i}</p>
				</c:when>
				<c:otherwise>
					<p class="fw-bolder" style="display: inline-block;"><a href="/board/paging?page=${i}">${i}</a></p>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				<p class="fw-bolder" style="display: inline-block;">[다음]</p>
			</c:when>
			<c:otherwise>
				<p class="fw-bolder" style="display: inline-block;"><a href="paging?page=${paging.page+1}">[다음]</a></p>
			</c:otherwise>
		</c:choose>
	</div> 
	</c:if>
	
	<c:if test="${!empty searchtype }">
	<div class="col-2 mx-auto">
		<c:choose>				
			<c:when test="${paging.page<=1}"> 
				<p class="fw-bolder" style="display: inline-block;">[이전]&nbsp;</p>
			</c:when>
			<c:otherwise>                     
		
				<p class="fw-bolder" style="display: inline-block;"><a href="search?searchtype=${searchtype}&keyword=${keyword}&page=${paging.page-1}">[이전]</a>&nbsp;</p>
			</c:otherwise>
		</c:choose>
		
		
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
			<c:choose>
				<c:when test="${i eq paging.page}">
					<p class="fw-bolder" style="display: inline-block;">${i}</p>
				</c:when>
				<c:otherwise>
					<p class="fw-bolder" style="display: inline-block;"><a href="search?searchtype=${searchtype}&keyword=${keyword}&page=${i}">${i}</a></p>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				<p class="fw-bolder" style="display: inline-block;">[다음]</p>
			</c:when>
			<c:otherwise>
			
				<p class="fw-bolder" style="display: inline-block;"><a href="search?searchtype=${searchtype}&keyword=${keyword}&page=${paging.page+1}">[다음]</a></p>
			</c:otherwise>
		</c:choose>
	</div>
	</c:if>
	
	
	<div class="col-4 mx-auto">
	<form action="/board/search" method="GET">
		<select name="searchtype">
			<option value="b_title">제목</option>
			<option value="b_writer">작성자</option> 
		</select>
			<input type="text" name="keyword" placeholder="검색어">
			<input type="hidden" name="page" value=1>
			<input type=submit value ="검색">
	</form>
	</div>
	
	</div>
	
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