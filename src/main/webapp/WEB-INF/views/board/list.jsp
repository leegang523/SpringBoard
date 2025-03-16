<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 라이브러리 코드 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script
		    src="https://code.jquery.com/jquery-3.6.4.min.js"
		    integrity="sha384-UG8ao2jwOWB7/oDdObZc6ItJmwUkR/PfMyt9Qs5AwX7PsnYn1CRKCTWyncPTWvaS"
		    crossorigin="anonymous">
		</script>
		<style>
		a{
			text-decoration : none;
		}
		table{
			border-collapse: collapse;
			width: 1000px;    
			margin-top : 20px;
			text-align: center;
		}
		td, th{
			border : 1px solid black;
			height: 50px;
		}
		th{
			font-size : 17px;
		}
		thead{
			font-weight: 700;
		}
		.table_wrap{
			margin : 50px 0 0 50px;
		}
		.bno_width{
			width: 12%;
		}
		.writer_width{
			width: 20%;
		}
		.regdate_width{
			width: 15%;
		}
		.updatedate_width{
			width: 15%;
		}
		.top_btn{
			font-size: 20px;
			padding: 6px 12px;
			background-color: #fff;
			border: 1px solid #ddd;
			font-weight: 600;
		}
		</style>
	</head>

	<body>
		<h1>목록페이지입니다.</h1>
		<div class="table_wrap">
		<a href="/board/enroll" class="top_btn">게시판 등록</a>
		<table>
			<thead>
				<tr>
					<th class="bno_width">번호</th>
					<th class="title_width">제목</th>
					<th class="writer_width">작성자</th>
					<th class="regdate_width">작성일</th>
					<th class="updatedate_width">수정일</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="list">
	            <tr>
	                <td><c:out value="${list.bno}"/></td>
	                <td>
	                  	<a class="move" href='<c:out value="${list.bno}"/>'>
					        <c:out value="${list.title}"/>
					    </a>
				    </td>
	                <td><c:out value="${list.writer}"/></td>
	                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
                	<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></td>
	            </tr>
        	</c:forEach>
		</table>
		<form id="moveForm" method="get">    
    	</form>
		</div>
		
		<script>
			let moveForm = $("#moveForm");
			
			//페이지 로딩 시 반드시 실행
		    $(document).ready(function(){
		    	let result = '<c:out value="${result}"/>'
		    	
		    	checkAlert(result);
		    	
		    	function checkAlert(result){
		    		console.log("Received result:", result); // 값 확인용
		    		if(result === ''){
					          return;
					}
					      
	    	        if(result === "enrol success"){
	    	            alert("등록이 완료되었습니다.");
	    	        }
	    	        
	    	        if(result === "modify success"){
	    	            alert("수정이 완료되었습니다.");
	    	        }
	    	        
	    	        if(result === "delete success"){
	    	            alert("삭제가 완료되었습니다.");
	    	        }
		    	}
		 
		    });
		 	
			//<a> 태그 작동
		    
		    $(".move").on("click", function(e){
		        e.preventDefault();
		        let bnoValue = $(this).attr("href"); // 현재 href 값 가져오기
		        
		        // href 값이 숫자일 경우 절대 경로로 변환
		        if (!bnoValue.includes("?bno=")) {
		            bnoValue = "/board/get?bno=" + bnoValue;
		        }

		        moveForm.empty(); // 기존 폼 내용 초기화
		        moveForm.append("<input type='hidden' name='bno' value='"+bnoValue.split("=")[1]+"'>");
		        moveForm.attr("action", "/board/get");
		        moveForm.submit();
		    });

		</script>	
	</body>
</html>