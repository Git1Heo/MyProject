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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="${path}/resources/css/header.css" rel="stylesheet"/> 
</head>
<body class="container" style="background-color: whitesmoke;">

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
  
<div class="content-wrapper container">
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-12">
            <div class="card  card-primary card-outline">
              <div class="card-body">
              	<div >
                <h4 class="px-4 text-start" style="display : inline"> ${board.b_number} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${board.b_title}</h4>
                </div>
           	   	<div class="d-grid gap-2 d-md-flex justify-content-md-end">           	   	                            
                <c:if test="${sessionScope.loginID == board.b_writer}">      
     			   <a href="/board/delete?b_number=${board.b_number}"><button class="btn btn-default" style="background-color: whitesmoke;">삭제</button></a>		   
     			</c:if> 
     			<c:if test="${sessionScope.loginID == board.b_writer}">	
        			<a href="/board/update?b_number=${board.b_number}&m_id=${sessionScope.loginID}"><button class="btn btn-default" style="background-color: whitesmoke;">수정</button></a>			
     			</c:if> 
                </div>
                
                <div class="card-body register-card-body">		
				      <table class="table table-write" id="add_mt">
						<colgroup>			
						<col style="width:120px" />
						<col style="width:*" />						
						</colgroup>
						<tr>						
							<th>작성자</th>
							<td>
								<img alt="" src="/resources/upload/member/${board.b_profile}" class="img-responsive rounded-circle" style="height: 40px; width: 40px;">
								<span>${board.b_mbti}</span>
								<span>${board.b_writer} </span>
								<p class="text-end">${board.b_date} <br> ${board.b_hits}회</p>
							</td>
						</tr>
						<tr>						
							<th>제목</th>
							<td><p class="pt-2">${board.b_title}</p></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<div class="border" style ="height : 600px;">
								<p>${board.b_contents}</p>
								</div>
							</td>
						</tr>
					</table>			      
			     	 <input type="hidden" name="b_number" value="${board.b_number }">

			    </div>		    
              </div>
            </div>
		  </div>
        </div>
      </div>
    </div>
  </div>





	
	<!-- 댓글목록출력 -->
	<div class="container" id="comment-list" >
	<div class="mx-auto border" style="width: 98%; background-color: rgb(250, 250, 250);" >
	<table class="table  ">
		<tr>
			<th style="width: 7%;">프로필</th>
			<th style="width: 5%;">성격유형</th>
			<th style="width: 10%;">작성자</th>
			<th style="width: 60%;">내용</th>
			<th>작성시간</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${commentList}" var="comment">
			<tr>		
			<td style="width: 5%;"><img alt="" src="/resources/upload/member/${comment.c_profile}" class="img-responsive rounded-circle mx-2" style="height: 35px; width: 35px;"></td>
			<td>${comment.c_mbti}</td>
			<td>${comment.c_writer}</td>
			<td>${comment.c_contents}</td>
			<td>${comment.c_date}</td>
			<c:if test="${sessionScope.loginID == comment.c_writer}">
			
				<td><a href="/board/comment/delete?b_number=${board.b_number}&c_number=${comment.c_number}&m_id=${sessionScope.loginID}"><button type="button" class="btn-close" aria-label="Close"></button></a> </td>
			</c:if>
			</tr>		
		</c:forEach>
	</table>
	
	<!-- 댓글 작성 -->
	<c:if test="${!empty sessionScope.loginID }">	
	<div class="input-group mb-2" id="comment-write">
		<input type="text" class="form-control" id="c_content" placeholder="댓글내용" >
  		<button class="btn btn-outline-secondary" type="button" id="comment-write-btn" style="background-color: whitesmoke;">댓글등록</button>
	</div>	
	</c:if>
	
	</div>
	
	</div>


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
                        <form>                         
                          <h1 class="h3 mb-3 fw-normal">로그인</h1>
                      
                          <div class="form-floating">
                            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                            <label for="floatingInput">Email address</label>
                          </div>
                          <div class="form-floating">
                            <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword">Password</label>
                          </div>                      
                        </form>
                      </main>
              </div>

              <div class="modal-footer">
                  <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              </div>

            </div>
          </div>
        </div>
        
</body>
<script>
const commentBtn =document.getElementById("comment-write-btn");
	commentBtn.addEventListener("click", function() {
		
	
	/* const c_writer=document = $("#c_writer").val(); */
	const c_writer='${sessionScope.loginID}';
 	const c_mbti='${member.m_mbti}';
	const c_profile='${member.m_profile}'; 
	const c_content=document = $("#c_content").val();
	const b_number = '${board.b_number}';
	console.log("ddd");
	$.ajax({
		type: 'post',
		url : 'comment/save',
		data:{'c_writer':c_writer,'c_contents':c_content,'b_number':b_number,'c_mbti':c_mbti,'c_profile' : c_profile},
		dataType:'json', 
		success:function(result){
			console.log(result);
			let output = "<table class='table'>";
			output += "<th>프로필</th>";
			output += "<th>mbti</th>";
			output += "<th>작성자</th>";
			output += "<th>내용</th>";
			output += "<th>작성시간</th>";
			output += "<th>삭제</th></tr>";
			for(let i in result){
				output += "<tr>";
				output += "<td>"+result[i].c_profile+"</td>";
				output += "<td>"+result[i].c_mbti+"</td>";
				output += "<td>"+result[i].c_writer+"</td>";
				output += "<td>"+result[i].c_contents+"</td>";
				output += "<td>"+result[i].c_date+"</td>";
				output += "</tr>";
			}
			output += "</table>";
			// id가 comment-list인 div에 출력
			document.getElementById('comment-list').innerHTML = output;
			// 댓글 입력창을 비움. 
			document.getElementById('c_writer').value='';
			document.getElementById('c_content').value='';
		},
		error:function(){
			console.log("오류오류")
		}
		
	});			
	});	
		

</script>

</html>