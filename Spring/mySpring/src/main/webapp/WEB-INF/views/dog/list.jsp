<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" />
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">Tables</h1>
		<button id='regBtn' type="button" class="btn btn-sm btn-info">글쓰기</button>
		<button id='donateBtn' type="button" class="btn btn-sm btn-info">기부하기</button>
		<p class="mb-4"></p>
		<table class="table table-hover" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th>번호</th>
					<th>설명</th>
					<th>이름</th>
					<th>나이</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dog" items="${dList}">
					<tr>
						<td>${dog.dogno}</td>
						<td><a href="/dog/read?dogno=${dog.dogno}">${dog.desc}</td>
						<td>${dog.name}</td>
						<td>${dog.age}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="modal" tabindex="-1" role="dialog" id='myModal'> 
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Modal title</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>Modal body text goes here.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary">Save
							changes</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
		<jsp:include
			page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp" />
			
			
		<script>
			$("#regBtn").on("click", function() {
				self.location = "/dog/write";
			});
			
// 			$("#donateBtn").on("click", function() {
// 				self.location = "/board/donate";
// 			});
			
			
			$(document).ready(function() { //
				let result = '<c:out value="${result}"/>';
				console.log('result :', result);
				checkModal(result);
				
				 function checkModal(result) {
					if (result === '') { return; }
						if(parseInt(result)>0){
							$('.modal-body > p').text("게시글"+     
							parseInt(result)+"이등록됨");
						}
						if (result === "modify") {
							$('.modal-body > p').text('수정이완료됨');
						}
						if (result === "remove") {
							$('.modal-body > p').text('삭제가완료됨');
						} 
						$("#myModal").modal("show");
					} //checkModal()의끝 */
				}); //document ready 끝
			
		</script>
</body>
</html>